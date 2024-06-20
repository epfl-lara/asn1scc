; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5114 () Bool)

(assert start!5114)

(declare-fun b!20340 () Bool)

(declare-fun e!13599 () Bool)

(assert (=> b!20340 (= e!13599 true)))

(declare-fun e!13604 () Bool)

(assert (=> b!20340 e!13604))

(declare-fun res!17673 () Bool)

(assert (=> b!20340 (=> (not res!17673) (not e!13604))))

(declare-datatypes ((array!1449 0))(
  ( (array!1450 (arr!1059 (Array (_ BitVec 32) (_ BitVec 8))) (size!615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1064 0))(
  ( (BitStream!1065 (buf!924 array!1449) (currentByte!2213 (_ BitVec 32)) (currentBit!2208 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1783 0))(
  ( (Unit!1784) )
))
(declare-datatypes ((tuple2!2368 0))(
  ( (tuple2!2369 (_1!1269 Unit!1783) (_2!1269 BitStream!1064)) )
))
(declare-fun lt!29044 () tuple2!2368)

(declare-fun thiss!1379 () BitStream!1064)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20340 (= res!17673 (validate_offset_bits!1 ((_ sign_extend 32) (size!615 (buf!924 (_2!1269 lt!29044)))) ((_ sign_extend 32) (currentByte!2213 thiss!1379)) ((_ sign_extend 32) (currentBit!2208 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29042 () Unit!1783)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1064 array!1449 (_ BitVec 64)) Unit!1783)

(assert (=> b!20340 (= lt!29042 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!924 (_2!1269 lt!29044)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2370 0))(
  ( (tuple2!2371 (_1!1270 BitStream!1064) (_2!1270 BitStream!1064)) )
))
(declare-fun lt!29043 () tuple2!2370)

(declare-fun reader!0 (BitStream!1064 BitStream!1064) tuple2!2370)

(assert (=> b!20340 (= lt!29043 (reader!0 thiss!1379 (_2!1269 lt!29044)))))

(declare-fun res!17671 () Bool)

(declare-fun e!13602 () Bool)

(assert (=> start!5114 (=> (not res!17671) (not e!13602))))

(declare-fun srcBuffer!2 () array!1449)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5114 (= res!17671 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!615 srcBuffer!2))))))))

(assert (=> start!5114 e!13602))

(assert (=> start!5114 true))

(declare-fun array_inv!585 (array!1449) Bool)

(assert (=> start!5114 (array_inv!585 srcBuffer!2)))

(declare-fun e!13601 () Bool)

(declare-fun inv!12 (BitStream!1064) Bool)

(assert (=> start!5114 (and (inv!12 thiss!1379) e!13601)))

(declare-fun b!20341 () Bool)

(declare-datatypes ((List!233 0))(
  ( (Nil!230) (Cons!229 (h!348 Bool) (t!983 List!233)) )
))
(declare-fun head!70 (List!233) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1064 array!1449 (_ BitVec 64) (_ BitVec 64)) List!233)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1064 BitStream!1064 (_ BitVec 64)) List!233)

