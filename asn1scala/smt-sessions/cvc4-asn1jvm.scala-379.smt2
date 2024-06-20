; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9162 () Bool)

(assert start!9162)

(declare-fun e!30264 () Bool)

(declare-fun b!45450 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2267 0))(
  ( (array!2268 (arr!1537 (Array (_ BitVec 32) (_ BitVec 8))) (size!1020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1784 0))(
  ( (BitStream!1785 (buf!1369 array!2267) (currentByte!2862 (_ BitVec 32)) (currentBit!2857 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3230 0))(
  ( (Unit!3231) )
))
(declare-datatypes ((tuple2!4436 0))(
  ( (tuple2!4437 (_1!2311 Unit!3230) (_2!2311 BitStream!1784)) )
))
(declare-fun lt!69766 () tuple2!4436)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!69775 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45450 (= e!30264 (= lt!69775 (bvsub (bvsub (bvadd (bitIndex!0 (size!1020 (buf!1369 (_2!2311 lt!69766))) (currentByte!2862 (_2!2311 lt!69766)) (currentBit!2857 (_2!2311 lt!69766))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45451 () Bool)

(declare-fun res!38450 () Bool)

(declare-fun e!30263 () Bool)

(assert (=> b!45451 (=> res!38450 e!30263)))

(declare-fun lt!69770 () tuple2!4436)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45451 (= res!38450 (not (invariant!0 (currentBit!2857 (_2!2311 lt!69766)) (currentByte!2862 (_2!2311 lt!69766)) (size!1020 (buf!1369 (_2!2311 lt!69770))))))))

(declare-fun b!45452 () Bool)

(declare-fun res!38443 () Bool)

(assert (=> b!45452 (=> res!38443 e!30263)))

(assert (=> b!45452 (= res!38443 (not (invariant!0 (currentBit!2857 (_2!2311 lt!69766)) (currentByte!2862 (_2!2311 lt!69766)) (size!1020 (buf!1369 (_2!2311 lt!69766))))))))

(declare-fun res!38447 () Bool)

(declare-fun e!30256 () Bool)

(assert (=> start!9162 (=> (not res!38447) (not e!30256))))

(declare-fun srcBuffer!2 () array!2267)

(assert (=> start!9162 (= res!38447 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1020 srcBuffer!2))))))))

(assert (=> start!9162 e!30256))

(assert (=> start!9162 true))

(declare-fun array_inv!945 (array!2267) Bool)

(assert (=> start!9162 (array_inv!945 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1784)

(declare-fun e!30259 () Bool)

(declare-fun inv!12 (BitStream!1784) Bool)

(assert (=> start!9162 (and (inv!12 thiss!1379) e!30259)))

(declare-fun b!45453 () Bool)

(assert (=> b!45453 (= e!30259 (array_inv!945 (buf!1369 thiss!1379)))))

(declare-fun b!45454 () Bool)

(declare-fun e!30266 () Bool)

(assert (=> b!45454 (= e!30266 e!30263)))

(declare-fun res!38444 () Bool)

(assert (=> b!45454 (=> res!38444 e!30263)))

(assert (=> b!45454 (= res!38444 (not (= (size!1020 (buf!1369 (_2!2311 lt!69766))) (size!1020 (buf!1369 (_2!2311 lt!69770))))))))

(assert (=> b!45454 e!30264))

(declare-fun res!38440 () Bool)

(assert (=> b!45454 (=> (not res!38440) (not e!30264))))

(assert (=> b!45454 (= res!38440 (= (size!1020 (buf!1369 (_2!2311 lt!69770))) (size!1020 (buf!1369 thiss!1379))))))

(declare-fun b!45455 () Bool)

(declare-fun res!38445 () Bool)

(assert (=> b!45455 (=> res!38445 e!30266)))

(assert (=> b!45455 (= res!38445 (not (= (size!1020 (buf!1369 thiss!1379)) (size!1020 (buf!1369 (_2!2311 lt!69770))))))))

(declare-fun b!45456 () Bool)

(declare-fun e!30261 () Bool)

(declare-fun e!30262 () Bool)

(assert (=> b!45456 (= e!30261 e!30262)))

(declare-fun res!38439 () Bool)

(assert (=> b!45456 (=> res!38439 e!30262)))

(declare-fun isPrefixOf!0 (BitStream!1784 BitStream!1784) Bool)

(assert (=> b!45456 (= res!38439 (not (isPrefixOf!0 (_2!2311 lt!69766) (_2!2311 lt!69770))))))

(assert (=> b!45456 (isPrefixOf!0 thiss!1379 (_2!2311 lt!69770))))

(declare-fun lt!69765 () Unit!3230)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1784 BitStream!1784 BitStream!1784) Unit!3230)

(assert (=> b!45456 (= lt!69765 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2311 lt!69766) (_2!2311 lt!69770)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1784 array!2267 (_ BitVec 64) (_ BitVec 64)) tuple2!4436)

(assert (=> b!45456 (= lt!69770 (appendBitsMSBFirstLoop!0 (_2!2311 lt!69766) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!30265 () Bool)

(assert (=> b!45456 e!30265))

(declare-fun res!38449 () Bool)

(assert (=> b!45456 (=> (not res!38449) (not e!30265))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45456 (= res!38449 (validate_offset_bits!1 ((_ sign_extend 32) (size!1020 (buf!1369 (_2!2311 lt!69766)))) ((_ sign_extend 32) (currentByte!2862 thiss!1379)) ((_ sign_extend 32) (currentBit!2857 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69772 () Unit!3230)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1784 array!2267 (_ BitVec 64)) Unit!3230)

(assert (=> b!45456 (= lt!69772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1369 (_2!2311 lt!69766)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4438 0))(
  ( (tuple2!4439 (_1!2312 BitStream!1784) (_2!2312 BitStream!1784)) )
))
(declare-fun lt!69776 () tuple2!4438)

(declare-fun reader!0 (BitStream!1784 BitStream!1784) tuple2!4438)

(assert (=> b!45456 (= lt!69776 (reader!0 thiss!1379 (_2!2311 lt!69766)))))

(declare-fun b!45457 () Bool)

(declare-fun e!30260 () Bool)

(assert (=> b!45457 (= e!30256 (not e!30260))))

(declare-fun res!38441 () Bool)

(assert (=> b!45457 (=> res!38441 e!30260)))

(assert (=> b!45457 (= res!38441 (bvsge i!635 to!314))))

(assert (=> b!45457 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69767 () Unit!3230)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1784) Unit!3230)

(assert (=> b!45457 (= lt!69767 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69764 () (_ BitVec 64))

(assert (=> b!45457 (= lt!69764 (bitIndex!0 (size!1020 (buf!1369 thiss!1379)) (currentByte!2862 thiss!1379) (currentBit!2857 thiss!1379)))))

(declare-fun b!45458 () Bool)

(assert (=> b!45458 (= e!30263 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69771 () tuple2!4438)

(declare-fun lt!69773 () (_ BitVec 64))

(declare-datatypes ((List!533 0))(
  ( (Nil!530) (Cons!529 (h!648 Bool) (t!1283 List!533)) )
))
(declare-fun lt!69774 () List!533)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1784 BitStream!1784 (_ BitVec 64)) List!533)

(assert (=> b!45458 (= lt!69774 (bitStreamReadBitsIntoList!0 (_2!2311 lt!69770) (_1!2312 lt!69771) lt!69773))))

(declare-fun lt!69777 () List!533)

(declare-fun lt!69763 () tuple2!4438)

(assert (=> b!45458 (= lt!69777 (bitStreamReadBitsIntoList!0 (_2!2311 lt!69770) (_1!2312 lt!69763) (bvsub to!314 i!635)))))

(assert (=> b!45458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1020 (buf!1369 (_2!2311 lt!69770)))) ((_ sign_extend 32) (currentByte!2862 (_2!2311 lt!69766))) ((_ sign_extend 32) (currentBit!2857 (_2!2311 lt!69766))) lt!69773)))

(declare-fun lt!69769 () Unit!3230)

(assert (=> b!45458 (= lt!69769 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2311 lt!69766) (buf!1369 (_2!2311 lt!69770)) lt!69773))))

(assert (=> b!45458 (= lt!69771 (reader!0 (_2!2311 lt!69766) (_2!2311 lt!69770)))))

(assert (=> b!45458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1020 (buf!1369 (_2!2311 lt!69770)))) ((_ sign_extend 32) (currentByte!2862 thiss!1379)) ((_ sign_extend 32) (currentBit!2857 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69768 () Unit!3230)

(assert (=> b!45458 (= lt!69768 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1369 (_2!2311 lt!69770)) (bvsub to!314 i!635)))))

(assert (=> b!45458 (= lt!69763 (reader!0 thiss!1379 (_2!2311 lt!69770)))))

(declare-fun b!45459 () Bool)

(declare-fun head!352 (List!533) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1784 array!2267 (_ BitVec 64) (_ BitVec 64)) List!533)

(assert (=> b!45459 (= e!30265 (= (head!352 (byteArrayBitContentToList!0 (_2!2311 lt!69766) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!352 (bitStreamReadBitsIntoList!0 (_2!2311 lt!69766) (_1!2312 lt!69776) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45460 () Bool)

(assert (=> b!45460 (= e!30260 e!30261)))

(declare-fun res!38446 () Bool)

(assert (=> b!45460 (=> res!38446 e!30261)))

(assert (=> b!45460 (= res!38446 (not (isPrefixOf!0 thiss!1379 (_2!2311 lt!69766))))))

(assert (=> b!45460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1020 (buf!1369 (_2!2311 lt!69766)))) ((_ sign_extend 32) (currentByte!2862 (_2!2311 lt!69766))) ((_ sign_extend 32) (currentBit!2857 (_2!2311 lt!69766))) lt!69773)))

(assert (=> b!45460 (= lt!69773 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69778 () Unit!3230)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1784 BitStream!1784 (_ BitVec 64) (_ BitVec 64)) Unit!3230)

(assert (=> b!45460 (= lt!69778 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2311 lt!69766) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1784 (_ BitVec 8) (_ BitVec 32)) tuple2!4436)

(assert (=> b!45460 (= lt!69766 (appendBitFromByte!0 thiss!1379 (select (arr!1537 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45461 () Bool)

(assert (=> b!45461 (= e!30262 e!30266)))

(declare-fun res!38451 () Bool)

(assert (=> b!45461 (=> res!38451 e!30266)))

(assert (=> b!45461 (= res!38451 (not (= lt!69775 (bvsub (bvadd lt!69764 to!314) i!635))))))

(assert (=> b!45461 (= lt!69775 (bitIndex!0 (size!1020 (buf!1369 (_2!2311 lt!69770))) (currentByte!2862 (_2!2311 lt!69770)) (currentBit!2857 (_2!2311 lt!69770))))))

(declare-fun b!45462 () Bool)

(declare-fun res!38448 () Bool)

(assert (=> b!45462 (=> res!38448 e!30266)))

(assert (=> b!45462 (= res!38448 (not (invariant!0 (currentBit!2857 (_2!2311 lt!69770)) (currentByte!2862 (_2!2311 lt!69770)) (size!1020 (buf!1369 (_2!2311 lt!69770))))))))

(declare-fun b!45463 () Bool)

(declare-fun res!38442 () Bool)

(assert (=> b!45463 (=> (not res!38442) (not e!30256))))

(assert (=> b!45463 (= res!38442 (validate_offset_bits!1 ((_ sign_extend 32) (size!1020 (buf!1369 thiss!1379))) ((_ sign_extend 32) (currentByte!2862 thiss!1379)) ((_ sign_extend 32) (currentBit!2857 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!9162 res!38447) b!45463))

(assert (= (and b!45463 res!38442) b!45457))

(assert (= (and b!45457 (not res!38441)) b!45460))

(assert (= (and b!45460 (not res!38446)) b!45456))

(assert (= (and b!45456 res!38449) b!45459))

(assert (= (and b!45456 (not res!38439)) b!45461))

(assert (= (and b!45461 (not res!38451)) b!45462))

(assert (= (and b!45462 (not res!38448)) b!45455))

(assert (= (and b!45455 (not res!38445)) b!45454))

(assert (= (and b!45454 res!38440) b!45450))

(assert (= (and b!45454 (not res!38444)) b!45452))

(assert (= (and b!45452 (not res!38443)) b!45451))

(assert (= (and b!45451 (not res!38450)) b!45458))

(assert (= start!9162 b!45453))

(declare-fun m!69343 () Bool)

(assert (=> b!45452 m!69343))

(declare-fun m!69345 () Bool)

(assert (=> b!45450 m!69345))

(declare-fun m!69347 () Bool)

(assert (=> b!45458 m!69347))

(declare-fun m!69349 () Bool)

(assert (=> b!45458 m!69349))

(declare-fun m!69351 () Bool)

(assert (=> b!45458 m!69351))

(declare-fun m!69353 () Bool)

(assert (=> b!45458 m!69353))

(declare-fun m!69355 () Bool)

(assert (=> b!45458 m!69355))

(declare-fun m!69357 () Bool)

(assert (=> b!45458 m!69357))

(declare-fun m!69359 () Bool)

(assert (=> b!45458 m!69359))

(declare-fun m!69361 () Bool)

(assert (=> b!45458 m!69361))

(declare-fun m!69363 () Bool)

(assert (=> start!9162 m!69363))

(declare-fun m!69365 () Bool)

(assert (=> start!9162 m!69365))

(declare-fun m!69367 () Bool)

(assert (=> b!45456 m!69367))

(declare-fun m!69369 () Bool)

(assert (=> b!45456 m!69369))

(declare-fun m!69371 () Bool)

(assert (=> b!45456 m!69371))

(declare-fun m!69373 () Bool)

(assert (=> b!45456 m!69373))

(declare-fun m!69375 () Bool)

(assert (=> b!45456 m!69375))

(declare-fun m!69377 () Bool)

(assert (=> b!45456 m!69377))

(declare-fun m!69379 () Bool)

(assert (=> b!45456 m!69379))

(declare-fun m!69381 () Bool)

(assert (=> b!45461 m!69381))

(declare-fun m!69383 () Bool)

(assert (=> b!45453 m!69383))

(declare-fun m!69385 () Bool)

(assert (=> b!45459 m!69385))

(assert (=> b!45459 m!69385))

(declare-fun m!69387 () Bool)

(assert (=> b!45459 m!69387))

(declare-fun m!69389 () Bool)

(assert (=> b!45459 m!69389))

(assert (=> b!45459 m!69389))

(declare-fun m!69391 () Bool)

(assert (=> b!45459 m!69391))

(declare-fun m!69393 () Bool)

(assert (=> b!45451 m!69393))

(declare-fun m!69395 () Bool)

(assert (=> b!45457 m!69395))

(declare-fun m!69397 () Bool)

(assert (=> b!45457 m!69397))

(declare-fun m!69399 () Bool)

(assert (=> b!45457 m!69399))

(declare-fun m!69401 () Bool)

(assert (=> b!45460 m!69401))

(declare-fun m!69403 () Bool)

(assert (=> b!45460 m!69403))

(declare-fun m!69405 () Bool)

(assert (=> b!45460 m!69405))

(assert (=> b!45460 m!69401))

(declare-fun m!69407 () Bool)

(assert (=> b!45460 m!69407))

(declare-fun m!69409 () Bool)

(assert (=> b!45460 m!69409))

(declare-fun m!69411 () Bool)

(assert (=> b!45462 m!69411))

(declare-fun m!69413 () Bool)

(assert (=> b!45463 m!69413))

(push 1)

(assert (not b!45450))

(assert (not b!45456))

(assert (not b!45459))

(assert (not b!45457))

(assert (not b!45458))

(assert (not b!45462))

(assert (not b!45460))

(assert (not start!9162))

(assert (not b!45451))

(assert (not b!45453))

(assert (not b!45461))

(assert (not b!45452))

(assert (not b!45463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

