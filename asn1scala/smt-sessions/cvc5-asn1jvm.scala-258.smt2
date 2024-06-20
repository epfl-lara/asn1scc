; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5038 () Bool)

(assert start!5038)

(declare-fun b!20038 () Bool)

(declare-fun e!13390 () Bool)

(declare-datatypes ((array!1436 0))(
  ( (array!1437 (arr!1054 (Array (_ BitVec 32) (_ BitVec 8))) (size!610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1054 0))(
  ( (BitStream!1055 (buf!916 array!1436) (currentByte!2202 (_ BitVec 32)) (currentBit!2197 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1770 0))(
  ( (Unit!1771) )
))
(declare-datatypes ((tuple2!2324 0))(
  ( (tuple2!2325 (_1!1247 Unit!1770) (_2!1247 BitStream!1054)) )
))
(declare-fun lt!28561 () tuple2!2324)

(declare-datatypes ((tuple2!2326 0))(
  ( (tuple2!2327 (_1!1248 BitStream!1054) (_2!1248 BitStream!1054)) )
))
(declare-fun lt!28557 () tuple2!2326)

(declare-datatypes ((List!228 0))(
  ( (Nil!225) (Cons!224 (h!343 Bool) (t!978 List!228)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1054 BitStream!1054 (_ BitVec 64)) List!228)

(assert (=> b!20038 (= e!13390 (not (= (bitStreamReadBitsIntoList!0 (_2!1247 lt!28561) (_1!1248 lt!28557) #b0000000000000000000000000000000000000000000000000000000000000001) Nil!225)))))

(declare-fun thiss!1379 () BitStream!1054)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20038 (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28558 () Unit!1770)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1054 array!1436 (_ BitVec 64)) Unit!1770)

(assert (=> b!20038 (= lt!28558 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!916 (_2!1247 lt!28561)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1054 BitStream!1054) tuple2!2326)

(assert (=> b!20038 (= lt!28557 (reader!0 thiss!1379 (_2!1247 lt!28561)))))

(declare-fun b!20039 () Bool)

(declare-fun e!13389 () Bool)

(declare-fun array_inv!580 (array!1436) Bool)

(assert (=> b!20039 (= e!13389 (array_inv!580 (buf!916 thiss!1379)))))

(declare-fun b!20041 () Bool)

(declare-fun res!17443 () Bool)

(declare-fun e!13392 () Bool)

(assert (=> b!20041 (=> (not res!17443) (not e!13392))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20041 (= res!17443 (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20042 () Bool)

(declare-fun e!13387 () Bool)

(assert (=> b!20042 (= e!13387 e!13390)))

(declare-fun res!17444 () Bool)

(assert (=> b!20042 (=> res!17444 e!13390)))

(declare-fun isPrefixOf!0 (BitStream!1054 BitStream!1054) Bool)

(assert (=> b!20042 (= res!17444 (not (isPrefixOf!0 thiss!1379 (_2!1247 lt!28561))))))

(assert (=> b!20042 (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 (_2!1247 lt!28561))) ((_ sign_extend 32) (currentBit!2197 (_2!1247 lt!28561))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28560 () Unit!1770)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1054 BitStream!1054 (_ BitVec 64) (_ BitVec 64)) Unit!1770)

(assert (=> b!20042 (= lt!28560 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1247 lt!28561) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1436)

(declare-fun appendBitFromByte!0 (BitStream!1054 (_ BitVec 8) (_ BitVec 32)) tuple2!2324)

(assert (=> b!20042 (= lt!28561 (appendBitFromByte!0 thiss!1379 (select (arr!1054 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20040 () Bool)

(assert (=> b!20040 (= e!13392 (not e!13387))))

(declare-fun res!17441 () Bool)

(assert (=> b!20040 (=> res!17441 e!13387)))

(assert (=> b!20040 (= res!17441 (bvsge i!635 to!314))))

(assert (=> b!20040 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28559 () Unit!1770)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1054) Unit!1770)

(assert (=> b!20040 (= lt!28559 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28556 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20040 (= lt!28556 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)))))

(declare-fun res!17442 () Bool)

(assert (=> start!5038 (=> (not res!17442) (not e!13392))))

(assert (=> start!5038 (= res!17442 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!610 srcBuffer!2))))))))

(assert (=> start!5038 e!13392))

(assert (=> start!5038 true))

(assert (=> start!5038 (array_inv!580 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1054) Bool)

(assert (=> start!5038 (and (inv!12 thiss!1379) e!13389)))

(assert (= (and start!5038 res!17442) b!20041))

(assert (= (and b!20041 res!17443) b!20040))

(assert (= (and b!20040 (not res!17441)) b!20042))

(assert (= (and b!20042 (not res!17444)) b!20038))

(assert (= start!5038 b!20039))

(declare-fun m!27093 () Bool)

(assert (=> b!20042 m!27093))

(declare-fun m!27095 () Bool)

(assert (=> b!20042 m!27095))

(declare-fun m!27097 () Bool)

(assert (=> b!20042 m!27097))

(declare-fun m!27099 () Bool)

(assert (=> b!20042 m!27099))

(assert (=> b!20042 m!27095))

(declare-fun m!27101 () Bool)

(assert (=> b!20042 m!27101))

(declare-fun m!27103 () Bool)

(assert (=> b!20039 m!27103))

(declare-fun m!27105 () Bool)

(assert (=> b!20040 m!27105))

(declare-fun m!27107 () Bool)

(assert (=> b!20040 m!27107))

(declare-fun m!27109 () Bool)

(assert (=> b!20040 m!27109))

(declare-fun m!27111 () Bool)

(assert (=> b!20038 m!27111))

(declare-fun m!27113 () Bool)

(assert (=> b!20038 m!27113))

(declare-fun m!27115 () Bool)

(assert (=> b!20038 m!27115))

(declare-fun m!27117 () Bool)

(assert (=> b!20038 m!27117))

(declare-fun m!27119 () Bool)

(assert (=> b!20041 m!27119))

(declare-fun m!27121 () Bool)

(assert (=> start!5038 m!27121))

(declare-fun m!27123 () Bool)

(assert (=> start!5038 m!27123))

(push 1)

(assert (not b!20042))

(assert (not b!20039))

(assert (not b!20041))

(assert (not b!20040))

(assert (not b!20038))

(assert (not start!5038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6544 () Bool)

(assert (=> d!6544 (= (array_inv!580 srcBuffer!2) (bvsge (size!610 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5038 d!6544))

(declare-fun d!6546 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6546 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2197 thiss!1379) (currentByte!2202 thiss!1379) (size!610 (buf!916 thiss!1379))))))

(declare-fun bs!1923 () Bool)

(assert (= bs!1923 d!6546))

(declare-fun m!27197 () Bool)

(assert (=> bs!1923 m!27197))

(assert (=> start!5038 d!6546))

(declare-fun lt!28650 () (_ BitVec 64))

(declare-fun b!20121 () Bool)

(declare-datatypes ((tuple2!2348 0))(
  ( (tuple2!2349 (_1!1259 Bool) (_2!1259 BitStream!1054)) )
))
(declare-fun lt!28651 () tuple2!2348)

(declare-datatypes ((tuple2!2350 0))(
  ( (tuple2!2351 (_1!1260 List!228) (_2!1260 BitStream!1054)) )
))
(declare-fun e!13454 () tuple2!2350)

(assert (=> b!20121 (= e!13454 (tuple2!2351 (Cons!224 (_1!1259 lt!28651) (bitStreamReadBitsIntoList!0 (_2!1247 lt!28561) (_2!1259 lt!28651) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28650))) (_2!1259 lt!28651)))))

(declare-fun readBit!0 (BitStream!1054) tuple2!2348)

(assert (=> b!20121 (= lt!28651 (readBit!0 (_1!1248 lt!28557)))))

(assert (=> b!20121 (= lt!28650 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!6548 () Bool)

(declare-fun e!13455 () Bool)

(assert (=> d!6548 e!13455))

(declare-fun c!1449 () Bool)

(assert (=> d!6548 (= c!1449 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!28649 () List!228)

(assert (=> d!6548 (= lt!28649 (_1!1260 e!13454))))

(declare-fun c!1450 () Bool)

(assert (=> d!6548 (= c!1450 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6548 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6548 (= (bitStreamReadBitsIntoList!0 (_2!1247 lt!28561) (_1!1248 lt!28557) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28649)))

(declare-fun b!20122 () Bool)

(declare-fun isEmpty!54 (List!228) Bool)

(assert (=> b!20122 (= e!13455 (isEmpty!54 lt!28649))))

(declare-fun b!20123 () Bool)

(declare-fun length!49 (List!228) Int)

(assert (=> b!20123 (= e!13455 (> (length!49 lt!28649) 0))))

(declare-fun b!20120 () Bool)

(assert (=> b!20120 (= e!13454 (tuple2!2351 Nil!225 (_1!1248 lt!28557)))))

(assert (= (and d!6548 c!1450) b!20120))

(assert (= (and d!6548 (not c!1450)) b!20121))

(assert (= (and d!6548 c!1449) b!20122))

(assert (= (and d!6548 (not c!1449)) b!20123))

(declare-fun m!27223 () Bool)

(assert (=> b!20121 m!27223))

(declare-fun m!27225 () Bool)

(assert (=> b!20121 m!27225))

(declare-fun m!27227 () Bool)

(assert (=> b!20122 m!27227))

(declare-fun m!27229 () Bool)

(assert (=> b!20123 m!27229))

(assert (=> b!20038 d!6548))

(declare-fun d!6564 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1928 () Bool)

(assert (= bs!1928 d!6564))

(declare-fun m!27231 () Bool)

(assert (=> bs!1928 m!27231))

(assert (=> b!20038 d!6564))

(declare-fun d!6566 () Bool)

(assert (=> d!6566 (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28654 () Unit!1770)

(declare-fun choose!9 (BitStream!1054 array!1436 (_ BitVec 64) BitStream!1054) Unit!1770)

(assert (=> d!6566 (= lt!28654 (choose!9 thiss!1379 (buf!916 (_2!1247 lt!28561)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1055 (buf!916 (_2!1247 lt!28561)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379))))))

(assert (=> d!6566 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!916 (_2!1247 lt!28561)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28654)))

(declare-fun bs!1929 () Bool)

(assert (= bs!1929 d!6566))

(assert (=> bs!1929 m!27113))

(declare-fun m!27233 () Bool)

(assert (=> bs!1929 m!27233))

(assert (=> b!20038 d!6566))

(declare-fun b!20179 () Bool)

(declare-fun e!13483 () Unit!1770)

(declare-fun lt!28832 () Unit!1770)

(assert (=> b!20179 (= e!13483 lt!28832)))

(declare-fun lt!28828 () (_ BitVec 64))

(assert (=> b!20179 (= lt!28828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28834 () (_ BitVec 64))

(assert (=> b!20179 (= lt!28834 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1436 array!1436 (_ BitVec 64) (_ BitVec 64)) Unit!1770)

(assert (=> b!20179 (= lt!28832 (arrayBitRangesEqSymmetric!0 (buf!916 thiss!1379) (buf!916 (_2!1247 lt!28561)) lt!28828 lt!28834))))

(declare-fun arrayBitRangesEq!0 (array!1436 array!1436 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20179 (arrayBitRangesEq!0 (buf!916 (_2!1247 lt!28561)) (buf!916 thiss!1379) lt!28828 lt!28834)))

(declare-fun b!20180 () Bool)

(declare-fun res!17525 () Bool)

(declare-fun e!13484 () Bool)

(assert (=> b!20180 (=> (not res!17525) (not e!13484))))

(declare-fun lt!28821 () tuple2!2326)

(assert (=> b!20180 (= res!17525 (isPrefixOf!0 (_1!1248 lt!28821) thiss!1379))))

(declare-fun b!20181 () Bool)

(declare-fun Unit!1778 () Unit!1770)

(assert (=> b!20181 (= e!13483 Unit!1778)))

(declare-fun lt!28839 () (_ BitVec 64))

(declare-fun b!20182 () Bool)

(declare-fun lt!28838 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1054 (_ BitVec 64)) BitStream!1054)

(assert (=> b!20182 (= e!13484 (= (_1!1248 lt!28821) (withMovedBitIndex!0 (_2!1248 lt!28821) (bvsub lt!28838 lt!28839))))))

(assert (=> b!20182 (or (= (bvand lt!28838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28838 lt!28839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20182 (= lt!28839 (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28561))) (currentByte!2202 (_2!1247 lt!28561)) (currentBit!2197 (_2!1247 lt!28561))))))

(assert (=> b!20182 (= lt!28838 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)))))

(declare-fun d!6568 () Bool)

(assert (=> d!6568 e!13484))

(declare-fun res!17524 () Bool)

(assert (=> d!6568 (=> (not res!17524) (not e!13484))))

(assert (=> d!6568 (= res!17524 (isPrefixOf!0 (_1!1248 lt!28821) (_2!1248 lt!28821)))))

(declare-fun lt!28833 () BitStream!1054)

(assert (=> d!6568 (= lt!28821 (tuple2!2327 lt!28833 (_2!1247 lt!28561)))))

(declare-fun lt!28829 () Unit!1770)

(declare-fun lt!28837 () Unit!1770)

(assert (=> d!6568 (= lt!28829 lt!28837)))

(assert (=> d!6568 (isPrefixOf!0 lt!28833 (_2!1247 lt!28561))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1054 BitStream!1054 BitStream!1054) Unit!1770)

(assert (=> d!6568 (= lt!28837 (lemmaIsPrefixTransitive!0 lt!28833 (_2!1247 lt!28561) (_2!1247 lt!28561)))))

(declare-fun lt!28825 () Unit!1770)

(declare-fun lt!28822 () Unit!1770)

(assert (=> d!6568 (= lt!28825 lt!28822)))

(assert (=> d!6568 (isPrefixOf!0 lt!28833 (_2!1247 lt!28561))))

(assert (=> d!6568 (= lt!28822 (lemmaIsPrefixTransitive!0 lt!28833 thiss!1379 (_2!1247 lt!28561)))))

(declare-fun lt!28840 () Unit!1770)

(assert (=> d!6568 (= lt!28840 e!13483)))

(declare-fun c!1459 () Bool)

(assert (=> d!6568 (= c!1459 (not (= (size!610 (buf!916 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28824 () Unit!1770)

(declare-fun lt!28830 () Unit!1770)

(assert (=> d!6568 (= lt!28824 lt!28830)))

(assert (=> d!6568 (isPrefixOf!0 (_2!1247 lt!28561) (_2!1247 lt!28561))))

(assert (=> d!6568 (= lt!28830 (lemmaIsPrefixRefl!0 (_2!1247 lt!28561)))))

(declare-fun lt!28827 () Unit!1770)

(declare-fun lt!28826 () Unit!1770)

(assert (=> d!6568 (= lt!28827 lt!28826)))

(assert (=> d!6568 (= lt!28826 (lemmaIsPrefixRefl!0 (_2!1247 lt!28561)))))

(declare-fun lt!28836 () Unit!1770)

(declare-fun lt!28831 () Unit!1770)

(assert (=> d!6568 (= lt!28836 lt!28831)))

(assert (=> d!6568 (isPrefixOf!0 lt!28833 lt!28833)))

(assert (=> d!6568 (= lt!28831 (lemmaIsPrefixRefl!0 lt!28833))))

(declare-fun lt!28835 () Unit!1770)

(declare-fun lt!28823 () Unit!1770)

(assert (=> d!6568 (= lt!28835 lt!28823)))

(assert (=> d!6568 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6568 (= lt!28823 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6568 (= lt!28833 (BitStream!1055 (buf!916 (_2!1247 lt!28561)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)))))

(assert (=> d!6568 (isPrefixOf!0 thiss!1379 (_2!1247 lt!28561))))

(assert (=> d!6568 (= (reader!0 thiss!1379 (_2!1247 lt!28561)) lt!28821)))

(declare-fun b!20183 () Bool)

(declare-fun res!17523 () Bool)

(assert (=> b!20183 (=> (not res!17523) (not e!13484))))

(assert (=> b!20183 (= res!17523 (isPrefixOf!0 (_2!1248 lt!28821) (_2!1247 lt!28561)))))

(assert (= (and d!6568 c!1459) b!20179))

(assert (= (and d!6568 (not c!1459)) b!20181))

(assert (= (and d!6568 res!17524) b!20180))

(assert (= (and b!20180 res!17525) b!20183))

(assert (= (and b!20183 res!17523) b!20182))

(declare-fun m!27303 () Bool)

(assert (=> b!20183 m!27303))

(declare-fun m!27305 () Bool)

(assert (=> d!6568 m!27305))

(declare-fun m!27307 () Bool)

(assert (=> d!6568 m!27307))

(declare-fun m!27309 () Bool)

(assert (=> d!6568 m!27309))

(assert (=> d!6568 m!27105))

(assert (=> d!6568 m!27099))

(declare-fun m!27311 () Bool)

(assert (=> d!6568 m!27311))

(declare-fun m!27313 () Bool)

(assert (=> d!6568 m!27313))

(assert (=> d!6568 m!27107))

(declare-fun m!27315 () Bool)

(assert (=> d!6568 m!27315))

(declare-fun m!27317 () Bool)

(assert (=> d!6568 m!27317))

(declare-fun m!27319 () Bool)

(assert (=> d!6568 m!27319))

(assert (=> b!20179 m!27109))

(declare-fun m!27321 () Bool)

(assert (=> b!20179 m!27321))

(declare-fun m!27323 () Bool)

(assert (=> b!20179 m!27323))

(declare-fun m!27325 () Bool)

(assert (=> b!20180 m!27325))

(declare-fun m!27327 () Bool)

(assert (=> b!20182 m!27327))

(declare-fun m!27329 () Bool)

(assert (=> b!20182 m!27329))

(assert (=> b!20182 m!27109))

(assert (=> b!20038 d!6568))

(declare-fun d!6590 () Bool)

(declare-fun res!17541 () Bool)

(declare-fun e!13494 () Bool)

(assert (=> d!6590 (=> (not res!17541) (not e!13494))))

(assert (=> d!6590 (= res!17541 (= (size!610 (buf!916 thiss!1379)) (size!610 (buf!916 (_2!1247 lt!28561)))))))

(assert (=> d!6590 (= (isPrefixOf!0 thiss!1379 (_2!1247 lt!28561)) e!13494)))

(declare-fun b!20199 () Bool)

(declare-fun res!17542 () Bool)

(assert (=> b!20199 (=> (not res!17542) (not e!13494))))

(assert (=> b!20199 (= res!17542 (bvsle (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)) (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28561))) (currentByte!2202 (_2!1247 lt!28561)) (currentBit!2197 (_2!1247 lt!28561)))))))

(declare-fun b!20200 () Bool)

(declare-fun e!13495 () Bool)

(assert (=> b!20200 (= e!13494 e!13495)))

(declare-fun res!17543 () Bool)

(assert (=> b!20200 (=> res!17543 e!13495)))

(assert (=> b!20200 (= res!17543 (= (size!610 (buf!916 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20201 () Bool)

(assert (=> b!20201 (= e!13495 (arrayBitRangesEq!0 (buf!916 thiss!1379) (buf!916 (_2!1247 lt!28561)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379))))))

(assert (= (and d!6590 res!17541) b!20199))

(assert (= (and b!20199 res!17542) b!20200))

(assert (= (and b!20200 (not res!17543)) b!20201))

(assert (=> b!20199 m!27109))

(assert (=> b!20199 m!27329))

(assert (=> b!20201 m!27109))

(assert (=> b!20201 m!27109))

(declare-fun m!27337 () Bool)

(assert (=> b!20201 m!27337))

(assert (=> b!20042 d!6590))

(declare-fun d!6600 () Bool)

(assert (=> d!6600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 (_2!1247 lt!28561))) ((_ sign_extend 32) (currentBit!2197 (_2!1247 lt!28561))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 (_2!1247 lt!28561))) ((_ sign_extend 32) (currentBit!2197 (_2!1247 lt!28561)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1936 () Bool)

(assert (= bs!1936 d!6600))

(declare-fun m!27339 () Bool)

(assert (=> bs!1936 m!27339))

(assert (=> b!20042 d!6600))

(declare-fun d!6602 () Bool)

(declare-fun e!13501 () Bool)

(assert (=> d!6602 e!13501))

(declare-fun res!17549 () Bool)

(assert (=> d!6602 (=> (not res!17549) (not e!13501))))

(assert (=> d!6602 (= res!17549 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28864 () Unit!1770)

(declare-fun choose!27 (BitStream!1054 BitStream!1054 (_ BitVec 64) (_ BitVec 64)) Unit!1770)

(assert (=> d!6602 (= lt!28864 (choose!27 thiss!1379 (_2!1247 lt!28561) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6602 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1247 lt!28561) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28864)))

(declare-fun b!20207 () Bool)

(assert (=> b!20207 (= e!13501 (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 (_2!1247 lt!28561)))) ((_ sign_extend 32) (currentByte!2202 (_2!1247 lt!28561))) ((_ sign_extend 32) (currentBit!2197 (_2!1247 lt!28561))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6602 res!17549) b!20207))

(declare-fun m!27343 () Bool)

(assert (=> d!6602 m!27343))

(assert (=> b!20207 m!27093))

(assert (=> b!20042 d!6602))

(declare-fun b!20275 () Bool)

(declare-fun res!17615 () Bool)

(declare-fun e!13536 () Bool)

(assert (=> b!20275 (=> (not res!17615) (not e!13536))))

(declare-fun lt!28966 () tuple2!2324)

(assert (=> b!20275 (= res!17615 (isPrefixOf!0 thiss!1379 (_2!1247 lt!28966)))))

(declare-fun b!20276 () Bool)

(declare-fun e!13537 () Bool)

(declare-datatypes ((tuple2!2356 0))(
  ( (tuple2!2357 (_1!1263 BitStream!1054) (_2!1263 Bool)) )
))
(declare-fun lt!28963 () tuple2!2356)

(declare-fun lt!28967 () tuple2!2324)

(assert (=> b!20276 (= e!13537 (= (bitIndex!0 (size!610 (buf!916 (_1!1263 lt!28963))) (currentByte!2202 (_1!1263 lt!28963)) (currentBit!2197 (_1!1263 lt!28963))) (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28967))) (currentByte!2202 (_2!1247 lt!28967)) (currentBit!2197 (_2!1247 lt!28967)))))))

(declare-fun b!20277 () Bool)

(declare-fun e!13535 () Bool)

(declare-fun lt!28972 () tuple2!2356)

(assert (=> b!20277 (= e!13535 (= (bitIndex!0 (size!610 (buf!916 (_1!1263 lt!28972))) (currentByte!2202 (_1!1263 lt!28972)) (currentBit!2197 (_1!1263 lt!28972))) (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28966))) (currentByte!2202 (_2!1247 lt!28966)) (currentBit!2197 (_2!1247 lt!28966)))))))

(declare-fun d!6606 () Bool)

(assert (=> d!6606 e!13536))

(declare-fun res!17620 () Bool)

(assert (=> d!6606 (=> (not res!17620) (not e!13536))))

(assert (=> d!6606 (= res!17620 (= (size!610 (buf!916 (_2!1247 lt!28966))) (size!610 (buf!916 thiss!1379))))))

(declare-fun lt!28961 () (_ BitVec 8))

(declare-fun lt!28968 () array!1436)

(assert (=> d!6606 (= lt!28961 (select (arr!1054 lt!28968) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6606 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!610 lt!28968)))))

(assert (=> d!6606 (= lt!28968 (array!1437 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28971 () tuple2!2324)

(assert (=> d!6606 (= lt!28966 (tuple2!2325 (_1!1247 lt!28971) (_2!1247 lt!28971)))))

(assert (=> d!6606 (= lt!28971 lt!28967)))

(declare-fun e!13534 () Bool)

(assert (=> d!6606 e!13534))

(declare-fun res!17614 () Bool)

(assert (=> d!6606 (=> (not res!17614) (not e!13534))))

(assert (=> d!6606 (= res!17614 (= (size!610 (buf!916 thiss!1379)) (size!610 (buf!916 (_2!1247 lt!28967)))))))

(declare-fun lt!28962 () Bool)

(declare-fun appendBit!0 (BitStream!1054 Bool) tuple2!2324)

(assert (=> d!6606 (= lt!28967 (appendBit!0 thiss!1379 lt!28962))))

(assert (=> d!6606 (= lt!28962 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1054 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6606 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6606 (= (appendBitFromByte!0 thiss!1379 (select (arr!1054 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28966)))

(declare-fun b!20278 () Bool)

(assert (=> b!20278 (= e!13534 e!13537)))

(declare-fun res!17621 () Bool)

(assert (=> b!20278 (=> (not res!17621) (not e!13537))))

(assert (=> b!20278 (= res!17621 (and (= (_2!1263 lt!28963) lt!28962) (= (_1!1263 lt!28963) (_2!1247 lt!28967))))))

(declare-fun readBitPure!0 (BitStream!1054) tuple2!2356)

(declare-fun readerFrom!0 (BitStream!1054 (_ BitVec 32) (_ BitVec 32)) BitStream!1054)

(assert (=> b!20278 (= lt!28963 (readBitPure!0 (readerFrom!0 (_2!1247 lt!28967) (currentBit!2197 thiss!1379) (currentByte!2202 thiss!1379))))))

(declare-fun b!20279 () Bool)

(declare-fun res!17618 () Bool)

(assert (=> b!20279 (=> (not res!17618) (not e!13534))))

(assert (=> b!20279 (= res!17618 (isPrefixOf!0 thiss!1379 (_2!1247 lt!28967)))))

(declare-fun b!20280 () Bool)

(assert (=> b!20280 (= e!13536 e!13535)))

(declare-fun res!17619 () Bool)

(assert (=> b!20280 (=> (not res!17619) (not e!13535))))

(assert (=> b!20280 (= res!17619 (and (= (_2!1263 lt!28972) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1054 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28961)) #b00000000000000000000000000000000))) (= (_1!1263 lt!28972) (_2!1247 lt!28966))))))

(declare-datatypes ((tuple2!2358 0))(
  ( (tuple2!2359 (_1!1264 array!1436) (_2!1264 BitStream!1054)) )
))
(declare-fun lt!28970 () tuple2!2358)

(declare-fun lt!28965 () BitStream!1054)

(declare-fun readBits!0 (BitStream!1054 (_ BitVec 64)) tuple2!2358)

(assert (=> b!20280 (= lt!28970 (readBits!0 lt!28965 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!20280 (= lt!28972 (readBitPure!0 lt!28965))))

(assert (=> b!20280 (= lt!28965 (readerFrom!0 (_2!1247 lt!28966) (currentBit!2197 thiss!1379) (currentByte!2202 thiss!1379)))))

(declare-fun b!20281 () Bool)

(declare-fun res!17617 () Bool)

(assert (=> b!20281 (=> (not res!17617) (not e!13534))))

(assert (=> b!20281 (= res!17617 (= (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28967))) (currentByte!2202 (_2!1247 lt!28967)) (currentBit!2197 (_2!1247 lt!28967))) (bvadd (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!20282 () Bool)

(declare-fun res!17616 () Bool)

(assert (=> b!20282 (=> (not res!17616) (not e!13536))))

(declare-fun lt!28969 () (_ BitVec 64))

(declare-fun lt!28964 () (_ BitVec 64))

(assert (=> b!20282 (= res!17616 (= (bitIndex!0 (size!610 (buf!916 (_2!1247 lt!28966))) (currentByte!2202 (_2!1247 lt!28966)) (currentBit!2197 (_2!1247 lt!28966))) (bvadd lt!28969 lt!28964)))))

(assert (=> b!20282 (or (not (= (bvand lt!28969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28964 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28969 lt!28964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20282 (= lt!28964 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!20282 (= lt!28969 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)))))

(assert (= (and d!6606 res!17614) b!20281))

(assert (= (and b!20281 res!17617) b!20279))

(assert (= (and b!20279 res!17618) b!20278))

(assert (= (and b!20278 res!17621) b!20276))

(assert (= (and d!6606 res!17620) b!20282))

(assert (= (and b!20282 res!17616) b!20275))

(assert (= (and b!20275 res!17615) b!20280))

(assert (= (and b!20280 res!17619) b!20277))

(declare-fun m!27401 () Bool)

(assert (=> b!20277 m!27401))

(declare-fun m!27403 () Bool)

(assert (=> b!20277 m!27403))

(declare-fun m!27405 () Bool)

(assert (=> b!20279 m!27405))

(declare-fun m!27407 () Bool)

(assert (=> b!20281 m!27407))

(assert (=> b!20281 m!27109))

(declare-fun m!27409 () Bool)

(assert (=> b!20280 m!27409))

(declare-fun m!27411 () Bool)

(assert (=> b!20280 m!27411))

(declare-fun m!27413 () Bool)

(assert (=> b!20280 m!27413))

(declare-fun m!27415 () Bool)

(assert (=> b!20278 m!27415))

(assert (=> b!20278 m!27415))

(declare-fun m!27417 () Bool)

(assert (=> b!20278 m!27417))

(declare-fun m!27419 () Bool)

(assert (=> b!20276 m!27419))

(assert (=> b!20276 m!27407))

(declare-fun m!27421 () Bool)

(assert (=> d!6606 m!27421))

(declare-fun m!27423 () Bool)

(assert (=> d!6606 m!27423))

(declare-fun m!27425 () Bool)

(assert (=> d!6606 m!27425))

(declare-fun m!27427 () Bool)

(assert (=> b!20275 m!27427))

(assert (=> b!20282 m!27403))

(assert (=> b!20282 m!27109))

(assert (=> b!20042 d!6606))

(declare-fun d!6610 () Bool)

(assert (=> d!6610 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1937 () Bool)

(assert (= bs!1937 d!6610))

(declare-fun m!27429 () Bool)

(assert (=> bs!1937 m!27429))

(assert (=> b!20041 d!6610))

(declare-fun d!6612 () Bool)

(assert (=> d!6612 (= (array_inv!580 (buf!916 thiss!1379)) (bvsge (size!610 (buf!916 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!20039 d!6612))

(declare-fun d!6614 () Bool)

(declare-fun res!17622 () Bool)

(declare-fun e!13538 () Bool)

(assert (=> d!6614 (=> (not res!17622) (not e!13538))))

(assert (=> d!6614 (= res!17622 (= (size!610 (buf!916 thiss!1379)) (size!610 (buf!916 thiss!1379))))))

(assert (=> d!6614 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13538)))

(declare-fun b!20283 () Bool)

(declare-fun res!17623 () Bool)

(assert (=> b!20283 (=> (not res!17623) (not e!13538))))

(assert (=> b!20283 (= res!17623 (bvsle (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)) (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379))))))

(declare-fun b!20284 () Bool)

(declare-fun e!13539 () Bool)

(assert (=> b!20284 (= e!13538 e!13539)))

(declare-fun res!17624 () Bool)

(assert (=> b!20284 (=> res!17624 e!13539)))

(assert (=> b!20284 (= res!17624 (= (size!610 (buf!916 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20285 () Bool)

(assert (=> b!20285 (= e!13539 (arrayBitRangesEq!0 (buf!916 thiss!1379) (buf!916 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379))))))

(assert (= (and d!6614 res!17622) b!20283))

(assert (= (and b!20283 res!17623) b!20284))

(assert (= (and b!20284 (not res!17624)) b!20285))

(assert (=> b!20283 m!27109))

(assert (=> b!20283 m!27109))

(assert (=> b!20285 m!27109))

(assert (=> b!20285 m!27109))

(declare-fun m!27431 () Bool)

(assert (=> b!20285 m!27431))

(assert (=> b!20040 d!6614))

(declare-fun d!6616 () Bool)

(assert (=> d!6616 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28975 () Unit!1770)

(declare-fun choose!11 (BitStream!1054) Unit!1770)

(assert (=> d!6616 (= lt!28975 (choose!11 thiss!1379))))

(assert (=> d!6616 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!28975)))

(declare-fun bs!1939 () Bool)

(assert (= bs!1939 d!6616))

(assert (=> bs!1939 m!27105))

(declare-fun m!27433 () Bool)

(assert (=> bs!1939 m!27433))

(assert (=> b!20040 d!6616))

(declare-fun d!6618 () Bool)

(declare-fun e!13542 () Bool)

(assert (=> d!6618 e!13542))

(declare-fun res!17629 () Bool)

(assert (=> d!6618 (=> (not res!17629) (not e!13542))))

(declare-fun lt!28989 () (_ BitVec 64))

(declare-fun lt!28993 () (_ BitVec 64))

(declare-fun lt!28990 () (_ BitVec 64))

(assert (=> d!6618 (= res!17629 (= lt!28989 (bvsub lt!28990 lt!28993)))))

(assert (=> d!6618 (or (= (bvand lt!28990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28993 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28990 lt!28993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6618 (= lt!28993 (remainingBits!0 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))) ((_ sign_extend 32) (currentByte!2202 thiss!1379)) ((_ sign_extend 32) (currentBit!2197 thiss!1379))))))

(declare-fun lt!28988 () (_ BitVec 64))

(declare-fun lt!28992 () (_ BitVec 64))

(assert (=> d!6618 (= lt!28990 (bvmul lt!28988 lt!28992))))

(assert (=> d!6618 (or (= lt!28988 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!28992 (bvsdiv (bvmul lt!28988 lt!28992) lt!28988)))))

(assert (=> d!6618 (= lt!28992 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6618 (= lt!28988 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))))))

(assert (=> d!6618 (= lt!28989 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2202 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2197 thiss!1379))))))

(assert (=> d!6618 (invariant!0 (currentBit!2197 thiss!1379) (currentByte!2202 thiss!1379) (size!610 (buf!916 thiss!1379)))))

(assert (=> d!6618 (= (bitIndex!0 (size!610 (buf!916 thiss!1379)) (currentByte!2202 thiss!1379) (currentBit!2197 thiss!1379)) lt!28989)))

(declare-fun b!20290 () Bool)

(declare-fun res!17630 () Bool)

(assert (=> b!20290 (=> (not res!17630) (not e!13542))))

(assert (=> b!20290 (= res!17630 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!28989))))

(declare-fun b!20291 () Bool)

(declare-fun lt!28991 () (_ BitVec 64))

(assert (=> b!20291 (= e!13542 (bvsle lt!28989 (bvmul lt!28991 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20291 (or (= lt!28991 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!28991 #b0000000000000000000000000000000000000000000000000000000000001000) lt!28991)))))

(assert (=> b!20291 (= lt!28991 ((_ sign_extend 32) (size!610 (buf!916 thiss!1379))))))

(assert (= (and d!6618 res!17629) b!20290))

(assert (= (and b!20290 res!17630) b!20291))

(assert (=> d!6618 m!27429))

(assert (=> d!6618 m!27197))

(assert (=> b!20040 d!6618))

(push 1)

(assert (not b!20275))

(assert (not d!6606))

(assert (not b!20123))

(assert (not b!20183))

(assert (not d!6616))

(assert (not d!6618))

(assert (not d!6564))

(assert (not b!20182))

(assert (not b!20207))

(assert (not b!20179))

(assert (not b!20277))

(assert (not d!6546))

(assert (not d!6568))

(assert (not d!6600))

(assert (not b!20276))

(assert (not b!20180))

(assert (not b!20282))

(assert (not b!20278))

(assert (not b!20122))

(assert (not d!6602))

(assert (not b!20285))

(assert (not b!20201))

(assert (not d!6610))

(assert (not b!20199))

(assert (not d!6566))

(assert (not b!20279))

(assert (not b!20283))

(assert (not b!20280))

(assert (not b!20281))

(assert (not b!20121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