(assert (=> b!20341 (= e!13604 (= (head!70 (byteArrayBitContentToList!0 (_2!1269 lt!29044) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!70 (bitStreamReadBitsIntoList!0 (_2!1269 lt!29044) (_1!1270 lt!29043) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20342 () Bool)

(declare-fun res!17674 () Bool)

(assert (=> b!20342 (=> (not res!17674) (not e!13602))))

(assert (=> b!20342 (= res!17674 (validate_offset_bits!1 ((_ sign_extend 32) (size!615 (buf!924 thiss!1379))) ((_ sign_extend 32) (currentByte!2213 thiss!1379)) ((_ sign_extend 32) (currentBit!2208 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20343 () Bool)

(assert (=> b!20343 (= e!13601 (array_inv!585 (buf!924 thiss!1379)))))

(declare-fun b!20344 () Bool)

(declare-fun e!13603 () Bool)

(assert (=> b!20344 (= e!13603 e!13599)))

(declare-fun res!17675 () Bool)

(assert (=> b!20344 (=> res!17675 e!13599)))

(declare-fun isPrefixOf!0 (BitStream!1064 BitStream!1064) Bool)

(assert (=> b!20344 (= res!17675 (not (isPrefixOf!0 thiss!1379 (_2!1269 lt!29044))))))

(assert (=> b!20344 (validate_offset_bits!1 ((_ sign_extend 32) (size!615 (buf!924 (_2!1269 lt!29044)))) ((_ sign_extend 32) (currentByte!2213 (_2!1269 lt!29044))) ((_ sign_extend 32) (currentBit!2208 (_2!1269 lt!29044))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29045 () Unit!1783)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1064 BitStream!1064 (_ BitVec 64) (_ BitVec 64)) Unit!1783)

(assert (=> b!20344 (= lt!29045 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1269 lt!29044) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1064 (_ BitVec 8) (_ BitVec 32)) tuple2!2368)

(assert (=> b!20344 (= lt!29044 (appendBitFromByte!0 thiss!1379 (select (arr!1059 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20345 () Bool)

(assert (=> b!20345 (= e!13602 (not e!13603))))

(declare-fun res!17672 () Bool)

(assert (=> b!20345 (=> res!17672 e!13603)))

(assert (=> b!20345 (= res!17672 (bvsge i!635 to!314))))

(assert (=> b!20345 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29047 () Unit!1783)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1064) Unit!1783)

(assert (=> b!20345 (= lt!29047 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29046 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20345 (= lt!29046 (bitIndex!0 (size!615 (buf!924 thiss!1379)) (currentByte!2213 thiss!1379) (currentBit!2208 thiss!1379)))))

(assert (= (and start!5114 res!17671) b!20342))

(assert (= (and b!20342 res!17674) b!20345))

(assert (= (and b!20345 (not res!17672)) b!20344))

(assert (= (and b!20344 (not res!17675)) b!20340))

(assert (= (and b!20340 res!17673) b!20341))

(assert (= start!5114 b!20343))

(declare-fun m!27511 () Bool)

(assert (=> b!20345 m!27511))

(declare-fun m!27513 () Bool)

(assert (=> b!20345 m!27513))

(declare-fun m!27515 () Bool)

(assert (=> b!20345 m!27515))

(declare-fun m!27517 () Bool)

(assert (=> b!20343 m!27517))

(declare-fun m!27519 () Bool)

(assert (=> start!5114 m!27519))

(declare-fun m!27521 () Bool)

(assert (=> start!5114 m!27521))

(declare-fun m!27523 () Bool)

(assert (=> b!20340 m!27523))

(declare-fun m!27525 () Bool)

(assert (=> b!20340 m!27525))

(declare-fun m!27527 () Bool)

(assert (=> b!20340 m!27527))

(declare-fun m!27529 () Bool)

(assert (=> b!20341 m!27529))

(assert (=> b!20341 m!27529))

(declare-fun m!27531 () Bool)

(assert (=> b!20341 m!27531))

(declare-fun m!27533 () Bool)

(assert (=> b!20341 m!27533))

(assert (=> b!20341 m!27533))

(declare-fun m!27535 () Bool)

(assert (=> b!20341 m!27535))

(declare-fun m!27537 () Bool)

(assert (=> b!20342 m!27537))

(declare-fun m!27539 () Bool)

(assert (=> b!20344 m!27539))

(declare-fun m!27541 () Bool)

(assert (=> b!20344 m!27541))

(assert (=> b!20344 m!27539))

(declare-fun m!27543 () Bool)

(assert (=> b!20344 m!27543))

(declare-fun m!27545 () Bool)

(assert (=> b!20344 m!27545))

(declare-fun m!27547 () Bool)

(assert (=> b!20344 m!27547))

(push 1)

(assert (not b!20340))

(assert (not b!20341))

(assert (not start!5114))

(assert (not b!20344))

(assert (not b!20342))

(assert (not b!20343))

(assert (not b!20345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

