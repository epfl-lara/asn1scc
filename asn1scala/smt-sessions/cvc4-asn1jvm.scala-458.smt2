; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12556 () Bool)

(assert start!12556)

(declare-fun b!64221 () Bool)

(declare-fun res!53343 () Bool)

(declare-fun e!42444 () Bool)

(assert (=> b!64221 (=> res!53343 e!42444)))

(declare-datatypes ((List!695 0))(
  ( (Nil!692) (Cons!691 (h!810 Bool) (t!1445 List!695)) )
))
(declare-fun lt!101367 () List!695)

(declare-fun length!323 (List!695) Int)

(assert (=> b!64221 (= res!53343 (<= (length!323 lt!101367) 0))))

(declare-fun b!64222 () Bool)

(declare-fun e!42441 () Bool)

(declare-datatypes ((array!2819 0))(
  ( (array!2820 (arr!1858 (Array (_ BitVec 32) (_ BitVec 8))) (size!1294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2240 0))(
  ( (BitStream!2241 (buf!1675 array!2819) (currentByte!3329 (_ BitVec 32)) (currentBit!3324 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2240)

(declare-fun array_inv!1179 (array!2819) Bool)

(assert (=> b!64222 (= e!42441 (array_inv!1179 (buf!1675 thiss!1379)))))

(declare-fun b!64223 () Bool)

(declare-fun e!42448 () Bool)

(declare-fun e!42440 () Bool)

(assert (=> b!64223 (= e!42448 e!42440)))

(declare-fun res!53336 () Bool)

(assert (=> b!64223 (=> res!53336 e!42440)))

(declare-datatypes ((Unit!4353 0))(
  ( (Unit!4354) )
))
(declare-datatypes ((tuple2!5744 0))(
  ( (tuple2!5745 (_1!2983 Unit!4353) (_2!2983 BitStream!2240)) )
))
(declare-fun lt!101372 () tuple2!5744)

(declare-fun lt!101365 () tuple2!5744)

(assert (=> b!64223 (= res!53336 (not (= (size!1294 (buf!1675 (_2!2983 lt!101372))) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))

(declare-fun e!42449 () Bool)

(assert (=> b!64223 e!42449))

(declare-fun res!53335 () Bool)

(assert (=> b!64223 (=> (not res!53335) (not e!42449))))

(assert (=> b!64223 (= res!53335 (= (size!1294 (buf!1675 (_2!2983 lt!101365))) (size!1294 (buf!1675 thiss!1379))))))

(declare-fun res!53337 () Bool)

(declare-fun e!42447 () Bool)

(assert (=> start!12556 (=> (not res!53337) (not e!42447))))

(declare-fun srcBuffer!2 () array!2819)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12556 (= res!53337 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1294 srcBuffer!2))))))))

(assert (=> start!12556 e!42447))

(assert (=> start!12556 true))

(assert (=> start!12556 (array_inv!1179 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2240) Bool)

(assert (=> start!12556 (and (inv!12 thiss!1379) e!42441)))

(declare-fun b!64224 () Bool)

(declare-fun res!53333 () Bool)

(assert (=> b!64224 (=> res!53333 e!42444)))

(declare-datatypes ((tuple2!5746 0))(
  ( (tuple2!5747 (_1!2984 BitStream!2240) (_2!2984 BitStream!2240)) )
))
(declare-fun lt!101369 () tuple2!5746)

(declare-fun lt!101373 () tuple2!5746)

(declare-fun isPrefixOf!0 (BitStream!2240 BitStream!2240) Bool)

(assert (=> b!64224 (= res!53333 (not (isPrefixOf!0 (_1!2984 lt!101369) (_1!2984 lt!101373))))))

(declare-fun b!64225 () Bool)

(declare-fun res!53340 () Bool)

(assert (=> b!64225 (=> (not res!53340) (not e!42447))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64225 (= res!53340 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!64226 () Bool)

(declare-fun res!53346 () Bool)

(assert (=> b!64226 (=> res!53346 e!42440)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64226 (= res!53346 (not (invariant!0 (currentBit!3324 (_2!2983 lt!101372)) (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101372))))))))

(declare-fun b!64227 () Bool)

(declare-fun res!53334 () Bool)

(assert (=> b!64227 (=> res!53334 e!42448)))

(assert (=> b!64227 (= res!53334 (not (= (size!1294 (buf!1675 thiss!1379)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))

(declare-fun b!64228 () Bool)

(declare-fun e!42442 () Bool)

(declare-fun e!42439 () Bool)

(assert (=> b!64228 (= e!42442 e!42439)))

(declare-fun res!53348 () Bool)

(assert (=> b!64228 (=> res!53348 e!42439)))

(assert (=> b!64228 (= res!53348 (not (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101365))))))

(assert (=> b!64228 (isPrefixOf!0 thiss!1379 (_2!2983 lt!101365))))

(declare-fun lt!101362 () Unit!4353)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2240 BitStream!2240 BitStream!2240) Unit!4353)

(assert (=> b!64228 (= lt!101362 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2983 lt!101372) (_2!2983 lt!101365)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2240 array!2819 (_ BitVec 64) (_ BitVec 64)) tuple2!5744)

(assert (=> b!64228 (= lt!101365 (appendBitsMSBFirstLoop!0 (_2!2983 lt!101372) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42445 () Bool)

(assert (=> b!64228 e!42445))

(declare-fun res!53341 () Bool)

(assert (=> b!64228 (=> (not res!53341) (not e!42445))))

(assert (=> b!64228 (= res!53341 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101370 () Unit!4353)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2240 array!2819 (_ BitVec 64)) Unit!4353)

(assert (=> b!64228 (= lt!101370 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1675 (_2!2983 lt!101372)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101371 () tuple2!5746)

(declare-fun reader!0 (BitStream!2240 BitStream!2240) tuple2!5746)

(assert (=> b!64228 (= lt!101371 (reader!0 thiss!1379 (_2!2983 lt!101372)))))

(declare-fun b!64229 () Bool)

(declare-fun res!53338 () Bool)

(assert (=> b!64229 (=> res!53338 e!42444)))

(assert (=> b!64229 (= res!53338 (not (isPrefixOf!0 (_1!2984 lt!101369) (_2!2983 lt!101365))))))

(declare-fun b!64230 () Bool)

(declare-fun e!42443 () Bool)

(assert (=> b!64230 (= e!42447 (not e!42443))))

(declare-fun res!53344 () Bool)

(assert (=> b!64230 (=> res!53344 e!42443)))

(assert (=> b!64230 (= res!53344 (bvsge i!635 to!314))))

(assert (=> b!64230 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101366 () Unit!4353)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2240) Unit!4353)

(assert (=> b!64230 (= lt!101366 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!101363 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64230 (= lt!101363 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(declare-fun b!64231 () Bool)

(declare-fun res!53332 () Bool)

(assert (=> b!64231 (=> res!53332 e!42440)))

(assert (=> b!64231 (= res!53332 (not (invariant!0 (currentBit!3324 (_2!2983 lt!101372)) (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))

(declare-fun b!64232 () Bool)

(declare-fun head!514 (List!695) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2240 array!2819 (_ BitVec 64) (_ BitVec 64)) List!695)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2240 BitStream!2240 (_ BitVec 64)) List!695)

(assert (=> b!64232 (= e!42445 (= (head!514 (byteArrayBitContentToList!0 (_2!2983 lt!101372) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!514 (bitStreamReadBitsIntoList!0 (_2!2983 lt!101372) (_1!2984 lt!101371) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!64233 () Bool)

(declare-fun res!53342 () Bool)

(assert (=> b!64233 (=> res!53342 e!42444)))

(assert (=> b!64233 (= res!53342 (not (isPrefixOf!0 (_1!2984 lt!101373) (_2!2983 lt!101365))))))

(declare-fun b!64234 () Bool)

(declare-fun res!53345 () Bool)

(assert (=> b!64234 (=> res!53345 e!42444)))

(declare-fun lt!101364 () (_ BitVec 64))

(assert (=> b!64234 (= res!53345 (or (not (= (buf!1675 (_1!2984 lt!101369)) (buf!1675 (_1!2984 lt!101373)))) (not (= (buf!1675 (_1!2984 lt!101369)) (buf!1675 (_2!2983 lt!101365)))) (bvsge lt!101364 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!64235 () Bool)

(assert (=> b!64235 (= e!42443 e!42442)))

(declare-fun res!53339 () Bool)

(assert (=> b!64235 (=> res!53339 e!42442)))

(assert (=> b!64235 (= res!53339 (not (isPrefixOf!0 thiss!1379 (_2!2983 lt!101372))))))

(declare-fun lt!101361 () (_ BitVec 64))

(assert (=> b!64235 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!101361)))

(assert (=> b!64235 (= lt!101361 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101374 () Unit!4353)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2240 BitStream!2240 (_ BitVec 64) (_ BitVec 64)) Unit!4353)

(assert (=> b!64235 (= lt!101374 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2983 lt!101372) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2240 (_ BitVec 8) (_ BitVec 32)) tuple2!5744)

(assert (=> b!64235 (= lt!101372 (appendBitFromByte!0 thiss!1379 (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64236 () Bool)

(assert (=> b!64236 (= e!42444 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369)))) (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101373))) (currentByte!3329 (_1!2984 lt!101373)) (currentBit!3324 (_1!2984 lt!101373)))))))

(declare-fun b!64237 () Bool)

(assert (=> b!64237 (= e!42439 e!42448)))

(declare-fun res!53347 () Bool)

(assert (=> b!64237 (=> res!53347 e!42448)))

(assert (=> b!64237 (= res!53347 (not (= lt!101364 (bvsub (bvadd lt!101363 to!314) i!635))))))

(assert (=> b!64237 (= lt!101364 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365))))))

(declare-fun b!64238 () Bool)

(assert (=> b!64238 (= e!42440 e!42444)))

(declare-fun res!53349 () Bool)

(assert (=> b!64238 (=> res!53349 e!42444)))

(assert (=> b!64238 (= res!53349 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101359 () List!695)

(assert (=> b!64238 (= lt!101359 (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_1!2984 lt!101373) lt!101361))))

(assert (=> b!64238 (= lt!101367 (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_1!2984 lt!101369) (bvsub to!314 i!635)))))

(assert (=> b!64238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!101361)))

(declare-fun lt!101360 () Unit!4353)

(assert (=> b!64238 (= lt!101360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!101365)) lt!101361))))

(assert (=> b!64238 (= lt!101373 (reader!0 (_2!2983 lt!101372) (_2!2983 lt!101365)))))

(assert (=> b!64238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101368 () Unit!4353)

(assert (=> b!64238 (= lt!101368 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1675 (_2!2983 lt!101365)) (bvsub to!314 i!635)))))

(assert (=> b!64238 (= lt!101369 (reader!0 thiss!1379 (_2!2983 lt!101365)))))

(declare-fun b!64239 () Bool)

(assert (=> b!64239 (= e!42449 (= lt!101364 (bvsub (bvsub (bvadd (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64240 () Bool)

(declare-fun res!53331 () Bool)

(assert (=> b!64240 (=> res!53331 e!42448)))

(assert (=> b!64240 (= res!53331 (not (invariant!0 (currentBit!3324 (_2!2983 lt!101365)) (currentByte!3329 (_2!2983 lt!101365)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))

(assert (= (and start!12556 res!53337) b!64225))

(assert (= (and b!64225 res!53340) b!64230))

(assert (= (and b!64230 (not res!53344)) b!64235))

(assert (= (and b!64235 (not res!53339)) b!64228))

(assert (= (and b!64228 res!53341) b!64232))

(assert (= (and b!64228 (not res!53348)) b!64237))

(assert (= (and b!64237 (not res!53347)) b!64240))

(assert (= (and b!64240 (not res!53331)) b!64227))

(assert (= (and b!64227 (not res!53334)) b!64223))

(assert (= (and b!64223 res!53335) b!64239))

(assert (= (and b!64223 (not res!53336)) b!64226))

(assert (= (and b!64226 (not res!53346)) b!64231))

(assert (= (and b!64231 (not res!53332)) b!64238))

(assert (= (and b!64238 (not res!53349)) b!64221))

(assert (= (and b!64221 (not res!53343)) b!64229))

(assert (= (and b!64229 (not res!53338)) b!64233))

(assert (= (and b!64233 (not res!53342)) b!64224))

(assert (= (and b!64224 (not res!53333)) b!64234))

(assert (= (and b!64234 (not res!53345)) b!64236))

(assert (= start!12556 b!64222))

(declare-fun m!101821 () Bool)

(assert (=> b!64231 m!101821))

(declare-fun m!101823 () Bool)

(assert (=> b!64230 m!101823))

(declare-fun m!101825 () Bool)

(assert (=> b!64230 m!101825))

(declare-fun m!101827 () Bool)

(assert (=> b!64230 m!101827))

(declare-fun m!101829 () Bool)

(assert (=> b!64225 m!101829))

(declare-fun m!101831 () Bool)

(assert (=> b!64229 m!101831))

(declare-fun m!101833 () Bool)

(assert (=> b!64237 m!101833))

(declare-fun m!101835 () Bool)

(assert (=> b!64226 m!101835))

(declare-fun m!101837 () Bool)

(assert (=> b!64239 m!101837))

(declare-fun m!101839 () Bool)

(assert (=> start!12556 m!101839))

(declare-fun m!101841 () Bool)

(assert (=> start!12556 m!101841))

(declare-fun m!101843 () Bool)

(assert (=> b!64233 m!101843))

(declare-fun m!101845 () Bool)

(assert (=> b!64224 m!101845))

(declare-fun m!101847 () Bool)

(assert (=> b!64232 m!101847))

(assert (=> b!64232 m!101847))

(declare-fun m!101849 () Bool)

(assert (=> b!64232 m!101849))

(declare-fun m!101851 () Bool)

(assert (=> b!64232 m!101851))

(assert (=> b!64232 m!101851))

(declare-fun m!101853 () Bool)

(assert (=> b!64232 m!101853))

(declare-fun m!101855 () Bool)

(assert (=> b!64238 m!101855))

(declare-fun m!101857 () Bool)

(assert (=> b!64238 m!101857))

(declare-fun m!101859 () Bool)

(assert (=> b!64238 m!101859))

(declare-fun m!101861 () Bool)

(assert (=> b!64238 m!101861))

(declare-fun m!101863 () Bool)

(assert (=> b!64238 m!101863))

(declare-fun m!101865 () Bool)

(assert (=> b!64238 m!101865))

(declare-fun m!101867 () Bool)

(assert (=> b!64238 m!101867))

(declare-fun m!101869 () Bool)

(assert (=> b!64238 m!101869))

(declare-fun m!101871 () Bool)

(assert (=> b!64228 m!101871))

(declare-fun m!101873 () Bool)

(assert (=> b!64228 m!101873))

(declare-fun m!101875 () Bool)

(assert (=> b!64228 m!101875))

(declare-fun m!101877 () Bool)

(assert (=> b!64228 m!101877))

(declare-fun m!101879 () Bool)

(assert (=> b!64228 m!101879))

(declare-fun m!101881 () Bool)

(assert (=> b!64228 m!101881))

(declare-fun m!101883 () Bool)

(assert (=> b!64228 m!101883))

(declare-fun m!101885 () Bool)

(assert (=> b!64221 m!101885))

(declare-fun m!101887 () Bool)

(assert (=> b!64235 m!101887))

(declare-fun m!101889 () Bool)

(assert (=> b!64235 m!101889))

(declare-fun m!101891 () Bool)

(assert (=> b!64235 m!101891))

(declare-fun m!101893 () Bool)

(assert (=> b!64235 m!101893))

(assert (=> b!64235 m!101887))

(declare-fun m!101895 () Bool)

(assert (=> b!64235 m!101895))

(declare-fun m!101897 () Bool)

(assert (=> b!64222 m!101897))

(declare-fun m!101899 () Bool)

(assert (=> b!64240 m!101899))

(declare-fun m!101901 () Bool)

(assert (=> b!64236 m!101901))

(declare-fun m!101903 () Bool)

(assert (=> b!64236 m!101903))

(push 1)

(assert (not b!64228))

(assert (not b!64230))

(assert (not b!64224))

(assert (not b!64225))

(assert (not b!64222))

(assert (not b!64238))

(assert (not b!64240))

(assert (not start!12556))

(assert (not b!64229))

(assert (not b!64221))

(assert (not b!64226))

(assert (not b!64231))

(assert (not b!64239))

(assert (not b!64235))

(assert (not b!64233))

(assert (not b!64232))

(assert (not b!64237))

(assert (not b!64236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20028 () Bool)

(assert (=> d!20028 (= (invariant!0 (currentBit!3324 (_2!2983 lt!101365)) (currentByte!3329 (_2!2983 lt!101365)) (size!1294 (buf!1675 (_2!2983 lt!101365)))) (and (bvsge (currentBit!3324 (_2!2983 lt!101365)) #b00000000000000000000000000000000) (bvslt (currentBit!3324 (_2!2983 lt!101365)) #b00000000000000000000000000001000) (bvsge (currentByte!3329 (_2!2983 lt!101365)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3329 (_2!2983 lt!101365)) (size!1294 (buf!1675 (_2!2983 lt!101365)))) (and (= (currentBit!3324 (_2!2983 lt!101365)) #b00000000000000000000000000000000) (= (currentByte!3329 (_2!2983 lt!101365)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))))

(assert (=> b!64240 d!20028))

(declare-fun d!20034 () Bool)

(declare-fun res!53442 () Bool)

(declare-fun e!42507 () Bool)

(assert (=> d!20034 (=> (not res!53442) (not e!42507))))

(assert (=> d!20034 (= res!53442 (= (size!1294 (buf!1675 (_1!2984 lt!101369))) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (=> d!20034 (= (isPrefixOf!0 (_1!2984 lt!101369) (_2!2983 lt!101365)) e!42507)))

(declare-fun b!64342 () Bool)

(declare-fun res!53443 () Bool)

(assert (=> b!64342 (=> (not res!53443) (not e!42507))))

(assert (=> b!64342 (= res!53443 (bvsle (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369))) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365)))))))

(declare-fun b!64343 () Bool)

(declare-fun e!42506 () Bool)

(assert (=> b!64343 (= e!42507 e!42506)))

(declare-fun res!53444 () Bool)

(assert (=> b!64343 (=> res!53444 e!42506)))

(assert (=> b!64343 (= res!53444 (= (size!1294 (buf!1675 (_1!2984 lt!101369))) #b00000000000000000000000000000000))))

(declare-fun b!64344 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2819 array!2819 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64344 (= e!42506 (arrayBitRangesEq!0 (buf!1675 (_1!2984 lt!101369)) (buf!1675 (_2!2983 lt!101365)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369)))))))

(assert (= (and d!20034 res!53442) b!64342))

(assert (= (and b!64342 res!53443) b!64343))

(assert (= (and b!64343 (not res!53444)) b!64344))

(assert (=> b!64342 m!101901))

(assert (=> b!64342 m!101833))

(assert (=> b!64344 m!101901))

(assert (=> b!64344 m!101901))

(declare-fun m!102023 () Bool)

(assert (=> b!64344 m!102023))

(assert (=> b!64229 d!20034))

(declare-fun d!20042 () Bool)

(declare-fun res!53445 () Bool)

(declare-fun e!42509 () Bool)

(assert (=> d!20042 (=> (not res!53445) (not e!42509))))

(assert (=> d!20042 (= res!53445 (= (size!1294 (buf!1675 (_2!2983 lt!101372))) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (=> d!20042 (= (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101365)) e!42509)))

(declare-fun b!64345 () Bool)

(declare-fun res!53446 () Bool)

(assert (=> b!64345 (=> (not res!53446) (not e!42509))))

(assert (=> b!64345 (= res!53446 (bvsle (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365)))))))

(declare-fun b!64346 () Bool)

(declare-fun e!42508 () Bool)

(assert (=> b!64346 (= e!42509 e!42508)))

(declare-fun res!53447 () Bool)

(assert (=> b!64346 (=> res!53447 e!42508)))

(assert (=> b!64346 (= res!53447 (= (size!1294 (buf!1675 (_2!2983 lt!101372))) #b00000000000000000000000000000000))))

(declare-fun b!64347 () Bool)

(assert (=> b!64347 (= e!42508 (arrayBitRangesEq!0 (buf!1675 (_2!2983 lt!101372)) (buf!1675 (_2!2983 lt!101365)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372)))))))

(assert (= (and d!20042 res!53445) b!64345))

(assert (= (and b!64345 res!53446) b!64346))

(assert (= (and b!64346 (not res!53447)) b!64347))

(assert (=> b!64345 m!101837))

(assert (=> b!64345 m!101833))

(assert (=> b!64347 m!101837))

(assert (=> b!64347 m!101837))

(declare-fun m!102025 () Bool)

(assert (=> b!64347 m!102025))

(assert (=> b!64228 d!20042))

(declare-fun d!20044 () Bool)

(assert (=> d!20044 (isPrefixOf!0 thiss!1379 (_2!2983 lt!101365))))

(declare-fun lt!101545 () Unit!4353)

(declare-fun choose!30 (BitStream!2240 BitStream!2240 BitStream!2240) Unit!4353)

(assert (=> d!20044 (= lt!101545 (choose!30 thiss!1379 (_2!2983 lt!101372) (_2!2983 lt!101365)))))

(assert (=> d!20044 (isPrefixOf!0 thiss!1379 (_2!2983 lt!101372))))

(assert (=> d!20044 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2983 lt!101372) (_2!2983 lt!101365)) lt!101545)))

(declare-fun bs!4924 () Bool)

(assert (= bs!4924 d!20044))

(assert (=> bs!4924 m!101881))

(declare-fun m!102027 () Bool)

(assert (=> bs!4924 m!102027))

(assert (=> bs!4924 m!101893))

(assert (=> b!64228 d!20044))

(declare-fun b!64387 () Bool)

(declare-fun res!53465 () Bool)

(declare-fun e!42529 () Bool)

(assert (=> b!64387 (=> (not res!53465) (not e!42529))))

(declare-fun lt!101629 () tuple2!5746)

(assert (=> b!64387 (= res!53465 (isPrefixOf!0 (_1!2984 lt!101629) thiss!1379))))

(declare-fun d!20046 () Bool)

(assert (=> d!20046 e!42529))

(declare-fun res!53467 () Bool)

(assert (=> d!20046 (=> (not res!53467) (not e!42529))))

(assert (=> d!20046 (= res!53467 (isPrefixOf!0 (_1!2984 lt!101629) (_2!2984 lt!101629)))))

(declare-fun lt!101625 () BitStream!2240)

(assert (=> d!20046 (= lt!101629 (tuple2!5747 lt!101625 (_2!2983 lt!101372)))))

(declare-fun lt!101630 () Unit!4353)

(declare-fun lt!101638 () Unit!4353)

(assert (=> d!20046 (= lt!101630 lt!101638)))

(assert (=> d!20046 (isPrefixOf!0 lt!101625 (_2!2983 lt!101372))))

(assert (=> d!20046 (= lt!101638 (lemmaIsPrefixTransitive!0 lt!101625 (_2!2983 lt!101372) (_2!2983 lt!101372)))))

(declare-fun lt!101635 () Unit!4353)

(declare-fun lt!101639 () Unit!4353)

(assert (=> d!20046 (= lt!101635 lt!101639)))

(assert (=> d!20046 (isPrefixOf!0 lt!101625 (_2!2983 lt!101372))))

(assert (=> d!20046 (= lt!101639 (lemmaIsPrefixTransitive!0 lt!101625 thiss!1379 (_2!2983 lt!101372)))))

(declare-fun lt!101642 () Unit!4353)

(declare-fun e!42530 () Unit!4353)

(assert (=> d!20046 (= lt!101642 e!42530)))

(declare-fun c!4621 () Bool)

(assert (=> d!20046 (= c!4621 (not (= (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101633 () Unit!4353)

(declare-fun lt!101641 () Unit!4353)

(assert (=> d!20046 (= lt!101633 lt!101641)))

(assert (=> d!20046 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101372))))

(assert (=> d!20046 (= lt!101641 (lemmaIsPrefixRefl!0 (_2!2983 lt!101372)))))

(declare-fun lt!101627 () Unit!4353)

(declare-fun lt!101637 () Unit!4353)

(assert (=> d!20046 (= lt!101627 lt!101637)))

(assert (=> d!20046 (= lt!101637 (lemmaIsPrefixRefl!0 (_2!2983 lt!101372)))))

(declare-fun lt!101632 () Unit!4353)

(declare-fun lt!101628 () Unit!4353)

(assert (=> d!20046 (= lt!101632 lt!101628)))

(assert (=> d!20046 (isPrefixOf!0 lt!101625 lt!101625)))

(assert (=> d!20046 (= lt!101628 (lemmaIsPrefixRefl!0 lt!101625))))

(declare-fun lt!101634 () Unit!4353)

(declare-fun lt!101643 () Unit!4353)

(assert (=> d!20046 (= lt!101634 lt!101643)))

(assert (=> d!20046 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20046 (= lt!101643 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20046 (= lt!101625 (BitStream!2241 (buf!1675 (_2!2983 lt!101372)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(assert (=> d!20046 (isPrefixOf!0 thiss!1379 (_2!2983 lt!101372))))

(assert (=> d!20046 (= (reader!0 thiss!1379 (_2!2983 lt!101372)) lt!101629)))

(declare-fun b!64388 () Bool)

(declare-fun lt!101644 () Unit!4353)

(assert (=> b!64388 (= e!42530 lt!101644)))

(declare-fun lt!101631 () (_ BitVec 64))

(assert (=> b!64388 (= lt!101631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101636 () (_ BitVec 64))

(assert (=> b!64388 (= lt!101636 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2819 array!2819 (_ BitVec 64) (_ BitVec 64)) Unit!4353)

(assert (=> b!64388 (= lt!101644 (arrayBitRangesEqSymmetric!0 (buf!1675 thiss!1379) (buf!1675 (_2!2983 lt!101372)) lt!101631 lt!101636))))

(assert (=> b!64388 (arrayBitRangesEq!0 (buf!1675 (_2!2983 lt!101372)) (buf!1675 thiss!1379) lt!101631 lt!101636)))

(declare-fun b!64389 () Bool)

(declare-fun Unit!4365 () Unit!4353)

(assert (=> b!64389 (= e!42530 Unit!4365)))

(declare-fun lt!101626 () (_ BitVec 64))

(declare-fun lt!101640 () (_ BitVec 64))

(declare-fun b!64390 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2240 (_ BitVec 64)) BitStream!2240)

(assert (=> b!64390 (= e!42529 (= (_1!2984 lt!101629) (withMovedBitIndex!0 (_2!2984 lt!101629) (bvsub lt!101626 lt!101640))))))

(assert (=> b!64390 (or (= (bvand lt!101626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101626 lt!101640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64390 (= lt!101640 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(assert (=> b!64390 (= lt!101626 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(declare-fun b!64391 () Bool)

(declare-fun res!53466 () Bool)

(assert (=> b!64391 (=> (not res!53466) (not e!42529))))

(assert (=> b!64391 (= res!53466 (isPrefixOf!0 (_2!2984 lt!101629) (_2!2983 lt!101372)))))

(assert (= (and d!20046 c!4621) b!64388))

(assert (= (and d!20046 (not c!4621)) b!64389))

(assert (= (and d!20046 res!53467) b!64387))

(assert (= (and b!64387 res!53465) b!64391))

(assert (= (and b!64391 res!53466) b!64390))

(assert (=> b!64388 m!101827))

(declare-fun m!102075 () Bool)

(assert (=> b!64388 m!102075))

(declare-fun m!102077 () Bool)

(assert (=> b!64388 m!102077))

(declare-fun m!102079 () Bool)

(assert (=> b!64390 m!102079))

(assert (=> b!64390 m!101837))

(assert (=> b!64390 m!101827))

(declare-fun m!102081 () Bool)

(assert (=> b!64391 m!102081))

(declare-fun m!102083 () Bool)

(assert (=> b!64387 m!102083))

(assert (=> d!20046 m!101893))

(assert (=> d!20046 m!101825))

(declare-fun m!102085 () Bool)

(assert (=> d!20046 m!102085))

(declare-fun m!102087 () Bool)

(assert (=> d!20046 m!102087))

(declare-fun m!102089 () Bool)

(assert (=> d!20046 m!102089))

(declare-fun m!102091 () Bool)

(assert (=> d!20046 m!102091))

(declare-fun m!102093 () Bool)

(assert (=> d!20046 m!102093))

(declare-fun m!102095 () Bool)

(assert (=> d!20046 m!102095))

(declare-fun m!102097 () Bool)

(assert (=> d!20046 m!102097))

(declare-fun m!102099 () Bool)

(assert (=> d!20046 m!102099))

(assert (=> d!20046 m!101823))

(assert (=> b!64228 d!20046))

(declare-fun d!20066 () Bool)

(declare-fun res!53468 () Bool)

(declare-fun e!42532 () Bool)

(assert (=> d!20066 (=> (not res!53468) (not e!42532))))

(assert (=> d!20066 (= res!53468 (= (size!1294 (buf!1675 thiss!1379)) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (=> d!20066 (= (isPrefixOf!0 thiss!1379 (_2!2983 lt!101365)) e!42532)))

(declare-fun b!64392 () Bool)

(declare-fun res!53469 () Bool)

(assert (=> b!64392 (=> (not res!53469) (not e!42532))))

(assert (=> b!64392 (= res!53469 (bvsle (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365)))))))

(declare-fun b!64393 () Bool)

(declare-fun e!42531 () Bool)

(assert (=> b!64393 (= e!42532 e!42531)))

(declare-fun res!53470 () Bool)

(assert (=> b!64393 (=> res!53470 e!42531)))

(assert (=> b!64393 (= res!53470 (= (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64394 () Bool)

(assert (=> b!64394 (= e!42531 (arrayBitRangesEq!0 (buf!1675 thiss!1379) (buf!1675 (_2!2983 lt!101365)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(assert (= (and d!20066 res!53468) b!64392))

(assert (= (and b!64392 res!53469) b!64393))

(assert (= (and b!64393 (not res!53470)) b!64394))

(assert (=> b!64392 m!101827))

(assert (=> b!64392 m!101833))

(assert (=> b!64394 m!101827))

(assert (=> b!64394 m!101827))

(declare-fun m!102101 () Bool)

(assert (=> b!64394 m!102101))

(assert (=> b!64228 d!20066))

(declare-fun d!20068 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4926 () Bool)

(assert (= bs!4926 d!20068))

(declare-fun m!102103 () Bool)

(assert (=> bs!4926 m!102103))

(assert (=> b!64228 d!20068))

(declare-fun d!20070 () Bool)

(assert (=> d!20070 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101647 () Unit!4353)

(declare-fun choose!9 (BitStream!2240 array!2819 (_ BitVec 64) BitStream!2240) Unit!4353)

(assert (=> d!20070 (= lt!101647 (choose!9 thiss!1379 (buf!1675 (_2!2983 lt!101372)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2241 (buf!1675 (_2!2983 lt!101372)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(assert (=> d!20070 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1675 (_2!2983 lt!101372)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101647)))

(declare-fun bs!4927 () Bool)

(assert (= bs!4927 d!20070))

(assert (=> bs!4927 m!101875))

(declare-fun m!102105 () Bool)

(assert (=> bs!4927 m!102105))

(assert (=> b!64228 d!20070))

(declare-fun b!64506 () Bool)

(declare-fun res!53541 () Bool)

(declare-fun e!42584 () Bool)

(assert (=> b!64506 (=> (not res!53541) (not e!42584))))

(declare-fun lt!102034 () tuple2!5744)

(assert (=> b!64506 (= res!53541 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!102034)))))

(declare-fun lt!102054 () tuple2!5744)

(declare-fun c!4645 () Bool)

(declare-fun lt!102020 () tuple2!5744)

(declare-fun call!823 () tuple2!5746)

(declare-fun bm!820 () Bool)

(assert (=> bm!820 (= call!823 (reader!0 (ite c!4645 (_2!2983 lt!102020) (_2!2983 lt!101372)) (ite c!4645 (_2!2983 lt!102054) (_2!2983 lt!101372))))))

(declare-fun b!64507 () Bool)

(declare-fun res!53538 () Bool)

(assert (=> b!64507 (=> (not res!53538) (not e!42584))))

(assert (=> b!64507 (= res!53538 (invariant!0 (currentBit!3324 (_2!2983 lt!102034)) (currentByte!3329 (_2!2983 lt!102034)) (size!1294 (buf!1675 (_2!2983 lt!102034)))))))

(declare-fun b!64508 () Bool)

(declare-fun e!42583 () Bool)

(declare-fun lt!102040 () (_ BitVec 64))

(assert (=> b!64508 (= e!42583 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!102040))))

(declare-fun b!64509 () Bool)

(declare-fun res!53540 () Bool)

(assert (=> b!64509 (=> (not res!53540) (not e!42584))))

(assert (=> b!64509 (= res!53540 (= (size!1294 (buf!1675 (_2!2983 lt!101372))) (size!1294 (buf!1675 (_2!2983 lt!102034)))))))

(declare-fun lt!102042 () tuple2!5746)

(declare-fun b!64510 () Bool)

(assert (=> b!64510 (= e!42584 (= (bitStreamReadBitsIntoList!0 (_2!2983 lt!102034) (_1!2984 lt!102042) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2983 lt!102034) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!64510 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64510 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!102045 () Unit!4353)

(declare-fun lt!102030 () Unit!4353)

(assert (=> b!64510 (= lt!102045 lt!102030)))

(assert (=> b!64510 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!102034)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!102040)))

(assert (=> b!64510 (= lt!102030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!102034)) lt!102040))))

(assert (=> b!64510 e!42583))

(declare-fun res!53536 () Bool)

(assert (=> b!64510 (=> (not res!53536) (not e!42583))))

(assert (=> b!64510 (= res!53536 (and (= (size!1294 (buf!1675 (_2!2983 lt!101372))) (size!1294 (buf!1675 (_2!2983 lt!102034)))) (bvsge lt!102040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64510 (= lt!102040 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!64510 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64510 (= lt!102042 (reader!0 (_2!2983 lt!101372) (_2!2983 lt!102034)))))

(declare-fun d!20072 () Bool)

(assert (=> d!20072 e!42584))

(declare-fun res!53537 () Bool)

(assert (=> d!20072 (=> (not res!53537) (not e!42584))))

(declare-fun lt!102052 () (_ BitVec 64))

(assert (=> d!20072 (= res!53537 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102034))) (currentByte!3329 (_2!2983 lt!102034)) (currentBit!3324 (_2!2983 lt!102034))) (bvsub lt!102052 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20072 (or (= (bvand lt!102052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102052 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!102047 () (_ BitVec 64))

(assert (=> d!20072 (= lt!102052 (bvadd lt!102047 to!314))))

(assert (=> d!20072 (or (not (= (bvand lt!102047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!102047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!102047 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20072 (= lt!102047 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(declare-fun e!42585 () tuple2!5744)

(assert (=> d!20072 (= lt!102034 e!42585)))

(assert (=> d!20072 (= c!4645 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!102035 () Unit!4353)

(declare-fun lt!102043 () Unit!4353)

(assert (=> d!20072 (= lt!102035 lt!102043)))

(assert (=> d!20072 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101372))))

(assert (=> d!20072 (= lt!102043 (lemmaIsPrefixRefl!0 (_2!2983 lt!101372)))))

(declare-fun lt!102053 () (_ BitVec 64))

(assert (=> d!20072 (= lt!102053 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(assert (=> d!20072 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20072 (= (appendBitsMSBFirstLoop!0 (_2!2983 lt!101372) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!102034)))

(declare-fun b!64511 () Bool)

(declare-fun Unit!4367 () Unit!4353)

(assert (=> b!64511 (= e!42585 (tuple2!5745 Unit!4367 (_2!2983 lt!101372)))))

(assert (=> b!64511 (= (size!1294 (buf!1675 (_2!2983 lt!101372))) (size!1294 (buf!1675 (_2!2983 lt!101372))))))

(declare-fun lt!102026 () Unit!4353)

(declare-fun Unit!4368 () Unit!4353)

(assert (=> b!64511 (= lt!102026 Unit!4368)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2240 array!2819 array!2819 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5756 0))(
  ( (tuple2!5757 (_1!2989 array!2819) (_2!2989 BitStream!2240)) )
))
(declare-fun readBits!0 (BitStream!2240 (_ BitVec 64)) tuple2!5756)

(assert (=> b!64511 (checkByteArrayBitContent!0 (_2!2983 lt!101372) srcBuffer!2 (_1!2989 (readBits!0 (_1!2984 call!823) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!64512 () Bool)

(declare-fun res!53539 () Bool)

(assert (=> b!64512 (=> (not res!53539) (not e!42584))))

(assert (=> b!64512 (= res!53539 (= (size!1294 (buf!1675 (_2!2983 lt!102034))) (size!1294 (buf!1675 (_2!2983 lt!101372)))))))

(declare-fun b!64513 () Bool)

(declare-fun Unit!4369 () Unit!4353)

(assert (=> b!64513 (= e!42585 (tuple2!5745 Unit!4369 (_2!2983 lt!102054)))))

(assert (=> b!64513 (= lt!102020 (appendBitFromByte!0 (_2!2983 lt!101372) (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!102050 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102050 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102023 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102023 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102039 () Unit!4353)

(assert (=> b!64513 (= lt!102039 (validateOffsetBitsIneqLemma!0 (_2!2983 lt!101372) (_2!2983 lt!102020) lt!102050 lt!102023))))

(assert (=> b!64513 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!102020)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!102020))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!102020))) (bvsub lt!102050 lt!102023))))

(declare-fun lt!102060 () Unit!4353)

(assert (=> b!64513 (= lt!102060 lt!102039)))

(declare-fun lt!102058 () tuple2!5746)

(assert (=> b!64513 (= lt!102058 (reader!0 (_2!2983 lt!101372) (_2!2983 lt!102020)))))

(declare-fun lt!102046 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102046 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102051 () Unit!4353)

(assert (=> b!64513 (= lt!102051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!102020)) lt!102046))))

(assert (=> b!64513 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!102020)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!102046)))

(declare-fun lt!102024 () Unit!4353)

(assert (=> b!64513 (= lt!102024 lt!102051)))

(assert (=> b!64513 (= (head!514 (byteArrayBitContentToList!0 (_2!2983 lt!102020) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!514 (bitStreamReadBitsIntoList!0 (_2!2983 lt!102020) (_1!2984 lt!102058) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102057 () Unit!4353)

(declare-fun Unit!4370 () Unit!4353)

(assert (=> b!64513 (= lt!102057 Unit!4370)))

(assert (=> b!64513 (= lt!102054 (appendBitsMSBFirstLoop!0 (_2!2983 lt!102020) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!102049 () Unit!4353)

(assert (=> b!64513 (= lt!102049 (lemmaIsPrefixTransitive!0 (_2!2983 lt!101372) (_2!2983 lt!102020) (_2!2983 lt!102054)))))

(assert (=> b!64513 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!102054))))

(declare-fun lt!102019 () Unit!4353)

(assert (=> b!64513 (= lt!102019 lt!102049)))

(assert (=> b!64513 (= (size!1294 (buf!1675 (_2!2983 lt!102054))) (size!1294 (buf!1675 (_2!2983 lt!101372))))))

(declare-fun lt!102036 () Unit!4353)

(declare-fun Unit!4371 () Unit!4353)

(assert (=> b!64513 (= lt!102036 Unit!4371)))

(assert (=> b!64513 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102054))) (currentByte!3329 (_2!2983 lt!102054)) (currentBit!3324 (_2!2983 lt!102054))) (bvsub (bvadd (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102033 () Unit!4353)

(declare-fun Unit!4373 () Unit!4353)

(assert (=> b!64513 (= lt!102033 Unit!4373)))

(assert (=> b!64513 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102054))) (currentByte!3329 (_2!2983 lt!102054)) (currentBit!3324 (_2!2983 lt!102054))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102020))) (currentByte!3329 (_2!2983 lt!102020)) (currentBit!3324 (_2!2983 lt!102020))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102029 () Unit!4353)

(declare-fun Unit!4374 () Unit!4353)

(assert (=> b!64513 (= lt!102029 Unit!4374)))

(declare-fun lt!102021 () tuple2!5746)

(assert (=> b!64513 (= lt!102021 (reader!0 (_2!2983 lt!101372) (_2!2983 lt!102054)))))

(declare-fun lt!102061 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102061 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102031 () Unit!4353)

(assert (=> b!64513 (= lt!102031 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!102054)) lt!102061))))

(assert (=> b!64513 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!102054)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!102061)))

(declare-fun lt!102055 () Unit!4353)

(assert (=> b!64513 (= lt!102055 lt!102031)))

(declare-fun lt!102044 () tuple2!5746)

(assert (=> b!64513 (= lt!102044 call!823)))

(declare-fun lt!102059 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102059 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102056 () Unit!4353)

(assert (=> b!64513 (= lt!102056 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!102020) (buf!1675 (_2!2983 lt!102054)) lt!102059))))

(assert (=> b!64513 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!102054)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!102020))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!102020))) lt!102059)))

(declare-fun lt!102028 () Unit!4353)

(assert (=> b!64513 (= lt!102028 lt!102056)))

(declare-fun lt!102041 () List!695)

(assert (=> b!64513 (= lt!102041 (byteArrayBitContentToList!0 (_2!2983 lt!102054) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!102032 () List!695)

(assert (=> b!64513 (= lt!102032 (byteArrayBitContentToList!0 (_2!2983 lt!102054) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102018 () List!695)

(assert (=> b!64513 (= lt!102018 (bitStreamReadBitsIntoList!0 (_2!2983 lt!102054) (_1!2984 lt!102021) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!102038 () List!695)

(assert (=> b!64513 (= lt!102038 (bitStreamReadBitsIntoList!0 (_2!2983 lt!102054) (_1!2984 lt!102044) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102025 () (_ BitVec 64))

(assert (=> b!64513 (= lt!102025 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102022 () Unit!4353)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2240 BitStream!2240 BitStream!2240 BitStream!2240 (_ BitVec 64) List!695) Unit!4353)

(assert (=> b!64513 (= lt!102022 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2983 lt!102054) (_2!2983 lt!102054) (_1!2984 lt!102021) (_1!2984 lt!102044) lt!102025 lt!102018))))

(declare-fun tail!301 (List!695) List!695)

(assert (=> b!64513 (= (bitStreamReadBitsIntoList!0 (_2!2983 lt!102054) (_1!2984 lt!102044) (bvsub lt!102025 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!301 lt!102018))))

(declare-fun lt!102048 () Unit!4353)

(assert (=> b!64513 (= lt!102048 lt!102022)))

(declare-fun lt!102037 () Unit!4353)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2819 array!2819 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4353)

(assert (=> b!64513 (= lt!102037 (arrayBitRangesEqImpliesEq!0 (buf!1675 (_2!2983 lt!102020)) (buf!1675 (_2!2983 lt!102054)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!102053 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102020))) (currentByte!3329 (_2!2983 lt!102020)) (currentBit!3324 (_2!2983 lt!102020)))))))

(declare-fun bitAt!0 (array!2819 (_ BitVec 64)) Bool)

(assert (=> b!64513 (= (bitAt!0 (buf!1675 (_2!2983 lt!102020)) lt!102053) (bitAt!0 (buf!1675 (_2!2983 lt!102054)) lt!102053))))

(declare-fun lt!102027 () Unit!4353)

(assert (=> b!64513 (= lt!102027 lt!102037)))

(assert (= (and d!20072 c!4645) b!64513))

(assert (= (and d!20072 (not c!4645)) b!64511))

(assert (= (or b!64513 b!64511) bm!820))

(assert (= (and d!20072 res!53537) b!64507))

(assert (= (and b!64507 res!53538) b!64509))

(assert (= (and b!64509 res!53540) b!64506))

(assert (= (and b!64506 res!53541) b!64512))

(assert (= (and b!64512 res!53539) b!64510))

(assert (= (and b!64510 res!53536) b!64508))

(declare-fun m!102331 () Bool)

(assert (=> b!64506 m!102331))

(declare-fun m!102333 () Bool)

(assert (=> b!64508 m!102333))

(declare-fun m!102335 () Bool)

(assert (=> b!64510 m!102335))

(declare-fun m!102337 () Bool)

(assert (=> b!64510 m!102337))

(declare-fun m!102339 () Bool)

(assert (=> b!64510 m!102339))

(declare-fun m!102341 () Bool)

(assert (=> b!64510 m!102341))

(declare-fun m!102343 () Bool)

(assert (=> b!64510 m!102343))

(declare-fun m!102345 () Bool)

(assert (=> b!64511 m!102345))

(declare-fun m!102347 () Bool)

(assert (=> b!64511 m!102347))

(declare-fun m!102349 () Bool)

(assert (=> d!20072 m!102349))

(assert (=> d!20072 m!101837))

(assert (=> d!20072 m!102095))

(assert (=> d!20072 m!102097))

(declare-fun m!102351 () Bool)

(assert (=> b!64507 m!102351))

(declare-fun m!102353 () Bool)

(assert (=> b!64513 m!102353))

(declare-fun m!102355 () Bool)

(assert (=> b!64513 m!102355))

(declare-fun m!102357 () Bool)

(assert (=> b!64513 m!102357))

(declare-fun m!102359 () Bool)

(assert (=> b!64513 m!102359))

(declare-fun m!102361 () Bool)

(assert (=> b!64513 m!102361))

(declare-fun m!102363 () Bool)

(assert (=> b!64513 m!102363))

(declare-fun m!102365 () Bool)

(assert (=> b!64513 m!102365))

(declare-fun m!102367 () Bool)

(assert (=> b!64513 m!102367))

(declare-fun m!102369 () Bool)

(assert (=> b!64513 m!102369))

(assert (=> b!64513 m!102357))

(declare-fun m!102371 () Bool)

(assert (=> b!64513 m!102371))

(assert (=> b!64513 m!102365))

(declare-fun m!102373 () Bool)

(assert (=> b!64513 m!102373))

(declare-fun m!102375 () Bool)

(assert (=> b!64513 m!102375))

(declare-fun m!102377 () Bool)

(assert (=> b!64513 m!102377))

(assert (=> b!64513 m!102359))

(declare-fun m!102379 () Bool)

(assert (=> b!64513 m!102379))

(declare-fun m!102381 () Bool)

(assert (=> b!64513 m!102381))

(declare-fun m!102383 () Bool)

(assert (=> b!64513 m!102383))

(declare-fun m!102385 () Bool)

(assert (=> b!64513 m!102385))

(declare-fun m!102387 () Bool)

(assert (=> b!64513 m!102387))

(declare-fun m!102389 () Bool)

(assert (=> b!64513 m!102389))

(declare-fun m!102391 () Bool)

(assert (=> b!64513 m!102391))

(declare-fun m!102393 () Bool)

(assert (=> b!64513 m!102393))

(declare-fun m!102395 () Bool)

(assert (=> b!64513 m!102395))

(assert (=> b!64513 m!101837))

(declare-fun m!102397 () Bool)

(assert (=> b!64513 m!102397))

(declare-fun m!102399 () Bool)

(assert (=> b!64513 m!102399))

(declare-fun m!102401 () Bool)

(assert (=> b!64513 m!102401))

(declare-fun m!102403 () Bool)

(assert (=> b!64513 m!102403))

(declare-fun m!102405 () Bool)

(assert (=> b!64513 m!102405))

(declare-fun m!102407 () Bool)

(assert (=> b!64513 m!102407))

(declare-fun m!102409 () Bool)

(assert (=> b!64513 m!102409))

(declare-fun m!102411 () Bool)

(assert (=> b!64513 m!102411))

(assert (=> b!64513 m!102401))

(declare-fun m!102413 () Bool)

(assert (=> b!64513 m!102413))

(declare-fun m!102415 () Bool)

(assert (=> bm!820 m!102415))

(assert (=> b!64228 d!20072))

(declare-fun d!20138 () Bool)

(declare-fun e!42588 () Bool)

(assert (=> d!20138 e!42588))

(declare-fun res!53546 () Bool)

(assert (=> d!20138 (=> (not res!53546) (not e!42588))))

(declare-fun lt!102077 () (_ BitVec 64))

(declare-fun lt!102075 () (_ BitVec 64))

(declare-fun lt!102074 () (_ BitVec 64))

(assert (=> d!20138 (= res!53546 (= lt!102074 (bvsub lt!102077 lt!102075)))))

(assert (=> d!20138 (or (= (bvand lt!102077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102077 lt!102075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20138 (= lt!102075 (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372)))))))

(declare-fun lt!102079 () (_ BitVec 64))

(declare-fun lt!102076 () (_ BitVec 64))

(assert (=> d!20138 (= lt!102077 (bvmul lt!102079 lt!102076))))

(assert (=> d!20138 (or (= lt!102079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102076 (bvsdiv (bvmul lt!102079 lt!102076) lt!102079)))))

(assert (=> d!20138 (= lt!102076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20138 (= lt!102079 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))))))

(assert (=> d!20138 (= lt!102074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372)))))))

(assert (=> d!20138 (invariant!0 (currentBit!3324 (_2!2983 lt!101372)) (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101372))))))

(assert (=> d!20138 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))) lt!102074)))

(declare-fun b!64518 () Bool)

(declare-fun res!53547 () Bool)

(assert (=> b!64518 (=> (not res!53547) (not e!42588))))

(assert (=> b!64518 (= res!53547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102074))))

(declare-fun b!64519 () Bool)

(declare-fun lt!102078 () (_ BitVec 64))

(assert (=> b!64519 (= e!42588 (bvsle lt!102074 (bvmul lt!102078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64519 (or (= lt!102078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102078)))))

(assert (=> b!64519 (= lt!102078 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))))))

(assert (= (and d!20138 res!53546) b!64518))

(assert (= (and b!64518 res!53547) b!64519))

(declare-fun m!102417 () Bool)

(assert (=> d!20138 m!102417))

(assert (=> d!20138 m!101835))

(assert (=> b!64239 d!20138))

(declare-fun b!64520 () Bool)

(declare-fun res!53548 () Bool)

(declare-fun e!42589 () Bool)

(assert (=> b!64520 (=> (not res!53548) (not e!42589))))

(declare-fun lt!102084 () tuple2!5746)

(assert (=> b!64520 (= res!53548 (isPrefixOf!0 (_1!2984 lt!102084) thiss!1379))))

(declare-fun d!20140 () Bool)

(assert (=> d!20140 e!42589))

(declare-fun res!53550 () Bool)

(assert (=> d!20140 (=> (not res!53550) (not e!42589))))

(assert (=> d!20140 (= res!53550 (isPrefixOf!0 (_1!2984 lt!102084) (_2!2984 lt!102084)))))

(declare-fun lt!102080 () BitStream!2240)

(assert (=> d!20140 (= lt!102084 (tuple2!5747 lt!102080 (_2!2983 lt!101365)))))

(declare-fun lt!102085 () Unit!4353)

(declare-fun lt!102093 () Unit!4353)

(assert (=> d!20140 (= lt!102085 lt!102093)))

(assert (=> d!20140 (isPrefixOf!0 lt!102080 (_2!2983 lt!101365))))

(assert (=> d!20140 (= lt!102093 (lemmaIsPrefixTransitive!0 lt!102080 (_2!2983 lt!101365) (_2!2983 lt!101365)))))

(declare-fun lt!102090 () Unit!4353)

(declare-fun lt!102094 () Unit!4353)

(assert (=> d!20140 (= lt!102090 lt!102094)))

(assert (=> d!20140 (isPrefixOf!0 lt!102080 (_2!2983 lt!101365))))

(assert (=> d!20140 (= lt!102094 (lemmaIsPrefixTransitive!0 lt!102080 thiss!1379 (_2!2983 lt!101365)))))

(declare-fun lt!102097 () Unit!4353)

(declare-fun e!42590 () Unit!4353)

(assert (=> d!20140 (= lt!102097 e!42590)))

(declare-fun c!4646 () Bool)

(assert (=> d!20140 (= c!4646 (not (= (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102088 () Unit!4353)

(declare-fun lt!102096 () Unit!4353)

(assert (=> d!20140 (= lt!102088 lt!102096)))

(assert (=> d!20140 (isPrefixOf!0 (_2!2983 lt!101365) (_2!2983 lt!101365))))

(assert (=> d!20140 (= lt!102096 (lemmaIsPrefixRefl!0 (_2!2983 lt!101365)))))

(declare-fun lt!102082 () Unit!4353)

(declare-fun lt!102092 () Unit!4353)

(assert (=> d!20140 (= lt!102082 lt!102092)))

(assert (=> d!20140 (= lt!102092 (lemmaIsPrefixRefl!0 (_2!2983 lt!101365)))))

(declare-fun lt!102087 () Unit!4353)

(declare-fun lt!102083 () Unit!4353)

(assert (=> d!20140 (= lt!102087 lt!102083)))

(assert (=> d!20140 (isPrefixOf!0 lt!102080 lt!102080)))

(assert (=> d!20140 (= lt!102083 (lemmaIsPrefixRefl!0 lt!102080))))

(declare-fun lt!102089 () Unit!4353)

(declare-fun lt!102098 () Unit!4353)

(assert (=> d!20140 (= lt!102089 lt!102098)))

(assert (=> d!20140 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20140 (= lt!102098 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20140 (= lt!102080 (BitStream!2241 (buf!1675 (_2!2983 lt!101365)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(assert (=> d!20140 (isPrefixOf!0 thiss!1379 (_2!2983 lt!101365))))

(assert (=> d!20140 (= (reader!0 thiss!1379 (_2!2983 lt!101365)) lt!102084)))

(declare-fun b!64521 () Bool)

(declare-fun lt!102099 () Unit!4353)

(assert (=> b!64521 (= e!42590 lt!102099)))

(declare-fun lt!102086 () (_ BitVec 64))

(assert (=> b!64521 (= lt!102086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102091 () (_ BitVec 64))

(assert (=> b!64521 (= lt!102091 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(assert (=> b!64521 (= lt!102099 (arrayBitRangesEqSymmetric!0 (buf!1675 thiss!1379) (buf!1675 (_2!2983 lt!101365)) lt!102086 lt!102091))))

(assert (=> b!64521 (arrayBitRangesEq!0 (buf!1675 (_2!2983 lt!101365)) (buf!1675 thiss!1379) lt!102086 lt!102091)))

(declare-fun b!64522 () Bool)

(declare-fun Unit!4376 () Unit!4353)

(assert (=> b!64522 (= e!42590 Unit!4376)))

(declare-fun lt!102081 () (_ BitVec 64))

(declare-fun lt!102095 () (_ BitVec 64))

(declare-fun b!64523 () Bool)

(assert (=> b!64523 (= e!42589 (= (_1!2984 lt!102084) (withMovedBitIndex!0 (_2!2984 lt!102084) (bvsub lt!102081 lt!102095))))))

(assert (=> b!64523 (or (= (bvand lt!102081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102081 lt!102095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64523 (= lt!102095 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365))))))

(assert (=> b!64523 (= lt!102081 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(declare-fun b!64524 () Bool)

(declare-fun res!53549 () Bool)

(assert (=> b!64524 (=> (not res!53549) (not e!42589))))

(assert (=> b!64524 (= res!53549 (isPrefixOf!0 (_2!2984 lt!102084) (_2!2983 lt!101365)))))

(assert (= (and d!20140 c!4646) b!64521))

(assert (= (and d!20140 (not c!4646)) b!64522))

(assert (= (and d!20140 res!53550) b!64520))

(assert (= (and b!64520 res!53548) b!64524))

(assert (= (and b!64524 res!53549) b!64523))

(assert (=> b!64521 m!101827))

(declare-fun m!102419 () Bool)

(assert (=> b!64521 m!102419))

(declare-fun m!102421 () Bool)

(assert (=> b!64521 m!102421))

(declare-fun m!102423 () Bool)

(assert (=> b!64523 m!102423))

(assert (=> b!64523 m!101833))

(assert (=> b!64523 m!101827))

(declare-fun m!102425 () Bool)

(assert (=> b!64524 m!102425))

(declare-fun m!102427 () Bool)

(assert (=> b!64520 m!102427))

(assert (=> d!20140 m!101881))

(assert (=> d!20140 m!101825))

(declare-fun m!102429 () Bool)

(assert (=> d!20140 m!102429))

(declare-fun m!102431 () Bool)

(assert (=> d!20140 m!102431))

(declare-fun m!102433 () Bool)

(assert (=> d!20140 m!102433))

(declare-fun m!102435 () Bool)

(assert (=> d!20140 m!102435))

(declare-fun m!102437 () Bool)

(assert (=> d!20140 m!102437))

(declare-fun m!102439 () Bool)

(assert (=> d!20140 m!102439))

(declare-fun m!102441 () Bool)

(assert (=> d!20140 m!102441))

(declare-fun m!102443 () Bool)

(assert (=> d!20140 m!102443))

(assert (=> d!20140 m!101823))

(assert (=> b!64238 d!20140))

(declare-fun d!20142 () Bool)

(assert (=> d!20142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!101361) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372)))) lt!101361))))

(declare-fun bs!4940 () Bool)

(assert (= bs!4940 d!20142))

(declare-fun m!102445 () Bool)

(assert (=> bs!4940 m!102445))

(assert (=> b!64238 d!20142))

(declare-fun d!20144 () Bool)

(assert (=> d!20144 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4941 () Bool)

(assert (= bs!4941 d!20144))

(declare-fun m!102447 () Bool)

(assert (=> bs!4941 m!102447))

(assert (=> b!64238 d!20144))

(declare-fun b!64537 () Bool)

(declare-datatypes ((tuple2!5764 0))(
  ( (tuple2!5765 (_1!2993 List!695) (_2!2993 BitStream!2240)) )
))
(declare-fun e!42597 () tuple2!5764)

(assert (=> b!64537 (= e!42597 (tuple2!5765 Nil!692 (_1!2984 lt!101369)))))

(declare-fun b!64540 () Bool)

(declare-fun e!42598 () Bool)

(declare-fun lt!102140 () List!695)

(assert (=> b!64540 (= e!42598 (> (length!323 lt!102140) 0))))

(declare-fun d!20146 () Bool)

(assert (=> d!20146 e!42598))

(declare-fun c!4653 () Bool)

(assert (=> d!20146 (= c!4653 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20146 (= lt!102140 (_1!2993 e!42597))))

(declare-fun c!4654 () Bool)

(assert (=> d!20146 (= c!4654 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20146 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20146 (= (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_1!2984 lt!101369) (bvsub to!314 i!635)) lt!102140)))

(declare-fun b!64539 () Bool)

(declare-fun isEmpty!200 (List!695) Bool)

(assert (=> b!64539 (= e!42598 (isEmpty!200 lt!102140))))

(declare-fun b!64538 () Bool)

(declare-datatypes ((tuple2!5766 0))(
  ( (tuple2!5767 (_1!2994 Bool) (_2!2994 BitStream!2240)) )
))
(declare-fun lt!102141 () tuple2!5766)

(declare-fun lt!102142 () (_ BitVec 64))

(assert (=> b!64538 (= e!42597 (tuple2!5765 (Cons!691 (_1!2994 lt!102141) (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_2!2994 lt!102141) (bvsub (bvsub to!314 i!635) lt!102142))) (_2!2994 lt!102141)))))

(declare-fun readBit!0 (BitStream!2240) tuple2!5766)

(assert (=> b!64538 (= lt!102141 (readBit!0 (_1!2984 lt!101369)))))

(assert (=> b!64538 (= lt!102142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20146 c!4654) b!64537))

(assert (= (and d!20146 (not c!4654)) b!64538))

(assert (= (and d!20146 c!4653) b!64539))

(assert (= (and d!20146 (not c!4653)) b!64540))

(declare-fun m!102449 () Bool)

(assert (=> b!64540 m!102449))

(declare-fun m!102451 () Bool)

(assert (=> b!64539 m!102451))

(declare-fun m!102453 () Bool)

(assert (=> b!64538 m!102453))

(declare-fun m!102455 () Bool)

(assert (=> b!64538 m!102455))

(assert (=> b!64238 d!20146))

(declare-fun d!20148 () Bool)

(assert (=> d!20148 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!101361)))

(declare-fun lt!102147 () Unit!4353)

(assert (=> d!20148 (= lt!102147 (choose!9 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!101365)) lt!101361 (BitStream!2241 (buf!1675 (_2!2983 lt!101365)) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372)))))))

(assert (=> d!20148 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2983 lt!101372) (buf!1675 (_2!2983 lt!101365)) lt!101361) lt!102147)))

(declare-fun bs!4942 () Bool)

(assert (= bs!4942 d!20148))

(assert (=> bs!4942 m!101855))

(declare-fun m!102457 () Bool)

(assert (=> bs!4942 m!102457))

(assert (=> b!64238 d!20148))

(declare-fun b!64541 () Bool)

(declare-fun e!42599 () tuple2!5764)

(assert (=> b!64541 (= e!42599 (tuple2!5765 Nil!692 (_1!2984 lt!101373)))))

(declare-fun b!64544 () Bool)

(declare-fun e!42600 () Bool)

(declare-fun lt!102150 () List!695)

(assert (=> b!64544 (= e!42600 (> (length!323 lt!102150) 0))))

(declare-fun d!20150 () Bool)

(assert (=> d!20150 e!42600))

(declare-fun c!4655 () Bool)

(assert (=> d!20150 (= c!4655 (= lt!101361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20150 (= lt!102150 (_1!2993 e!42599))))

(declare-fun c!4656 () Bool)

(assert (=> d!20150 (= c!4656 (= lt!101361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20150 (bvsge lt!101361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20150 (= (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_1!2984 lt!101373) lt!101361) lt!102150)))

(declare-fun b!64543 () Bool)

(assert (=> b!64543 (= e!42600 (isEmpty!200 lt!102150))))

(declare-fun b!64542 () Bool)

(declare-fun lt!102152 () (_ BitVec 64))

(declare-fun lt!102151 () tuple2!5766)

(assert (=> b!64542 (= e!42599 (tuple2!5765 (Cons!691 (_1!2994 lt!102151) (bitStreamReadBitsIntoList!0 (_2!2983 lt!101365) (_2!2994 lt!102151) (bvsub lt!101361 lt!102152))) (_2!2994 lt!102151)))))

(assert (=> b!64542 (= lt!102151 (readBit!0 (_1!2984 lt!101373)))))

(assert (=> b!64542 (= lt!102152 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20150 c!4656) b!64541))

(assert (= (and d!20150 (not c!4656)) b!64542))

(assert (= (and d!20150 c!4655) b!64543))

(assert (= (and d!20150 (not c!4655)) b!64544))

(declare-fun m!102459 () Bool)

(assert (=> b!64544 m!102459))

(declare-fun m!102461 () Bool)

(assert (=> b!64543 m!102461))

(declare-fun m!102463 () Bool)

(assert (=> b!64542 m!102463))

(declare-fun m!102465 () Bool)

(assert (=> b!64542 m!102465))

(assert (=> b!64238 d!20150))

(declare-fun b!64545 () Bool)

(declare-fun res!53551 () Bool)

(declare-fun e!42601 () Bool)

(assert (=> b!64545 (=> (not res!53551) (not e!42601))))

(declare-fun lt!102165 () tuple2!5746)

(assert (=> b!64545 (= res!53551 (isPrefixOf!0 (_1!2984 lt!102165) (_2!2983 lt!101372)))))

(declare-fun d!20152 () Bool)

(assert (=> d!20152 e!42601))

(declare-fun res!53553 () Bool)

(assert (=> d!20152 (=> (not res!53553) (not e!42601))))

(assert (=> d!20152 (= res!53553 (isPrefixOf!0 (_1!2984 lt!102165) (_2!2984 lt!102165)))))

(declare-fun lt!102161 () BitStream!2240)

(assert (=> d!20152 (= lt!102165 (tuple2!5747 lt!102161 (_2!2983 lt!101365)))))

(declare-fun lt!102166 () Unit!4353)

(declare-fun lt!102174 () Unit!4353)

(assert (=> d!20152 (= lt!102166 lt!102174)))

(assert (=> d!20152 (isPrefixOf!0 lt!102161 (_2!2983 lt!101365))))

(assert (=> d!20152 (= lt!102174 (lemmaIsPrefixTransitive!0 lt!102161 (_2!2983 lt!101365) (_2!2983 lt!101365)))))

(declare-fun lt!102171 () Unit!4353)

(declare-fun lt!102175 () Unit!4353)

(assert (=> d!20152 (= lt!102171 lt!102175)))

(assert (=> d!20152 (isPrefixOf!0 lt!102161 (_2!2983 lt!101365))))

(assert (=> d!20152 (= lt!102175 (lemmaIsPrefixTransitive!0 lt!102161 (_2!2983 lt!101372) (_2!2983 lt!101365)))))

(declare-fun lt!102178 () Unit!4353)

(declare-fun e!42602 () Unit!4353)

(assert (=> d!20152 (= lt!102178 e!42602)))

(declare-fun c!4657 () Bool)

(assert (=> d!20152 (= c!4657 (not (= (size!1294 (buf!1675 (_2!2983 lt!101372))) #b00000000000000000000000000000000)))))

(declare-fun lt!102169 () Unit!4353)

(declare-fun lt!102177 () Unit!4353)

(assert (=> d!20152 (= lt!102169 lt!102177)))

(assert (=> d!20152 (isPrefixOf!0 (_2!2983 lt!101365) (_2!2983 lt!101365))))

(assert (=> d!20152 (= lt!102177 (lemmaIsPrefixRefl!0 (_2!2983 lt!101365)))))

(declare-fun lt!102163 () Unit!4353)

(declare-fun lt!102173 () Unit!4353)

(assert (=> d!20152 (= lt!102163 lt!102173)))

(assert (=> d!20152 (= lt!102173 (lemmaIsPrefixRefl!0 (_2!2983 lt!101365)))))

(declare-fun lt!102168 () Unit!4353)

(declare-fun lt!102164 () Unit!4353)

(assert (=> d!20152 (= lt!102168 lt!102164)))

(assert (=> d!20152 (isPrefixOf!0 lt!102161 lt!102161)))

(assert (=> d!20152 (= lt!102164 (lemmaIsPrefixRefl!0 lt!102161))))

(declare-fun lt!102170 () Unit!4353)

(declare-fun lt!102179 () Unit!4353)

(assert (=> d!20152 (= lt!102170 lt!102179)))

(assert (=> d!20152 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101372))))

(assert (=> d!20152 (= lt!102179 (lemmaIsPrefixRefl!0 (_2!2983 lt!101372)))))

(assert (=> d!20152 (= lt!102161 (BitStream!2241 (buf!1675 (_2!2983 lt!101365)) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(assert (=> d!20152 (isPrefixOf!0 (_2!2983 lt!101372) (_2!2983 lt!101365))))

(assert (=> d!20152 (= (reader!0 (_2!2983 lt!101372) (_2!2983 lt!101365)) lt!102165)))

(declare-fun b!64546 () Bool)

(declare-fun lt!102180 () Unit!4353)

(assert (=> b!64546 (= e!42602 lt!102180)))

(declare-fun lt!102167 () (_ BitVec 64))

(assert (=> b!64546 (= lt!102167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102172 () (_ BitVec 64))

(assert (=> b!64546 (= lt!102172 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(assert (=> b!64546 (= lt!102180 (arrayBitRangesEqSymmetric!0 (buf!1675 (_2!2983 lt!101372)) (buf!1675 (_2!2983 lt!101365)) lt!102167 lt!102172))))

(assert (=> b!64546 (arrayBitRangesEq!0 (buf!1675 (_2!2983 lt!101365)) (buf!1675 (_2!2983 lt!101372)) lt!102167 lt!102172)))

(declare-fun b!64547 () Bool)

(declare-fun Unit!4384 () Unit!4353)

(assert (=> b!64547 (= e!42602 Unit!4384)))

(declare-fun lt!102176 () (_ BitVec 64))

(declare-fun b!64548 () Bool)

(declare-fun lt!102162 () (_ BitVec 64))

(assert (=> b!64548 (= e!42601 (= (_1!2984 lt!102165) (withMovedBitIndex!0 (_2!2984 lt!102165) (bvsub lt!102162 lt!102176))))))

(assert (=> b!64548 (or (= (bvand lt!102162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102162 lt!102176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64548 (= lt!102176 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365))))))

(assert (=> b!64548 (= lt!102162 (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372))))))

(declare-fun b!64549 () Bool)

(declare-fun res!53552 () Bool)

(assert (=> b!64549 (=> (not res!53552) (not e!42601))))

(assert (=> b!64549 (= res!53552 (isPrefixOf!0 (_2!2984 lt!102165) (_2!2983 lt!101365)))))

(assert (= (and d!20152 c!4657) b!64546))

(assert (= (and d!20152 (not c!4657)) b!64547))

(assert (= (and d!20152 res!53553) b!64545))

(assert (= (and b!64545 res!53551) b!64549))

(assert (= (and b!64549 res!53552) b!64548))

(assert (=> b!64546 m!101837))

(declare-fun m!102467 () Bool)

(assert (=> b!64546 m!102467))

(declare-fun m!102469 () Bool)

(assert (=> b!64546 m!102469))

(declare-fun m!102471 () Bool)

(assert (=> b!64548 m!102471))

(assert (=> b!64548 m!101833))

(assert (=> b!64548 m!101837))

(declare-fun m!102473 () Bool)

(assert (=> b!64549 m!102473))

(declare-fun m!102475 () Bool)

(assert (=> b!64545 m!102475))

(assert (=> d!20152 m!101873))

(assert (=> d!20152 m!102097))

(declare-fun m!102477 () Bool)

(assert (=> d!20152 m!102477))

(declare-fun m!102479 () Bool)

(assert (=> d!20152 m!102479))

(declare-fun m!102481 () Bool)

(assert (=> d!20152 m!102481))

(declare-fun m!102483 () Bool)

(assert (=> d!20152 m!102483))

(declare-fun m!102485 () Bool)

(assert (=> d!20152 m!102485))

(assert (=> d!20152 m!102439))

(assert (=> d!20152 m!102441))

(declare-fun m!102487 () Bool)

(assert (=> d!20152 m!102487))

(assert (=> d!20152 m!102095))

(assert (=> b!64238 d!20152))

(declare-fun d!20154 () Bool)

(assert (=> d!20154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102209 () Unit!4353)

(assert (=> d!20154 (= lt!102209 (choose!9 thiss!1379 (buf!1675 (_2!2983 lt!101365)) (bvsub to!314 i!635) (BitStream!2241 (buf!1675 (_2!2983 lt!101365)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(assert (=> d!20154 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1675 (_2!2983 lt!101365)) (bvsub to!314 i!635)) lt!102209)))

(declare-fun bs!4943 () Bool)

(assert (= bs!4943 d!20154))

(assert (=> bs!4943 m!101869))

(declare-fun m!102489 () Bool)

(assert (=> bs!4943 m!102489))

(assert (=> b!64238 d!20154))

(declare-fun d!20156 () Bool)

(assert (=> d!20156 (= (invariant!0 (currentBit!3324 (_2!2983 lt!101372)) (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101372)))) (and (bvsge (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (bvslt (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000001000) (bvsge (currentByte!3329 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101372)))) (and (= (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (= (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101372))))))))))

(assert (=> b!64226 d!20156))

(declare-fun d!20158 () Bool)

(declare-fun e!42603 () Bool)

(assert (=> d!20158 e!42603))

(declare-fun res!53554 () Bool)

(assert (=> d!20158 (=> (not res!53554) (not e!42603))))

(declare-fun lt!102210 () (_ BitVec 64))

(declare-fun lt!102211 () (_ BitVec 64))

(declare-fun lt!102213 () (_ BitVec 64))

(assert (=> d!20158 (= res!53554 (= lt!102210 (bvsub lt!102213 lt!102211)))))

(assert (=> d!20158 (or (= (bvand lt!102213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102213 lt!102211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20158 (= lt!102211 (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101365))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101365)))))))

(declare-fun lt!102215 () (_ BitVec 64))

(declare-fun lt!102212 () (_ BitVec 64))

(assert (=> d!20158 (= lt!102213 (bvmul lt!102215 lt!102212))))

(assert (=> d!20158 (or (= lt!102215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102212 (bvsdiv (bvmul lt!102215 lt!102212) lt!102215)))))

(assert (=> d!20158 (= lt!102212 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20158 (= lt!102215 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (=> d!20158 (= lt!102210 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101365))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101365)))))))

(assert (=> d!20158 (invariant!0 (currentBit!3324 (_2!2983 lt!101365)) (currentByte!3329 (_2!2983 lt!101365)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))

(assert (=> d!20158 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365))) lt!102210)))

(declare-fun b!64550 () Bool)

(declare-fun res!53555 () Bool)

(assert (=> b!64550 (=> (not res!53555) (not e!42603))))

(assert (=> b!64550 (= res!53555 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102210))))

(declare-fun b!64551 () Bool)

(declare-fun lt!102214 () (_ BitVec 64))

(assert (=> b!64551 (= e!42603 (bvsle lt!102210 (bvmul lt!102214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64551 (or (= lt!102214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102214)))))

(assert (=> b!64551 (= lt!102214 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (= (and d!20158 res!53554) b!64550))

(assert (= (and b!64550 res!53555) b!64551))

(declare-fun m!102491 () Bool)

(assert (=> d!20158 m!102491))

(assert (=> d!20158 m!101899))

(assert (=> b!64237 d!20158))

(declare-fun d!20160 () Bool)

(declare-fun e!42604 () Bool)

(assert (=> d!20160 e!42604))

(declare-fun res!53556 () Bool)

(assert (=> d!20160 (=> (not res!53556) (not e!42604))))

(declare-fun lt!102216 () (_ BitVec 64))

(declare-fun lt!102217 () (_ BitVec 64))

(declare-fun lt!102219 () (_ BitVec 64))

(assert (=> d!20160 (= res!53556 (= lt!102216 (bvsub lt!102219 lt!102217)))))

(assert (=> d!20160 (or (= (bvand lt!102219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102219 lt!102217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20160 (= lt!102217 (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101369)))) ((_ sign_extend 32) (currentByte!3329 (_1!2984 lt!101369))) ((_ sign_extend 32) (currentBit!3324 (_1!2984 lt!101369)))))))

(declare-fun lt!102221 () (_ BitVec 64))

(declare-fun lt!102218 () (_ BitVec 64))

(assert (=> d!20160 (= lt!102219 (bvmul lt!102221 lt!102218))))

(assert (=> d!20160 (or (= lt!102221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102218 (bvsdiv (bvmul lt!102221 lt!102218) lt!102221)))))

(assert (=> d!20160 (= lt!102218 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20160 (= lt!102221 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101369)))))))

(assert (=> d!20160 (= lt!102216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3329 (_1!2984 lt!101369))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3324 (_1!2984 lt!101369)))))))

(assert (=> d!20160 (invariant!0 (currentBit!3324 (_1!2984 lt!101369)) (currentByte!3329 (_1!2984 lt!101369)) (size!1294 (buf!1675 (_1!2984 lt!101369))))))

(assert (=> d!20160 (= (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369))) lt!102216)))

(declare-fun b!64552 () Bool)

(declare-fun res!53557 () Bool)

(assert (=> b!64552 (=> (not res!53557) (not e!42604))))

(assert (=> b!64552 (= res!53557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102216))))

(declare-fun b!64553 () Bool)

(declare-fun lt!102220 () (_ BitVec 64))

(assert (=> b!64553 (= e!42604 (bvsle lt!102216 (bvmul lt!102220 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64553 (or (= lt!102220 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102220 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102220)))))

(assert (=> b!64553 (= lt!102220 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101369)))))))

(assert (= (and d!20160 res!53556) b!64552))

(assert (= (and b!64552 res!53557) b!64553))

(declare-fun m!102493 () Bool)

(assert (=> d!20160 m!102493))

(declare-fun m!102495 () Bool)

(assert (=> d!20160 m!102495))

(assert (=> b!64236 d!20160))

(declare-fun d!20162 () Bool)

(declare-fun e!42605 () Bool)

(assert (=> d!20162 e!42605))

(declare-fun res!53558 () Bool)

(assert (=> d!20162 (=> (not res!53558) (not e!42605))))

(declare-fun lt!102223 () (_ BitVec 64))

(declare-fun lt!102222 () (_ BitVec 64))

(declare-fun lt!102225 () (_ BitVec 64))

(assert (=> d!20162 (= res!53558 (= lt!102222 (bvsub lt!102225 lt!102223)))))

(assert (=> d!20162 (or (= (bvand lt!102225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102225 lt!102223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20162 (= lt!102223 (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101373)))) ((_ sign_extend 32) (currentByte!3329 (_1!2984 lt!101373))) ((_ sign_extend 32) (currentBit!3324 (_1!2984 lt!101373)))))))

(declare-fun lt!102227 () (_ BitVec 64))

(declare-fun lt!102224 () (_ BitVec 64))

(assert (=> d!20162 (= lt!102225 (bvmul lt!102227 lt!102224))))

(assert (=> d!20162 (or (= lt!102227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102224 (bvsdiv (bvmul lt!102227 lt!102224) lt!102227)))))

(assert (=> d!20162 (= lt!102224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20162 (= lt!102227 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101373)))))))

(assert (=> d!20162 (= lt!102222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3329 (_1!2984 lt!101373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3324 (_1!2984 lt!101373)))))))

(assert (=> d!20162 (invariant!0 (currentBit!3324 (_1!2984 lt!101373)) (currentByte!3329 (_1!2984 lt!101373)) (size!1294 (buf!1675 (_1!2984 lt!101373))))))

(assert (=> d!20162 (= (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101373))) (currentByte!3329 (_1!2984 lt!101373)) (currentBit!3324 (_1!2984 lt!101373))) lt!102222)))

(declare-fun b!64554 () Bool)

(declare-fun res!53559 () Bool)

(assert (=> b!64554 (=> (not res!53559) (not e!42605))))

(assert (=> b!64554 (= res!53559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102222))))

(declare-fun b!64555 () Bool)

(declare-fun lt!102226 () (_ BitVec 64))

(assert (=> b!64555 (= e!42605 (bvsle lt!102222 (bvmul lt!102226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64555 (or (= lt!102226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102226)))))

(assert (=> b!64555 (= lt!102226 ((_ sign_extend 32) (size!1294 (buf!1675 (_1!2984 lt!101373)))))))

(assert (= (and d!20162 res!53558) b!64554))

(assert (= (and b!64554 res!53559) b!64555))

(declare-fun m!102497 () Bool)

(assert (=> d!20162 m!102497))

(declare-fun m!102499 () Bool)

(assert (=> d!20162 m!102499))

(assert (=> b!64236 d!20162))

(declare-fun d!20164 () Bool)

(assert (=> d!20164 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4944 () Bool)

(assert (= bs!4944 d!20164))

(declare-fun m!102501 () Bool)

(assert (=> bs!4944 m!102501))

(assert (=> b!64225 d!20164))

(declare-fun d!20166 () Bool)

(declare-fun res!53560 () Bool)

(declare-fun e!42607 () Bool)

(assert (=> d!20166 (=> (not res!53560) (not e!42607))))

(assert (=> d!20166 (= res!53560 (= (size!1294 (buf!1675 (_1!2984 lt!101369))) (size!1294 (buf!1675 (_1!2984 lt!101373)))))))

(assert (=> d!20166 (= (isPrefixOf!0 (_1!2984 lt!101369) (_1!2984 lt!101373)) e!42607)))

(declare-fun b!64556 () Bool)

(declare-fun res!53561 () Bool)

(assert (=> b!64556 (=> (not res!53561) (not e!42607))))

(assert (=> b!64556 (= res!53561 (bvsle (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369))) (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101373))) (currentByte!3329 (_1!2984 lt!101373)) (currentBit!3324 (_1!2984 lt!101373)))))))

(declare-fun b!64557 () Bool)

(declare-fun e!42606 () Bool)

(assert (=> b!64557 (= e!42607 e!42606)))

(declare-fun res!53562 () Bool)

(assert (=> b!64557 (=> res!53562 e!42606)))

(assert (=> b!64557 (= res!53562 (= (size!1294 (buf!1675 (_1!2984 lt!101369))) #b00000000000000000000000000000000))))

(declare-fun b!64558 () Bool)

(assert (=> b!64558 (= e!42606 (arrayBitRangesEq!0 (buf!1675 (_1!2984 lt!101369)) (buf!1675 (_1!2984 lt!101373)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101369))) (currentByte!3329 (_1!2984 lt!101369)) (currentBit!3324 (_1!2984 lt!101369)))))))

(assert (= (and d!20166 res!53560) b!64556))

(assert (= (and b!64556 res!53561) b!64557))

(assert (= (and b!64557 (not res!53562)) b!64558))

(assert (=> b!64556 m!101901))

(assert (=> b!64556 m!101903))

(assert (=> b!64558 m!101901))

(assert (=> b!64558 m!101901))

(declare-fun m!102503 () Bool)

(assert (=> b!64558 m!102503))

(assert (=> b!64224 d!20166))

(declare-fun d!20168 () Bool)

(declare-fun res!53565 () Bool)

(declare-fun e!42611 () Bool)

(assert (=> d!20168 (=> (not res!53565) (not e!42611))))

(assert (=> d!20168 (= res!53565 (= (size!1294 (buf!1675 thiss!1379)) (size!1294 (buf!1675 (_2!2983 lt!101372)))))))

(assert (=> d!20168 (= (isPrefixOf!0 thiss!1379 (_2!2983 lt!101372)) e!42611)))

(declare-fun b!64559 () Bool)

(declare-fun res!53566 () Bool)

(assert (=> b!64559 (=> (not res!53566) (not e!42611))))

(assert (=> b!64559 (= res!53566 (bvsle (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101372))) (currentByte!3329 (_2!2983 lt!101372)) (currentBit!3324 (_2!2983 lt!101372)))))))

(declare-fun b!64560 () Bool)

(declare-fun e!42610 () Bool)

(assert (=> b!64560 (= e!42611 e!42610)))

(declare-fun res!53567 () Bool)

(assert (=> b!64560 (=> res!53567 e!42610)))

(assert (=> b!64560 (= res!53567 (= (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64561 () Bool)

(assert (=> b!64561 (= e!42610 (arrayBitRangesEq!0 (buf!1675 thiss!1379) (buf!1675 (_2!2983 lt!101372)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(assert (= (and d!20168 res!53565) b!64559))

(assert (= (and b!64559 res!53566) b!64560))

(assert (= (and b!64560 (not res!53567)) b!64561))

(assert (=> b!64559 m!101827))

(assert (=> b!64559 m!101837))

(assert (=> b!64561 m!101827))

(assert (=> b!64561 m!101827))

(declare-fun m!102505 () Bool)

(assert (=> b!64561 m!102505))

(assert (=> b!64235 d!20168))

(declare-fun d!20170 () Bool)

(assert (=> d!20170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) lt!101361) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372)))) lt!101361))))

(declare-fun bs!4945 () Bool)

(assert (= bs!4945 d!20170))

(assert (=> bs!4945 m!102417))

(assert (=> b!64235 d!20170))

(declare-fun d!20172 () Bool)

(declare-fun e!42616 () Bool)

(assert (=> d!20172 e!42616))

(declare-fun res!53580 () Bool)

(assert (=> d!20172 (=> (not res!53580) (not e!42616))))

(assert (=> d!20172 (= res!53580 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!102242 () Unit!4353)

(declare-fun choose!27 (BitStream!2240 BitStream!2240 (_ BitVec 64) (_ BitVec 64)) Unit!4353)

(assert (=> d!20172 (= lt!102242 (choose!27 thiss!1379 (_2!2983 lt!101372) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20172 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20172 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2983 lt!101372) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102242)))

(declare-fun b!64576 () Bool)

(assert (=> b!64576 (= e!42616 (validate_offset_bits!1 ((_ sign_extend 32) (size!1294 (buf!1675 (_2!2983 lt!101372)))) ((_ sign_extend 32) (currentByte!3329 (_2!2983 lt!101372))) ((_ sign_extend 32) (currentBit!3324 (_2!2983 lt!101372))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20172 res!53580) b!64576))

(declare-fun m!102507 () Bool)

(assert (=> d!20172 m!102507))

(declare-fun m!102509 () Bool)

(assert (=> b!64576 m!102509))

(assert (=> b!64235 d!20172))

(declare-fun b!64608 () Bool)

(declare-fun e!42634 () Bool)

(declare-datatypes ((tuple2!5770 0))(
  ( (tuple2!5771 (_1!2996 BitStream!2240) (_2!2996 Bool)) )
))
(declare-fun lt!102324 () tuple2!5770)

(declare-fun lt!102320 () tuple2!5744)

(assert (=> b!64608 (= e!42634 (= (bitIndex!0 (size!1294 (buf!1675 (_1!2996 lt!102324))) (currentByte!3329 (_1!2996 lt!102324)) (currentBit!3324 (_1!2996 lt!102324))) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102320))) (currentByte!3329 (_2!2983 lt!102320)) (currentBit!3324 (_2!2983 lt!102320)))))))

(declare-fun b!64609 () Bool)

(declare-fun res!53614 () Bool)

(declare-fun e!42633 () Bool)

(assert (=> b!64609 (=> (not res!53614) (not e!42633))))

(declare-fun lt!102323 () tuple2!5744)

(assert (=> b!64609 (= res!53614 (isPrefixOf!0 thiss!1379 (_2!2983 lt!102323)))))

(declare-fun b!64610 () Bool)

(declare-fun e!42636 () Bool)

(assert (=> b!64610 (= e!42636 e!42634)))

(declare-fun res!53609 () Bool)

(assert (=> b!64610 (=> (not res!53609) (not e!42634))))

(declare-fun lt!102318 () (_ BitVec 8))

(assert (=> b!64610 (= res!53609 (and (= (_2!2996 lt!102324) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!102318)) #b00000000000000000000000000000000))) (= (_1!2996 lt!102324) (_2!2983 lt!102320))))))

(declare-fun lt!102328 () tuple2!5756)

(declare-fun lt!102321 () BitStream!2240)

(assert (=> b!64610 (= lt!102328 (readBits!0 lt!102321 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2240) tuple2!5770)

(assert (=> b!64610 (= lt!102324 (readBitPure!0 lt!102321))))

(declare-fun readerFrom!0 (BitStream!2240 (_ BitVec 32) (_ BitVec 32)) BitStream!2240)

(assert (=> b!64610 (= lt!102321 (readerFrom!0 (_2!2983 lt!102320) (currentBit!3324 thiss!1379) (currentByte!3329 thiss!1379)))))

(declare-fun b!64611 () Bool)

(declare-fun res!53616 () Bool)

(assert (=> b!64611 (=> (not res!53616) (not e!42636))))

(declare-fun lt!102326 () (_ BitVec 64))

(declare-fun lt!102325 () (_ BitVec 64))

(assert (=> b!64611 (= res!53616 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102320))) (currentByte!3329 (_2!2983 lt!102320)) (currentBit!3324 (_2!2983 lt!102320))) (bvadd lt!102326 lt!102325)))))

(assert (=> b!64611 (or (not (= (bvand lt!102326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102325 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!102326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!102326 lt!102325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64611 (= lt!102325 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!64611 (= lt!102326 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)))))

(declare-fun b!64612 () Bool)

(declare-fun res!53615 () Bool)

(assert (=> b!64612 (=> (not res!53615) (not e!42633))))

(assert (=> b!64612 (= res!53615 (= (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102323))) (currentByte!3329 (_2!2983 lt!102323)) (currentBit!3324 (_2!2983 lt!102323))) (bvadd (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64614 () Bool)

(declare-fun e!42635 () Bool)

(assert (=> b!64614 (= e!42633 e!42635)))

(declare-fun res!53613 () Bool)

(assert (=> b!64614 (=> (not res!53613) (not e!42635))))

(declare-fun lt!102327 () Bool)

(declare-fun lt!102317 () tuple2!5770)

(assert (=> b!64614 (= res!53613 (and (= (_2!2996 lt!102317) lt!102327) (= (_1!2996 lt!102317) (_2!2983 lt!102323))))))

(assert (=> b!64614 (= lt!102317 (readBitPure!0 (readerFrom!0 (_2!2983 lt!102323) (currentBit!3324 thiss!1379) (currentByte!3329 thiss!1379))))))

(declare-fun b!64615 () Bool)

(assert (=> b!64615 (= e!42635 (= (bitIndex!0 (size!1294 (buf!1675 (_1!2996 lt!102317))) (currentByte!3329 (_1!2996 lt!102317)) (currentBit!3324 (_1!2996 lt!102317))) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!102323))) (currentByte!3329 (_2!2983 lt!102323)) (currentBit!3324 (_2!2983 lt!102323)))))))

(declare-fun b!64613 () Bool)

(declare-fun res!53610 () Bool)

(assert (=> b!64613 (=> (not res!53610) (not e!42636))))

(assert (=> b!64613 (= res!53610 (isPrefixOf!0 thiss!1379 (_2!2983 lt!102320)))))

(declare-fun d!20174 () Bool)

(assert (=> d!20174 e!42636))

(declare-fun res!53612 () Bool)

(assert (=> d!20174 (=> (not res!53612) (not e!42636))))

(assert (=> d!20174 (= res!53612 (= (size!1294 (buf!1675 (_2!2983 lt!102320))) (size!1294 (buf!1675 thiss!1379))))))

(declare-fun lt!102322 () array!2819)

(assert (=> d!20174 (= lt!102318 (select (arr!1858 lt!102322) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20174 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1294 lt!102322)))))

(assert (=> d!20174 (= lt!102322 (array!2820 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!102319 () tuple2!5744)

(assert (=> d!20174 (= lt!102320 (tuple2!5745 (_1!2983 lt!102319) (_2!2983 lt!102319)))))

(assert (=> d!20174 (= lt!102319 lt!102323)))

(assert (=> d!20174 e!42633))

(declare-fun res!53611 () Bool)

(assert (=> d!20174 (=> (not res!53611) (not e!42633))))

(assert (=> d!20174 (= res!53611 (= (size!1294 (buf!1675 thiss!1379)) (size!1294 (buf!1675 (_2!2983 lt!102323)))))))

(declare-fun appendBit!0 (BitStream!2240 Bool) tuple2!5744)

(assert (=> d!20174 (= lt!102323 (appendBit!0 thiss!1379 lt!102327))))

(assert (=> d!20174 (= lt!102327 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20174 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20174 (= (appendBitFromByte!0 thiss!1379 (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!102320)))

(assert (= (and d!20174 res!53611) b!64612))

(assert (= (and b!64612 res!53615) b!64609))

(assert (= (and b!64609 res!53614) b!64614))

(assert (= (and b!64614 res!53613) b!64615))

(assert (= (and d!20174 res!53612) b!64611))

(assert (= (and b!64611 res!53616) b!64613))

(assert (= (and b!64613 res!53610) b!64610))

(assert (= (and b!64610 res!53609) b!64608))

(declare-fun m!102609 () Bool)

(assert (=> b!64609 m!102609))

(declare-fun m!102611 () Bool)

(assert (=> b!64615 m!102611))

(declare-fun m!102613 () Bool)

(assert (=> b!64615 m!102613))

(declare-fun m!102615 () Bool)

(assert (=> d!20174 m!102615))

(declare-fun m!102617 () Bool)

(assert (=> d!20174 m!102617))

(declare-fun m!102619 () Bool)

(assert (=> d!20174 m!102619))

(declare-fun m!102621 () Bool)

(assert (=> b!64610 m!102621))

(declare-fun m!102623 () Bool)

(assert (=> b!64610 m!102623))

(declare-fun m!102625 () Bool)

(assert (=> b!64610 m!102625))

(declare-fun m!102627 () Bool)

(assert (=> b!64611 m!102627))

(assert (=> b!64611 m!101827))

(assert (=> b!64612 m!102613))

(assert (=> b!64612 m!101827))

(declare-fun m!102629 () Bool)

(assert (=> b!64613 m!102629))

(declare-fun m!102631 () Bool)

(assert (=> b!64614 m!102631))

(assert (=> b!64614 m!102631))

(declare-fun m!102633 () Bool)

(assert (=> b!64614 m!102633))

(declare-fun m!102635 () Bool)

(assert (=> b!64608 m!102635))

(assert (=> b!64608 m!102627))

(assert (=> b!64235 d!20174))

(declare-fun d!20198 () Bool)

(assert (=> d!20198 (= (array_inv!1179 (buf!1675 thiss!1379)) (bvsge (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64222 d!20198))

(declare-fun d!20200 () Bool)

(declare-fun res!53617 () Bool)

(declare-fun e!42638 () Bool)

(assert (=> d!20200 (=> (not res!53617) (not e!42638))))

(assert (=> d!20200 (= res!53617 (= (size!1294 (buf!1675 (_1!2984 lt!101373))) (size!1294 (buf!1675 (_2!2983 lt!101365)))))))

(assert (=> d!20200 (= (isPrefixOf!0 (_1!2984 lt!101373) (_2!2983 lt!101365)) e!42638)))

(declare-fun b!64616 () Bool)

(declare-fun res!53618 () Bool)

(assert (=> b!64616 (=> (not res!53618) (not e!42638))))

(assert (=> b!64616 (= res!53618 (bvsle (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101373))) (currentByte!3329 (_1!2984 lt!101373)) (currentBit!3324 (_1!2984 lt!101373))) (bitIndex!0 (size!1294 (buf!1675 (_2!2983 lt!101365))) (currentByte!3329 (_2!2983 lt!101365)) (currentBit!3324 (_2!2983 lt!101365)))))))

(declare-fun b!64617 () Bool)

(declare-fun e!42637 () Bool)

(assert (=> b!64617 (= e!42638 e!42637)))

(declare-fun res!53619 () Bool)

(assert (=> b!64617 (=> res!53619 e!42637)))

(assert (=> b!64617 (= res!53619 (= (size!1294 (buf!1675 (_1!2984 lt!101373))) #b00000000000000000000000000000000))))

(declare-fun b!64618 () Bool)

(assert (=> b!64618 (= e!42637 (arrayBitRangesEq!0 (buf!1675 (_1!2984 lt!101373)) (buf!1675 (_2!2983 lt!101365)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 (_1!2984 lt!101373))) (currentByte!3329 (_1!2984 lt!101373)) (currentBit!3324 (_1!2984 lt!101373)))))))

(assert (= (and d!20200 res!53617) b!64616))

(assert (= (and b!64616 res!53618) b!64617))

(assert (= (and b!64617 (not res!53619)) b!64618))

(assert (=> b!64616 m!101903))

(assert (=> b!64616 m!101833))

(assert (=> b!64618 m!101903))

(assert (=> b!64618 m!101903))

(declare-fun m!102637 () Bool)

(assert (=> b!64618 m!102637))

(assert (=> b!64233 d!20200))

(declare-fun d!20202 () Bool)

(assert (=> d!20202 (= (head!514 (byteArrayBitContentToList!0 (_2!2983 lt!101372) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!810 (byteArrayBitContentToList!0 (_2!2983 lt!101372) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64232 d!20202))

(declare-fun d!20204 () Bool)

(declare-fun c!4661 () Bool)

(assert (=> d!20204 (= c!4661 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42641 () List!695)

(assert (=> d!20204 (= (byteArrayBitContentToList!0 (_2!2983 lt!101372) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42641)))

(declare-fun b!64623 () Bool)

(assert (=> b!64623 (= e!42641 Nil!692)))

(declare-fun b!64624 () Bool)

(assert (=> b!64624 (= e!42641 (Cons!691 (not (= (bvand ((_ sign_extend 24) (select (arr!1858 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2983 lt!101372) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20204 c!4661) b!64623))

(assert (= (and d!20204 (not c!4661)) b!64624))

(assert (=> b!64624 m!101887))

(assert (=> b!64624 m!102619))

(declare-fun m!102639 () Bool)

(assert (=> b!64624 m!102639))

(assert (=> b!64232 d!20204))

(declare-fun d!20206 () Bool)

(assert (=> d!20206 (= (head!514 (bitStreamReadBitsIntoList!0 (_2!2983 lt!101372) (_1!2984 lt!101371) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!810 (bitStreamReadBitsIntoList!0 (_2!2983 lt!101372) (_1!2984 lt!101371) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64232 d!20206))

(declare-fun b!64625 () Bool)

(declare-fun e!42642 () tuple2!5764)

(assert (=> b!64625 (= e!42642 (tuple2!5765 Nil!692 (_1!2984 lt!101371)))))

(declare-fun b!64628 () Bool)

(declare-fun e!42643 () Bool)

(declare-fun lt!102329 () List!695)

(assert (=> b!64628 (= e!42643 (> (length!323 lt!102329) 0))))

(declare-fun d!20208 () Bool)

(assert (=> d!20208 e!42643))

(declare-fun c!4662 () Bool)

(assert (=> d!20208 (= c!4662 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20208 (= lt!102329 (_1!2993 e!42642))))

(declare-fun c!4663 () Bool)

(assert (=> d!20208 (= c!4663 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20208 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20208 (= (bitStreamReadBitsIntoList!0 (_2!2983 lt!101372) (_1!2984 lt!101371) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102329)))

(declare-fun b!64627 () Bool)

(assert (=> b!64627 (= e!42643 (isEmpty!200 lt!102329))))

(declare-fun lt!102330 () tuple2!5766)

(declare-fun lt!102331 () (_ BitVec 64))

(declare-fun b!64626 () Bool)

(assert (=> b!64626 (= e!42642 (tuple2!5765 (Cons!691 (_1!2994 lt!102330) (bitStreamReadBitsIntoList!0 (_2!2983 lt!101372) (_2!2994 lt!102330) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!102331))) (_2!2994 lt!102330)))))

(assert (=> b!64626 (= lt!102330 (readBit!0 (_1!2984 lt!101371)))))

(assert (=> b!64626 (= lt!102331 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20208 c!4663) b!64625))

(assert (= (and d!20208 (not c!4663)) b!64626))

(assert (= (and d!20208 c!4662) b!64627))

(assert (= (and d!20208 (not c!4662)) b!64628))

(declare-fun m!102641 () Bool)

(assert (=> b!64628 m!102641))

(declare-fun m!102643 () Bool)

(assert (=> b!64627 m!102643))

(declare-fun m!102645 () Bool)

(assert (=> b!64626 m!102645))

(declare-fun m!102647 () Bool)

(assert (=> b!64626 m!102647))

(assert (=> b!64232 d!20208))

(declare-fun d!20210 () Bool)

(declare-fun size!1297 (List!695) Int)

(assert (=> d!20210 (= (length!323 lt!101367) (size!1297 lt!101367))))

(declare-fun bs!4952 () Bool)

(assert (= bs!4952 d!20210))

(declare-fun m!102649 () Bool)

(assert (=> bs!4952 m!102649))

(assert (=> b!64221 d!20210))

(declare-fun d!20212 () Bool)

(assert (=> d!20212 (= (array_inv!1179 srcBuffer!2) (bvsge (size!1294 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12556 d!20212))

(declare-fun d!20214 () Bool)

(assert (=> d!20214 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3324 thiss!1379) (currentByte!3329 thiss!1379) (size!1294 (buf!1675 thiss!1379))))))

(declare-fun bs!4953 () Bool)

(assert (= bs!4953 d!20214))

(declare-fun m!102651 () Bool)

(assert (=> bs!4953 m!102651))

(assert (=> start!12556 d!20214))

(declare-fun d!20216 () Bool)

(assert (=> d!20216 (= (invariant!0 (currentBit!3324 (_2!2983 lt!101372)) (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101365)))) (and (bvsge (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (bvslt (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000001000) (bvsge (currentByte!3329 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101365)))) (and (= (currentBit!3324 (_2!2983 lt!101372)) #b00000000000000000000000000000000) (= (currentByte!3329 (_2!2983 lt!101372)) (size!1294 (buf!1675 (_2!2983 lt!101365))))))))))

(assert (=> b!64231 d!20216))

(declare-fun d!20218 () Bool)

(declare-fun res!53620 () Bool)

(declare-fun e!42645 () Bool)

(assert (=> d!20218 (=> (not res!53620) (not e!42645))))

(assert (=> d!20218 (= res!53620 (= (size!1294 (buf!1675 thiss!1379)) (size!1294 (buf!1675 thiss!1379))))))

(assert (=> d!20218 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42645)))

(declare-fun b!64629 () Bool)

(declare-fun res!53621 () Bool)

(assert (=> b!64629 (=> (not res!53621) (not e!42645))))

(assert (=> b!64629 (= res!53621 (bvsle (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)) (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(declare-fun b!64630 () Bool)

(declare-fun e!42644 () Bool)

(assert (=> b!64630 (= e!42645 e!42644)))

(declare-fun res!53622 () Bool)

(assert (=> b!64630 (=> res!53622 e!42644)))

(assert (=> b!64630 (= res!53622 (= (size!1294 (buf!1675 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64631 () Bool)

(assert (=> b!64631 (= e!42644 (arrayBitRangesEq!0 (buf!1675 thiss!1379) (buf!1675 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379))))))

(assert (= (and d!20218 res!53620) b!64629))

(assert (= (and b!64629 res!53621) b!64630))

(assert (= (and b!64630 (not res!53622)) b!64631))

(assert (=> b!64629 m!101827))

(assert (=> b!64629 m!101827))

(assert (=> b!64631 m!101827))

(assert (=> b!64631 m!101827))

(declare-fun m!102653 () Bool)

(assert (=> b!64631 m!102653))

(assert (=> b!64230 d!20218))

(declare-fun d!20220 () Bool)

(assert (=> d!20220 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!102352 () Unit!4353)

(declare-fun choose!11 (BitStream!2240) Unit!4353)

(assert (=> d!20220 (= lt!102352 (choose!11 thiss!1379))))

(assert (=> d!20220 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!102352)))

(declare-fun bs!4955 () Bool)

(assert (= bs!4955 d!20220))

(assert (=> bs!4955 m!101823))

(declare-fun m!102655 () Bool)

(assert (=> bs!4955 m!102655))

(assert (=> b!64230 d!20220))

(declare-fun d!20222 () Bool)

(declare-fun e!42652 () Bool)

(assert (=> d!20222 e!42652))

(declare-fun res!53637 () Bool)

(assert (=> d!20222 (=> (not res!53637) (not e!42652))))

(declare-fun lt!102356 () (_ BitVec 64))

(declare-fun lt!102355 () (_ BitVec 64))

(declare-fun lt!102358 () (_ BitVec 64))

(assert (=> d!20222 (= res!53637 (= lt!102355 (bvsub lt!102358 lt!102356)))))

(assert (=> d!20222 (or (= (bvand lt!102358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102358 lt!102356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20222 (= lt!102356 (remainingBits!0 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))) ((_ sign_extend 32) (currentByte!3329 thiss!1379)) ((_ sign_extend 32) (currentBit!3324 thiss!1379))))))

(declare-fun lt!102360 () (_ BitVec 64))

(declare-fun lt!102357 () (_ BitVec 64))

(assert (=> d!20222 (= lt!102358 (bvmul lt!102360 lt!102357))))

(assert (=> d!20222 (or (= lt!102360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102357 (bvsdiv (bvmul lt!102360 lt!102357) lt!102360)))))

(assert (=> d!20222 (= lt!102357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20222 (= lt!102360 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))))))

(assert (=> d!20222 (= lt!102355 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3329 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3324 thiss!1379))))))

(assert (=> d!20222 (invariant!0 (currentBit!3324 thiss!1379) (currentByte!3329 thiss!1379) (size!1294 (buf!1675 thiss!1379)))))

(assert (=> d!20222 (= (bitIndex!0 (size!1294 (buf!1675 thiss!1379)) (currentByte!3329 thiss!1379) (currentBit!3324 thiss!1379)) lt!102355)))

(declare-fun b!64647 () Bool)

(declare-fun res!53638 () Bool)

(assert (=> b!64647 (=> (not res!53638) (not e!42652))))

(assert (=> b!64647 (= res!53638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102355))))

(declare-fun b!64648 () Bool)

(declare-fun lt!102359 () (_ BitVec 64))

(assert (=> b!64648 (= e!42652 (bvsle lt!102355 (bvmul lt!102359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64648 (or (= lt!102359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102359)))))

(assert (=> b!64648 (= lt!102359 ((_ sign_extend 32) (size!1294 (buf!1675 thiss!1379))))))

(assert (= (and d!20222 res!53637) b!64647))

(assert (= (and b!64647 res!53638) b!64648))

(assert (=> d!20222 m!102501))

(assert (=> d!20222 m!102651))

(assert (=> b!64230 d!20222))

(push 1)

(assert (not b!64539))

(assert (not b!64545))

(assert (not b!64544))

(assert (not d!20170))

(assert (not d!20142))

(assert (not d!20160))

(assert (not b!64628))

(assert (not b!64559))

(assert (not d!20162))

(assert (not b!64610))

(assert (not b!64548))

(assert (not b!64615))

(assert (not b!64524))

(assert (not d!20222))

(assert (not d!20174))

(assert (not b!64387))

(assert (not b!64510))

(assert (not b!64556))

(assert (not d!20214))

(assert (not b!64558))

(assert (not d!20070))

(assert (not d!20068))

(assert (not b!64511))

(assert (not b!64391))

(assert (not d!20140))

(assert (not b!64629))

(assert (not b!64624))

(assert (not b!64506))

(assert (not b!64344))

(assert (not b!64608))

(assert (not d!20158))

(assert (not b!64626))

(assert (not d!20046))

(assert (not d!20154))

(assert (not b!64631))

(assert (not d!20172))

(assert (not b!64394))

(assert (not b!64561))

(assert (not b!64542))

(assert (not d!20148))

(assert (not d!20164))

(assert (not b!64540))

(assert (not b!64507))

(assert (not b!64520))

(assert (not d!20044))

(assert (not b!64388))

(assert (not b!64613))

(assert (not d!20072))

(assert (not d!20220))

(assert (not b!64549))

(assert (not b!64614))

(assert (not b!64523))

(assert (not d!20144))

(assert (not b!64612))

(assert (not b!64576))

(assert (not b!64392))

(assert (not b!64618))

(assert (not b!64543))

(assert (not d!20152))

(assert (not b!64609))

(assert (not b!64513))

(assert (not b!64508))

(assert (not bm!820))

(assert (not b!64345))

(assert (not b!64538))

(assert (not b!64521))

(assert (not b!64546))

(assert (not b!64390))

(assert (not b!64347))

(assert (not b!64342))

(assert (not b!64616))

(assert (not d!20210))

(assert (not b!64627))

(assert (not b!64611))

(assert (not d!20138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

