; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9050 () Bool)

(assert start!9050)

(declare-fun b!44798 () Bool)

(declare-fun e!29827 () Bool)

(declare-fun e!29830 () Bool)

(assert (=> b!44798 (= e!29827 e!29830)))

(declare-fun res!37906 () Bool)

(assert (=> b!44798 (=> res!37906 e!29830)))

(declare-datatypes ((array!2248 0))(
  ( (array!2249 (arr!1526 (Array (_ BitVec 32) (_ BitVec 8))) (size!1012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1768 0))(
  ( (BitStream!1769 (buf!1358 array!2248) (currentByte!2845 (_ BitVec 32)) (currentBit!2840 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3190 0))(
  ( (Unit!3191) )
))
(declare-datatypes ((tuple2!4382 0))(
  ( (tuple2!4383 (_1!2284 Unit!3190) (_2!2284 BitStream!1768)) )
))
(declare-fun lt!68661 () tuple2!4382)

(declare-fun lt!68656 () tuple2!4382)

(declare-fun isPrefixOf!0 (BitStream!1768 BitStream!1768) Bool)

(assert (=> b!44798 (= res!37906 (not (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!68656))))))

(declare-fun thiss!1379 () BitStream!1768)

(assert (=> b!44798 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68656))))

(declare-fun lt!68655 () Unit!3190)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1768 BitStream!1768 BitStream!1768) Unit!3190)

(assert (=> b!44798 (= lt!68655 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2284 lt!68661) (_2!2284 lt!68656)))))

(declare-fun srcBuffer!2 () array!2248)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1768 array!2248 (_ BitVec 64) (_ BitVec 64)) tuple2!4382)

(assert (=> b!44798 (= lt!68656 (appendBitsMSBFirstLoop!0 (_2!2284 lt!68661) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29831 () Bool)

(assert (=> b!44798 e!29831))

(declare-fun res!37910 () Bool)

(assert (=> b!44798 (=> (not res!37910) (not e!29831))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44798 (= res!37910 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68654 () Unit!3190)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1768 array!2248 (_ BitVec 64)) Unit!3190)

(assert (=> b!44798 (= lt!68654 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1358 (_2!2284 lt!68661)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4384 0))(
  ( (tuple2!4385 (_1!2285 BitStream!1768) (_2!2285 BitStream!1768)) )
))
(declare-fun lt!68658 () tuple2!4384)

(declare-fun reader!0 (BitStream!1768 BitStream!1768) tuple2!4384)

(assert (=> b!44798 (= lt!68658 (reader!0 thiss!1379 (_2!2284 lt!68661)))))

(declare-fun b!44799 () Bool)

(declare-fun e!29833 () Bool)

(declare-fun e!29826 () Bool)

(assert (=> b!44799 (= e!29833 e!29826)))

(declare-fun res!37913 () Bool)

(assert (=> b!44799 (=> res!37913 e!29826)))

(assert (=> b!44799 (= res!37913 (not (= (size!1012 (buf!1358 (_2!2284 lt!68661))) (size!1012 (buf!1358 (_2!2284 lt!68656))))))))

(declare-fun e!29828 () Bool)

(assert (=> b!44799 e!29828))

(declare-fun res!37907 () Bool)

(assert (=> b!44799 (=> (not res!37907) (not e!29828))))

(assert (=> b!44799 (= res!37907 (= (size!1012 (buf!1358 (_2!2284 lt!68656))) (size!1012 (buf!1358 thiss!1379))))))

(declare-fun b!44800 () Bool)

(declare-fun e!29829 () Bool)

(assert (=> b!44800 (= e!29829 e!29827)))

(declare-fun res!37908 () Bool)

(assert (=> b!44800 (=> res!37908 e!29827)))

(assert (=> b!44800 (= res!37908 (not (isPrefixOf!0 thiss!1379 (_2!2284 lt!68661))))))

(assert (=> b!44800 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68657 () Unit!3190)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1768 BitStream!1768 (_ BitVec 64) (_ BitVec 64)) Unit!3190)

(assert (=> b!44800 (= lt!68657 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2284 lt!68661) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1768 (_ BitVec 8) (_ BitVec 32)) tuple2!4382)

(assert (=> b!44800 (= lt!68661 (appendBitFromByte!0 thiss!1379 (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44801 () Bool)

(declare-fun res!37909 () Bool)

(assert (=> b!44801 (=> res!37909 e!29833)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44801 (= res!37909 (not (invariant!0 (currentBit!2840 (_2!2284 lt!68656)) (currentByte!2845 (_2!2284 lt!68656)) (size!1012 (buf!1358 (_2!2284 lt!68656))))))))

(declare-fun res!37912 () Bool)

(declare-fun e!29825 () Bool)

(assert (=> start!9050 (=> (not res!37912) (not e!29825))))

(assert (=> start!9050 (= res!37912 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1012 srcBuffer!2))))))))

(assert (=> start!9050 e!29825))

(assert (=> start!9050 true))

(declare-fun array_inv!937 (array!2248) Bool)

(assert (=> start!9050 (array_inv!937 srcBuffer!2)))

(declare-fun e!29832 () Bool)

(declare-fun inv!12 (BitStream!1768) Bool)

(assert (=> start!9050 (and (inv!12 thiss!1379) e!29832)))

(declare-fun b!44802 () Bool)

(declare-fun res!37904 () Bool)

(assert (=> b!44802 (=> res!37904 e!29833)))

(assert (=> b!44802 (= res!37904 (not (= (size!1012 (buf!1358 thiss!1379)) (size!1012 (buf!1358 (_2!2284 lt!68656))))))))

(declare-fun b!44803 () Bool)

(declare-fun res!37905 () Bool)

(assert (=> b!44803 (=> (not res!37905) (not e!29825))))

(assert (=> b!44803 (= res!37905 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44804 () Bool)

(assert (=> b!44804 (= e!29832 (array_inv!937 (buf!1358 thiss!1379)))))

(declare-fun b!44805 () Bool)

(assert (=> b!44805 (= e!29826 (invariant!0 (currentBit!2840 (_2!2284 lt!68661)) (currentByte!2845 (_2!2284 lt!68661)) (size!1012 (buf!1358 (_2!2284 lt!68661)))))))

(declare-fun b!44806 () Bool)

(declare-fun lt!68659 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44806 (= e!29828 (= lt!68659 (bvsub (bvsub (bvadd (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44807 () Bool)

(declare-datatypes ((List!525 0))(
  ( (Nil!522) (Cons!521 (h!640 Bool) (t!1275 List!525)) )
))
(declare-fun head!344 (List!525) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1768 array!2248 (_ BitVec 64) (_ BitVec 64)) List!525)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1768 BitStream!1768 (_ BitVec 64)) List!525)

(assert (=> b!44807 (= e!29831 (= (head!344 (byteArrayBitContentToList!0 (_2!2284 lt!68661) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!344 (bitStreamReadBitsIntoList!0 (_2!2284 lt!68661) (_1!2285 lt!68658) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44808 () Bool)

(assert (=> b!44808 (= e!29830 e!29833)))

(declare-fun res!37914 () Bool)

(assert (=> b!44808 (=> res!37914 e!29833)))

(declare-fun lt!68662 () (_ BitVec 64))

(assert (=> b!44808 (= res!37914 (not (= lt!68659 (bvsub (bvadd lt!68662 to!314) i!635))))))

(assert (=> b!44808 (= lt!68659 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68656))) (currentByte!2845 (_2!2284 lt!68656)) (currentBit!2840 (_2!2284 lt!68656))))))

(declare-fun b!44809 () Bool)

(assert (=> b!44809 (= e!29825 (not e!29829))))

(declare-fun res!37911 () Bool)

(assert (=> b!44809 (=> res!37911 e!29829)))

(assert (=> b!44809 (= res!37911 (bvsge i!635 to!314))))

(assert (=> b!44809 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68660 () Unit!3190)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1768) Unit!3190)

(assert (=> b!44809 (= lt!68660 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!44809 (= lt!68662 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)))))

(assert (= (and start!9050 res!37912) b!44803))

(assert (= (and b!44803 res!37905) b!44809))

(assert (= (and b!44809 (not res!37911)) b!44800))

(assert (= (and b!44800 (not res!37908)) b!44798))

(assert (= (and b!44798 res!37910) b!44807))

(assert (= (and b!44798 (not res!37906)) b!44808))

(assert (= (and b!44808 (not res!37914)) b!44801))

(assert (= (and b!44801 (not res!37909)) b!44802))

(assert (= (and b!44802 (not res!37904)) b!44799))

(assert (= (and b!44799 res!37907) b!44806))

(assert (= (and b!44799 (not res!37913)) b!44805))

(assert (= start!9050 b!44804))

(declare-fun m!68341 () Bool)

(assert (=> b!44801 m!68341))

(declare-fun m!68343 () Bool)

(assert (=> b!44806 m!68343))

(declare-fun m!68345 () Bool)

(assert (=> b!44807 m!68345))

(assert (=> b!44807 m!68345))

(declare-fun m!68347 () Bool)

(assert (=> b!44807 m!68347))

(declare-fun m!68349 () Bool)

(assert (=> b!44807 m!68349))

(assert (=> b!44807 m!68349))

(declare-fun m!68351 () Bool)

(assert (=> b!44807 m!68351))

(declare-fun m!68353 () Bool)

(assert (=> b!44800 m!68353))

(declare-fun m!68355 () Bool)

(assert (=> b!44800 m!68355))

(declare-fun m!68357 () Bool)

(assert (=> b!44800 m!68357))

(assert (=> b!44800 m!68357))

(declare-fun m!68359 () Bool)

(assert (=> b!44800 m!68359))

(declare-fun m!68361 () Bool)

(assert (=> b!44800 m!68361))

(declare-fun m!68363 () Bool)

(assert (=> start!9050 m!68363))

(declare-fun m!68365 () Bool)

(assert (=> start!9050 m!68365))

(declare-fun m!68367 () Bool)

(assert (=> b!44805 m!68367))

(declare-fun m!68369 () Bool)

(assert (=> b!44803 m!68369))

(declare-fun m!68371 () Bool)

(assert (=> b!44809 m!68371))

(declare-fun m!68373 () Bool)

(assert (=> b!44809 m!68373))

(declare-fun m!68375 () Bool)

(assert (=> b!44809 m!68375))

(declare-fun m!68377 () Bool)

(assert (=> b!44808 m!68377))

(declare-fun m!68379 () Bool)

(assert (=> b!44798 m!68379))

(declare-fun m!68381 () Bool)

(assert (=> b!44798 m!68381))

(declare-fun m!68383 () Bool)

(assert (=> b!44798 m!68383))

(declare-fun m!68385 () Bool)

(assert (=> b!44798 m!68385))

(declare-fun m!68387 () Bool)

(assert (=> b!44798 m!68387))

(declare-fun m!68389 () Bool)

(assert (=> b!44798 m!68389))

(declare-fun m!68391 () Bool)

(assert (=> b!44798 m!68391))

(declare-fun m!68393 () Bool)

(assert (=> b!44804 m!68393))

(push 1)

(assert (not b!44805))

(assert (not b!44807))

(assert (not start!9050))

(assert (not b!44809))

(assert (not b!44800))

(assert (not b!44808))

(assert (not b!44801))

(assert (not b!44806))

(assert (not b!44803))

(assert (not b!44798))

(assert (not b!44804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13072 () Bool)

(assert (=> d!13072 (= (invariant!0 (currentBit!2840 (_2!2284 lt!68656)) (currentByte!2845 (_2!2284 lt!68656)) (size!1012 (buf!1358 (_2!2284 lt!68656)))) (and (bvsge (currentBit!2840 (_2!2284 lt!68656)) #b00000000000000000000000000000000) (bvslt (currentBit!2840 (_2!2284 lt!68656)) #b00000000000000000000000000001000) (bvsge (currentByte!2845 (_2!2284 lt!68656)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2845 (_2!2284 lt!68656)) (size!1012 (buf!1358 (_2!2284 lt!68656)))) (and (= (currentBit!2840 (_2!2284 lt!68656)) #b00000000000000000000000000000000) (= (currentByte!2845 (_2!2284 lt!68656)) (size!1012 (buf!1358 (_2!2284 lt!68656))))))))))

(assert (=> b!44801 d!13072))

(declare-fun d!13074 () Bool)

(declare-fun e!29921 () Bool)

(assert (=> d!13074 e!29921))

(declare-fun res!37998 () Bool)

(assert (=> d!13074 (=> (not res!37998) (not e!29921))))

(declare-fun lt!68745 () (_ BitVec 64))

(declare-fun lt!68741 () (_ BitVec 64))

(declare-fun lt!68746 () (_ BitVec 64))

(assert (=> d!13074 (= res!37998 (= lt!68745 (bvsub lt!68746 lt!68741)))))

(assert (=> d!13074 (or (= (bvand lt!68746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68746 lt!68741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13074 (= lt!68741 (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661)))))))

(declare-fun lt!68743 () (_ BitVec 64))

(declare-fun lt!68744 () (_ BitVec 64))

(assert (=> d!13074 (= lt!68746 (bvmul lt!68743 lt!68744))))

(assert (=> d!13074 (or (= lt!68743 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68744 (bvsdiv (bvmul lt!68743 lt!68744) lt!68743)))))

(assert (=> d!13074 (= lt!68744 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13074 (= lt!68743 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))))))

(assert (=> d!13074 (= lt!68745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661)))))))

(assert (=> d!13074 (invariant!0 (currentBit!2840 (_2!2284 lt!68661)) (currentByte!2845 (_2!2284 lt!68661)) (size!1012 (buf!1358 (_2!2284 lt!68661))))))

(assert (=> d!13074 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))) lt!68745)))

(declare-fun b!44916 () Bool)

(declare-fun res!37997 () Bool)

(assert (=> b!44916 (=> (not res!37997) (not e!29921))))

(assert (=> b!44916 (= res!37997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68745))))

(declare-fun b!44917 () Bool)

(declare-fun lt!68742 () (_ BitVec 64))

(assert (=> b!44917 (= e!29921 (bvsle lt!68745 (bvmul lt!68742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44917 (or (= lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68742)))))

(assert (=> b!44917 (= lt!68742 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))))))

(assert (= (and d!13074 res!37998) b!44916))

(assert (= (and b!44916 res!37997) b!44917))

(declare-fun m!68523 () Bool)

(assert (=> d!13074 m!68523))

(assert (=> d!13074 m!68367))

(assert (=> b!44806 d!13074))

(declare-fun d!13076 () Bool)

(declare-fun res!38005 () Bool)

(declare-fun e!29927 () Bool)

(assert (=> d!13076 (=> (not res!38005) (not e!29927))))

(assert (=> d!13076 (= res!38005 (= (size!1012 (buf!1358 thiss!1379)) (size!1012 (buf!1358 (_2!2284 lt!68661)))))))

(assert (=> d!13076 (= (isPrefixOf!0 thiss!1379 (_2!2284 lt!68661)) e!29927)))

(declare-fun b!44924 () Bool)

(declare-fun res!38007 () Bool)

(assert (=> b!44924 (=> (not res!38007) (not e!29927))))

(assert (=> b!44924 (= res!38007 (bvsle (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)) (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661)))))))

(declare-fun b!44925 () Bool)

(declare-fun e!29926 () Bool)

(assert (=> b!44925 (= e!29927 e!29926)))

(declare-fun res!38006 () Bool)

(assert (=> b!44925 (=> res!38006 e!29926)))

(assert (=> b!44925 (= res!38006 (= (size!1012 (buf!1358 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44926 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2248 array!2248 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44926 (= e!29926 (arrayBitRangesEq!0 (buf!1358 thiss!1379) (buf!1358 (_2!2284 lt!68661)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379))))))

(assert (= (and d!13076 res!38005) b!44924))

(assert (= (and b!44924 res!38007) b!44925))

(assert (= (and b!44925 (not res!38006)) b!44926))

(assert (=> b!44924 m!68375))

(assert (=> b!44924 m!68343))

(assert (=> b!44926 m!68375))

(assert (=> b!44926 m!68375))

(declare-fun m!68525 () Bool)

(assert (=> b!44926 m!68525))

(assert (=> b!44800 d!13076))

(declare-fun d!13078 () Bool)

(assert (=> d!13078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3474 () Bool)

(assert (= bs!3474 d!13078))

(assert (=> bs!3474 m!68523))

(assert (=> b!44800 d!13078))

(declare-fun d!13080 () Bool)

(declare-fun e!29930 () Bool)

(assert (=> d!13080 e!29930))

(declare-fun res!38010 () Bool)

(assert (=> d!13080 (=> (not res!38010) (not e!29930))))

(assert (=> d!13080 (= res!38010 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!68749 () Unit!3190)

(declare-fun choose!27 (BitStream!1768 BitStream!1768 (_ BitVec 64) (_ BitVec 64)) Unit!3190)

(assert (=> d!13080 (= lt!68749 (choose!27 thiss!1379 (_2!2284 lt!68661) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13080 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13080 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2284 lt!68661) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68749)))

(declare-fun b!44929 () Bool)

(assert (=> b!44929 (= e!29930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13080 res!38010) b!44929))

(declare-fun m!68527 () Bool)

(assert (=> d!13080 m!68527))

(assert (=> b!44929 m!68361))

(assert (=> b!44800 d!13080))

(declare-fun b!44985 () Bool)

(declare-fun res!38066 () Bool)

(declare-fun e!29960 () Bool)

(assert (=> b!44985 (=> (not res!38066) (not e!29960))))

(declare-fun lt!68853 () (_ BitVec 64))

(declare-fun lt!68851 () tuple2!4382)

(declare-fun lt!68856 () (_ BitVec 64))

(assert (=> b!44985 (= res!38066 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68851))) (currentByte!2845 (_2!2284 lt!68851)) (currentBit!2840 (_2!2284 lt!68851))) (bvadd lt!68853 lt!68856)))))

(assert (=> b!44985 (or (not (= (bvand lt!68853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68856 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68853 lt!68856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44985 (= lt!68856 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44985 (= lt!68853 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)))))

(declare-fun b!44986 () Bool)

(declare-fun e!29959 () Bool)

(declare-datatypes ((tuple2!4402 0))(
  ( (tuple2!4403 (_1!2294 BitStream!1768) (_2!2294 Bool)) )
))
(declare-fun lt!68860 () tuple2!4402)

(assert (=> b!44986 (= e!29959 (= (bitIndex!0 (size!1012 (buf!1358 (_1!2294 lt!68860))) (currentByte!2845 (_1!2294 lt!68860)) (currentBit!2840 (_1!2294 lt!68860))) (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68851))) (currentByte!2845 (_2!2284 lt!68851)) (currentBit!2840 (_2!2284 lt!68851)))))))

(declare-fun d!13082 () Bool)

(assert (=> d!13082 e!29960))

(declare-fun res!38064 () Bool)

(assert (=> d!13082 (=> (not res!38064) (not e!29960))))

(assert (=> d!13082 (= res!38064 (= (size!1012 (buf!1358 (_2!2284 lt!68851))) (size!1012 (buf!1358 thiss!1379))))))

(declare-fun lt!68859 () (_ BitVec 8))

(declare-fun lt!68854 () array!2248)

(assert (=> d!13082 (= lt!68859 (select (arr!1526 lt!68854) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13082 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1012 lt!68854)))))

(assert (=> d!13082 (= lt!68854 (array!2249 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!68855 () tuple2!4382)

(assert (=> d!13082 (= lt!68851 (tuple2!4383 (_1!2284 lt!68855) (_2!2284 lt!68855)))))

(declare-fun lt!68849 () tuple2!4382)

(assert (=> d!13082 (= lt!68855 lt!68849)))

(declare-fun e!29958 () Bool)

(assert (=> d!13082 e!29958))

(declare-fun res!38069 () Bool)

(assert (=> d!13082 (=> (not res!38069) (not e!29958))))

(assert (=> d!13082 (= res!38069 (= (size!1012 (buf!1358 thiss!1379)) (size!1012 (buf!1358 (_2!2284 lt!68849)))))))

(declare-fun lt!68858 () Bool)

(declare-fun appendBit!0 (BitStream!1768 Bool) tuple2!4382)

(assert (=> d!13082 (= lt!68849 (appendBit!0 thiss!1379 lt!68858))))

(assert (=> d!13082 (= lt!68858 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13082 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13082 (= (appendBitFromByte!0 thiss!1379 (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!68851)))

(declare-fun b!44987 () Bool)

(declare-fun res!38071 () Bool)

(assert (=> b!44987 (=> (not res!38071) (not e!29960))))

(assert (=> b!44987 (= res!38071 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68851)))))

(declare-fun b!44988 () Bool)

(declare-fun e!29961 () Bool)

(declare-fun lt!68850 () tuple2!4402)

(assert (=> b!44988 (= e!29961 (= (bitIndex!0 (size!1012 (buf!1358 (_1!2294 lt!68850))) (currentByte!2845 (_1!2294 lt!68850)) (currentBit!2840 (_1!2294 lt!68850))) (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68849))) (currentByte!2845 (_2!2284 lt!68849)) (currentBit!2840 (_2!2284 lt!68849)))))))

(declare-fun b!44989 () Bool)

(assert (=> b!44989 (= e!29958 e!29961)))

(declare-fun res!38067 () Bool)

(assert (=> b!44989 (=> (not res!38067) (not e!29961))))

(assert (=> b!44989 (= res!38067 (and (= (_2!2294 lt!68850) lt!68858) (= (_1!2294 lt!68850) (_2!2284 lt!68849))))))

(declare-fun readBitPure!0 (BitStream!1768) tuple2!4402)

(declare-fun readerFrom!0 (BitStream!1768 (_ BitVec 32) (_ BitVec 32)) BitStream!1768)

(assert (=> b!44989 (= lt!68850 (readBitPure!0 (readerFrom!0 (_2!2284 lt!68849) (currentBit!2840 thiss!1379) (currentByte!2845 thiss!1379))))))

(declare-fun b!44990 () Bool)

(declare-fun res!38070 () Bool)

(assert (=> b!44990 (=> (not res!38070) (not e!29958))))

(assert (=> b!44990 (= res!38070 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68849)))))

(declare-fun b!44991 () Bool)

(assert (=> b!44991 (= e!29960 e!29959)))

(declare-fun res!38068 () Bool)

(assert (=> b!44991 (=> (not res!38068) (not e!29959))))

(assert (=> b!44991 (= res!38068 (and (= (_2!2294 lt!68860) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!68859)) #b00000000000000000000000000000000))) (= (_1!2294 lt!68860) (_2!2284 lt!68851))))))

(declare-datatypes ((tuple2!4404 0))(
  ( (tuple2!4405 (_1!2295 array!2248) (_2!2295 BitStream!1768)) )
))
(declare-fun lt!68852 () tuple2!4404)

(declare-fun lt!68857 () BitStream!1768)

(declare-fun readBits!0 (BitStream!1768 (_ BitVec 64)) tuple2!4404)

(assert (=> b!44991 (= lt!68852 (readBits!0 lt!68857 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!44991 (= lt!68860 (readBitPure!0 lt!68857))))

(assert (=> b!44991 (= lt!68857 (readerFrom!0 (_2!2284 lt!68851) (currentBit!2840 thiss!1379) (currentByte!2845 thiss!1379)))))

(declare-fun b!44992 () Bool)

(declare-fun res!38065 () Bool)

(assert (=> b!44992 (=> (not res!38065) (not e!29958))))

(assert (=> b!44992 (= res!38065 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68849))) (currentByte!2845 (_2!2284 lt!68849)) (currentBit!2840 (_2!2284 lt!68849))) (bvadd (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13082 res!38069) b!44992))

(assert (= (and b!44992 res!38065) b!44990))

(assert (= (and b!44990 res!38070) b!44989))

(assert (= (and b!44989 res!38067) b!44988))

(assert (= (and d!13082 res!38064) b!44985))

(assert (= (and b!44985 res!38066) b!44987))

(assert (= (and b!44987 res!38071) b!44991))

(assert (= (and b!44991 res!38068) b!44986))

(declare-fun m!68567 () Bool)

(assert (=> b!44991 m!68567))

(declare-fun m!68569 () Bool)

(assert (=> b!44991 m!68569))

(declare-fun m!68571 () Bool)

(assert (=> b!44991 m!68571))

(declare-fun m!68573 () Bool)

(assert (=> b!44988 m!68573))

(declare-fun m!68575 () Bool)

(assert (=> b!44988 m!68575))

(declare-fun m!68577 () Bool)

(assert (=> b!44985 m!68577))

(assert (=> b!44985 m!68375))

(assert (=> b!44992 m!68575))

(assert (=> b!44992 m!68375))

(declare-fun m!68579 () Bool)

(assert (=> b!44987 m!68579))

(declare-fun m!68581 () Bool)

(assert (=> b!44989 m!68581))

(assert (=> b!44989 m!68581))

(declare-fun m!68583 () Bool)

(assert (=> b!44989 m!68583))

(declare-fun m!68585 () Bool)

(assert (=> b!44990 m!68585))

(declare-fun m!68587 () Bool)

(assert (=> b!44986 m!68587))

(assert (=> b!44986 m!68577))

(declare-fun m!68589 () Bool)

(assert (=> d!13082 m!68589))

(declare-fun m!68591 () Bool)

(assert (=> d!13082 m!68591))

(declare-fun m!68593 () Bool)

(assert (=> d!13082 m!68593))

(assert (=> b!44800 d!13082))

(declare-fun d!13104 () Bool)

(assert (=> d!13104 (= (head!344 (byteArrayBitContentToList!0 (_2!2284 lt!68661) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!640 (byteArrayBitContentToList!0 (_2!2284 lt!68661) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44807 d!13104))

(declare-fun d!13106 () Bool)

(declare-fun c!3015 () Bool)

(assert (=> d!13106 (= c!3015 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29964 () List!525)

(assert (=> d!13106 (= (byteArrayBitContentToList!0 (_2!2284 lt!68661) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29964)))

(declare-fun b!44997 () Bool)

(assert (=> b!44997 (= e!29964 Nil!522)))

(declare-fun b!44998 () Bool)

(assert (=> b!44998 (= e!29964 (Cons!521 (not (= (bvand ((_ sign_extend 24) (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2284 lt!68661) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13106 c!3015) b!44997))

(assert (= (and d!13106 (not c!3015)) b!44998))

(assert (=> b!44998 m!68357))

(assert (=> b!44998 m!68593))

(declare-fun m!68595 () Bool)

(assert (=> b!44998 m!68595))

(assert (=> b!44807 d!13106))

(declare-fun d!13108 () Bool)

(assert (=> d!13108 (= (head!344 (bitStreamReadBitsIntoList!0 (_2!2284 lt!68661) (_1!2285 lt!68658) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!640 (bitStreamReadBitsIntoList!0 (_2!2284 lt!68661) (_1!2285 lt!68658) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44807 d!13108))

(declare-fun lt!68867 () (_ BitVec 64))

(declare-datatypes ((tuple2!4406 0))(
  ( (tuple2!4407 (_1!2296 Bool) (_2!2296 BitStream!1768)) )
))
(declare-fun lt!68869 () tuple2!4406)

(declare-datatypes ((tuple2!4408 0))(
  ( (tuple2!4409 (_1!2297 List!525) (_2!2297 BitStream!1768)) )
))
(declare-fun e!29969 () tuple2!4408)

(declare-fun b!45008 () Bool)

(assert (=> b!45008 (= e!29969 (tuple2!4409 (Cons!521 (_1!2296 lt!68869) (bitStreamReadBitsIntoList!0 (_2!2284 lt!68661) (_2!2296 lt!68869) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!68867))) (_2!2296 lt!68869)))))

(declare-fun readBit!0 (BitStream!1768) tuple2!4406)

(assert (=> b!45008 (= lt!68869 (readBit!0 (_1!2285 lt!68658)))))

(assert (=> b!45008 (= lt!68867 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13110 () Bool)

(declare-fun e!29970 () Bool)

(assert (=> d!13110 e!29970))

(declare-fun c!3020 () Bool)

(assert (=> d!13110 (= c!3020 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!68868 () List!525)

(assert (=> d!13110 (= lt!68868 (_1!2297 e!29969))))

(declare-fun c!3021 () Bool)

(assert (=> d!13110 (= c!3021 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13110 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13110 (= (bitStreamReadBitsIntoList!0 (_2!2284 lt!68661) (_1!2285 lt!68658) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68868)))

(declare-fun b!45010 () Bool)

(declare-fun length!227 (List!525) Int)

(assert (=> b!45010 (= e!29970 (> (length!227 lt!68868) 0))))

(declare-fun b!45007 () Bool)

(assert (=> b!45007 (= e!29969 (tuple2!4409 Nil!522 (_1!2285 lt!68658)))))

(declare-fun b!45009 () Bool)

(declare-fun isEmpty!129 (List!525) Bool)

(assert (=> b!45009 (= e!29970 (isEmpty!129 lt!68868))))

(assert (= (and d!13110 c!3021) b!45007))

(assert (= (and d!13110 (not c!3021)) b!45008))

(assert (= (and d!13110 c!3020) b!45009))

(assert (= (and d!13110 (not c!3020)) b!45010))

(declare-fun m!68597 () Bool)

(assert (=> b!45008 m!68597))

(declare-fun m!68599 () Bool)

(assert (=> b!45008 m!68599))

(declare-fun m!68601 () Bool)

(assert (=> b!45010 m!68601))

(declare-fun m!68603 () Bool)

(assert (=> b!45009 m!68603))

(assert (=> b!44807 d!13110))

(declare-fun d!13112 () Bool)

(declare-fun res!38072 () Bool)

(declare-fun e!29972 () Bool)

(assert (=> d!13112 (=> (not res!38072) (not e!29972))))

(assert (=> d!13112 (= res!38072 (= (size!1012 (buf!1358 thiss!1379)) (size!1012 (buf!1358 thiss!1379))))))

(assert (=> d!13112 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29972)))

(declare-fun b!45011 () Bool)

(declare-fun res!38074 () Bool)

(assert (=> b!45011 (=> (not res!38074) (not e!29972))))

(assert (=> b!45011 (= res!38074 (bvsle (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)) (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379))))))

(declare-fun b!45012 () Bool)

(declare-fun e!29971 () Bool)

(assert (=> b!45012 (= e!29972 e!29971)))

(declare-fun res!38073 () Bool)

(assert (=> b!45012 (=> res!38073 e!29971)))

(assert (=> b!45012 (= res!38073 (= (size!1012 (buf!1358 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45013 () Bool)

(assert (=> b!45013 (= e!29971 (arrayBitRangesEq!0 (buf!1358 thiss!1379) (buf!1358 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379))))))

(assert (= (and d!13112 res!38072) b!45011))

(assert (= (and b!45011 res!38074) b!45012))

(assert (= (and b!45012 (not res!38073)) b!45013))

(assert (=> b!45011 m!68375))

(assert (=> b!45011 m!68375))

(assert (=> b!45013 m!68375))

(assert (=> b!45013 m!68375))

(declare-fun m!68605 () Bool)

(assert (=> b!45013 m!68605))

(assert (=> b!44809 d!13112))

(declare-fun d!13114 () Bool)

(assert (=> d!13114 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68872 () Unit!3190)

(declare-fun choose!11 (BitStream!1768) Unit!3190)

(assert (=> d!13114 (= lt!68872 (choose!11 thiss!1379))))

(assert (=> d!13114 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!68872)))

(declare-fun bs!3481 () Bool)

(assert (= bs!3481 d!13114))

(assert (=> bs!3481 m!68371))

(declare-fun m!68607 () Bool)

(assert (=> bs!3481 m!68607))

(assert (=> b!44809 d!13114))

(declare-fun d!13116 () Bool)

(declare-fun e!29973 () Bool)

(assert (=> d!13116 e!29973))

(declare-fun res!38076 () Bool)

(assert (=> d!13116 (=> (not res!38076) (not e!29973))))

(declare-fun lt!68873 () (_ BitVec 64))

(declare-fun lt!68878 () (_ BitVec 64))

(declare-fun lt!68877 () (_ BitVec 64))

(assert (=> d!13116 (= res!38076 (= lt!68877 (bvsub lt!68878 lt!68873)))))

(assert (=> d!13116 (or (= (bvand lt!68878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68878 lt!68873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13116 (= lt!68873 (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379))))))

(declare-fun lt!68875 () (_ BitVec 64))

(declare-fun lt!68876 () (_ BitVec 64))

(assert (=> d!13116 (= lt!68878 (bvmul lt!68875 lt!68876))))

(assert (=> d!13116 (or (= lt!68875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68876 (bvsdiv (bvmul lt!68875 lt!68876) lt!68875)))))

(assert (=> d!13116 (= lt!68876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13116 (= lt!68875 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))))))

(assert (=> d!13116 (= lt!68877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2845 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2840 thiss!1379))))))

(assert (=> d!13116 (invariant!0 (currentBit!2840 thiss!1379) (currentByte!2845 thiss!1379) (size!1012 (buf!1358 thiss!1379)))))

(assert (=> d!13116 (= (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)) lt!68877)))

(declare-fun b!45014 () Bool)

(declare-fun res!38075 () Bool)

(assert (=> b!45014 (=> (not res!38075) (not e!29973))))

(assert (=> b!45014 (= res!38075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68877))))

(declare-fun b!45015 () Bool)

(declare-fun lt!68874 () (_ BitVec 64))

(assert (=> b!45015 (= e!29973 (bvsle lt!68877 (bvmul lt!68874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45015 (or (= lt!68874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68874)))))

(assert (=> b!45015 (= lt!68874 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))))))

(assert (= (and d!13116 res!38076) b!45014))

(assert (= (and b!45014 res!38075) b!45015))

(declare-fun m!68609 () Bool)

(assert (=> d!13116 m!68609))

(declare-fun m!68611 () Bool)

(assert (=> d!13116 m!68611))

(assert (=> b!44809 d!13116))

(declare-fun d!13118 () Bool)

(assert (=> d!13118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3482 () Bool)

(assert (= bs!3482 d!13118))

(declare-fun m!68613 () Bool)

(assert (=> bs!3482 m!68613))

(assert (=> b!44798 d!13118))

(declare-fun d!13120 () Bool)

(assert (=> d!13120 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68656))))

(declare-fun lt!68881 () Unit!3190)

(declare-fun choose!30 (BitStream!1768 BitStream!1768 BitStream!1768) Unit!3190)

(assert (=> d!13120 (= lt!68881 (choose!30 thiss!1379 (_2!2284 lt!68661) (_2!2284 lt!68656)))))

(assert (=> d!13120 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68661))))

(assert (=> d!13120 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2284 lt!68661) (_2!2284 lt!68656)) lt!68881)))

(declare-fun bs!3483 () Bool)

(assert (= bs!3483 d!13120))

(assert (=> bs!3483 m!68387))

(declare-fun m!68615 () Bool)

(assert (=> bs!3483 m!68615))

(assert (=> bs!3483 m!68353))

(assert (=> b!44798 d!13120))

(declare-fun d!13122 () Bool)

(declare-fun e!30037 () Bool)

(assert (=> d!13122 e!30037))

(declare-fun res!38167 () Bool)

(assert (=> d!13122 (=> (not res!38167) (not e!30037))))

(declare-fun lt!69411 () (_ BitVec 64))

(declare-fun lt!69401 () tuple2!4382)

(assert (=> d!13122 (= res!38167 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!69401))) (currentByte!2845 (_2!2284 lt!69401)) (currentBit!2840 (_2!2284 lt!69401))) (bvsub lt!69411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13122 (or (= (bvand lt!69411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69402 () (_ BitVec 64))

(assert (=> d!13122 (= lt!69411 (bvadd lt!69402 to!314))))

(assert (=> d!13122 (or (not (= (bvand lt!69402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!69402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!69402 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13122 (= lt!69402 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))))))

(declare-fun e!30036 () tuple2!4382)

(assert (=> d!13122 (= lt!69401 e!30036)))

(declare-fun c!3045 () Bool)

(assert (=> d!13122 (= c!3045 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!69384 () Unit!3190)

(declare-fun lt!69398 () Unit!3190)

(assert (=> d!13122 (= lt!69384 lt!69398)))

(assert (=> d!13122 (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!68661))))

(assert (=> d!13122 (= lt!69398 (lemmaIsPrefixRefl!0 (_2!2284 lt!68661)))))

(declare-fun lt!69393 () (_ BitVec 64))

(assert (=> d!13122 (= lt!69393 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))))))

(assert (=> d!13122 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13122 (= (appendBitsMSBFirstLoop!0 (_2!2284 lt!68661) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!69401)))

(declare-fun b!45152 () Bool)

(declare-fun Unit!3204 () Unit!3190)

(assert (=> b!45152 (= e!30036 (tuple2!4383 Unit!3204 (_2!2284 lt!68661)))))

(assert (=> b!45152 (= (size!1012 (buf!1358 (_2!2284 lt!68661))) (size!1012 (buf!1358 (_2!2284 lt!68661))))))

(declare-fun lt!69403 () Unit!3190)

(declare-fun Unit!3205 () Unit!3190)

(assert (=> b!45152 (= lt!69403 Unit!3205)))

(declare-fun call!544 () tuple2!4384)

(declare-fun checkByteArrayBitContent!0 (BitStream!1768 array!2248 array!2248 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45152 (checkByteArrayBitContent!0 (_2!2284 lt!68661) srcBuffer!2 (_1!2295 (readBits!0 (_1!2285 call!544) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!45153 () Bool)

(declare-fun e!30038 () Bool)

(declare-fun lt!69373 () (_ BitVec 64))

(assert (=> b!45153 (= e!30038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) lt!69373))))

(declare-fun b!45154 () Bool)

(declare-fun lt!69387 () tuple2!4382)

(declare-fun Unit!3206 () Unit!3190)

(assert (=> b!45154 (= e!30036 (tuple2!4383 Unit!3206 (_2!2284 lt!69387)))))

(declare-fun lt!69380 () tuple2!4382)

(assert (=> b!45154 (= lt!69380 (appendBitFromByte!0 (_2!2284 lt!68661) (select (arr!1526 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!69407 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69407 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69386 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69386 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69395 () Unit!3190)

(assert (=> b!45154 (= lt!69395 (validateOffsetBitsIneqLemma!0 (_2!2284 lt!68661) (_2!2284 lt!69380) lt!69407 lt!69386))))

(assert (=> b!45154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!69380)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!69380))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!69380))) (bvsub lt!69407 lt!69386))))

(declare-fun lt!69413 () Unit!3190)

(assert (=> b!45154 (= lt!69413 lt!69395)))

(declare-fun lt!69378 () tuple2!4384)

(assert (=> b!45154 (= lt!69378 call!544)))

(declare-fun lt!69415 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69415 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69397 () Unit!3190)

(assert (=> b!45154 (= lt!69397 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2284 lt!68661) (buf!1358 (_2!2284 lt!69380)) lt!69415))))

(assert (=> b!45154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!69380)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) lt!69415)))

(declare-fun lt!69405 () Unit!3190)

(assert (=> b!45154 (= lt!69405 lt!69397)))

(assert (=> b!45154 (= (head!344 (byteArrayBitContentToList!0 (_2!2284 lt!69380) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!344 (bitStreamReadBitsIntoList!0 (_2!2284 lt!69380) (_1!2285 lt!69378) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69409 () Unit!3190)

(declare-fun Unit!3207 () Unit!3190)

(assert (=> b!45154 (= lt!69409 Unit!3207)))

(assert (=> b!45154 (= lt!69387 (appendBitsMSBFirstLoop!0 (_2!2284 lt!69380) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!69377 () Unit!3190)

(assert (=> b!45154 (= lt!69377 (lemmaIsPrefixTransitive!0 (_2!2284 lt!68661) (_2!2284 lt!69380) (_2!2284 lt!69387)))))

(assert (=> b!45154 (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!69387))))

(declare-fun lt!69390 () Unit!3190)

(assert (=> b!45154 (= lt!69390 lt!69377)))

(assert (=> b!45154 (= (size!1012 (buf!1358 (_2!2284 lt!69387))) (size!1012 (buf!1358 (_2!2284 lt!68661))))))

(declare-fun lt!69376 () Unit!3190)

(declare-fun Unit!3208 () Unit!3190)

(assert (=> b!45154 (= lt!69376 Unit!3208)))

(assert (=> b!45154 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!69387))) (currentByte!2845 (_2!2284 lt!69387)) (currentBit!2840 (_2!2284 lt!69387))) (bvsub (bvadd (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69394 () Unit!3190)

(declare-fun Unit!3209 () Unit!3190)

(assert (=> b!45154 (= lt!69394 Unit!3209)))

(assert (=> b!45154 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!69387))) (currentByte!2845 (_2!2284 lt!69387)) (currentBit!2840 (_2!2284 lt!69387))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!69380))) (currentByte!2845 (_2!2284 lt!69380)) (currentBit!2840 (_2!2284 lt!69380))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69382 () Unit!3190)

(declare-fun Unit!3210 () Unit!3190)

(assert (=> b!45154 (= lt!69382 Unit!3210)))

(declare-fun lt!69400 () tuple2!4384)

(assert (=> b!45154 (= lt!69400 (reader!0 (_2!2284 lt!68661) (_2!2284 lt!69387)))))

(declare-fun lt!69374 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69374 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69379 () Unit!3190)

(assert (=> b!45154 (= lt!69379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2284 lt!68661) (buf!1358 (_2!2284 lt!69387)) lt!69374))))

(assert (=> b!45154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!69387)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) lt!69374)))

(declare-fun lt!69381 () Unit!3190)

(assert (=> b!45154 (= lt!69381 lt!69379)))

(declare-fun lt!69375 () tuple2!4384)

(assert (=> b!45154 (= lt!69375 (reader!0 (_2!2284 lt!69380) (_2!2284 lt!69387)))))

(declare-fun lt!69399 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69399 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69388 () Unit!3190)

(assert (=> b!45154 (= lt!69388 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2284 lt!69380) (buf!1358 (_2!2284 lt!69387)) lt!69399))))

(assert (=> b!45154 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!69387)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!69380))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!69380))) lt!69399)))

(declare-fun lt!69414 () Unit!3190)

(assert (=> b!45154 (= lt!69414 lt!69388)))

(declare-fun lt!69389 () List!525)

(assert (=> b!45154 (= lt!69389 (byteArrayBitContentToList!0 (_2!2284 lt!69387) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69406 () List!525)

(assert (=> b!45154 (= lt!69406 (byteArrayBitContentToList!0 (_2!2284 lt!69387) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69385 () List!525)

(assert (=> b!45154 (= lt!69385 (bitStreamReadBitsIntoList!0 (_2!2284 lt!69387) (_1!2285 lt!69400) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69396 () List!525)

(assert (=> b!45154 (= lt!69396 (bitStreamReadBitsIntoList!0 (_2!2284 lt!69387) (_1!2285 lt!69375) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69391 () (_ BitVec 64))

(assert (=> b!45154 (= lt!69391 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69410 () Unit!3190)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1768 BitStream!1768 BitStream!1768 BitStream!1768 (_ BitVec 64) List!525) Unit!3190)

(assert (=> b!45154 (= lt!69410 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2284 lt!69387) (_2!2284 lt!69387) (_1!2285 lt!69400) (_1!2285 lt!69375) lt!69391 lt!69385))))

(declare-fun tail!218 (List!525) List!525)

(assert (=> b!45154 (= (bitStreamReadBitsIntoList!0 (_2!2284 lt!69387) (_1!2285 lt!69375) (bvsub lt!69391 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!218 lt!69385))))

(declare-fun lt!69404 () Unit!3190)

(assert (=> b!45154 (= lt!69404 lt!69410)))

(declare-fun lt!69392 () Unit!3190)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2248 array!2248 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3190)

(assert (=> b!45154 (= lt!69392 (arrayBitRangesEqImpliesEq!0 (buf!1358 (_2!2284 lt!69380)) (buf!1358 (_2!2284 lt!69387)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!69393 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!69380))) (currentByte!2845 (_2!2284 lt!69380)) (currentBit!2840 (_2!2284 lt!69380)))))))

(declare-fun bitAt!0 (array!2248 (_ BitVec 64)) Bool)

(assert (=> b!45154 (= (bitAt!0 (buf!1358 (_2!2284 lt!69380)) lt!69393) (bitAt!0 (buf!1358 (_2!2284 lt!69387)) lt!69393))))

(declare-fun lt!69408 () Unit!3190)

(assert (=> b!45154 (= lt!69408 lt!69392)))

(declare-fun b!45155 () Bool)

(declare-fun res!38168 () Bool)

(assert (=> b!45155 (=> (not res!38168) (not e!30037))))

(assert (=> b!45155 (= res!38168 (= (size!1012 (buf!1358 (_2!2284 lt!69401))) (size!1012 (buf!1358 (_2!2284 lt!68661)))))))

(declare-fun b!45156 () Bool)

(declare-fun res!38169 () Bool)

(assert (=> b!45156 (=> (not res!38169) (not e!30037))))

(assert (=> b!45156 (= res!38169 (invariant!0 (currentBit!2840 (_2!2284 lt!69401)) (currentByte!2845 (_2!2284 lt!69401)) (size!1012 (buf!1358 (_2!2284 lt!69401)))))))

(declare-fun b!45157 () Bool)

(declare-fun lt!69412 () tuple2!4384)

(assert (=> b!45157 (= e!30037 (= (bitStreamReadBitsIntoList!0 (_2!2284 lt!69401) (_1!2285 lt!69412) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2284 lt!69401) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45157 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45157 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69383 () Unit!3190)

(declare-fun lt!69372 () Unit!3190)

(assert (=> b!45157 (= lt!69383 lt!69372)))

(assert (=> b!45157 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!69401)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68661))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68661))) lt!69373)))

(assert (=> b!45157 (= lt!69372 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2284 lt!68661) (buf!1358 (_2!2284 lt!69401)) lt!69373))))

(assert (=> b!45157 e!30038))

(declare-fun res!38171 () Bool)

(assert (=> b!45157 (=> (not res!38171) (not e!30038))))

(assert (=> b!45157 (= res!38171 (and (= (size!1012 (buf!1358 (_2!2284 lt!68661))) (size!1012 (buf!1358 (_2!2284 lt!69401)))) (bvsge lt!69373 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45157 (= lt!69373 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45157 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45157 (= lt!69412 (reader!0 (_2!2284 lt!68661) (_2!2284 lt!69401)))))

(declare-fun b!45158 () Bool)

(declare-fun res!38172 () Bool)

(assert (=> b!45158 (=> (not res!38172) (not e!30037))))

(assert (=> b!45158 (= res!38172 (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!69401)))))

(declare-fun b!45159 () Bool)

(declare-fun res!38170 () Bool)

(assert (=> b!45159 (=> (not res!38170) (not e!30037))))

(assert (=> b!45159 (= res!38170 (= (size!1012 (buf!1358 (_2!2284 lt!68661))) (size!1012 (buf!1358 (_2!2284 lt!69401)))))))

(declare-fun bm!541 () Bool)

(assert (=> bm!541 (= call!544 (reader!0 (_2!2284 lt!68661) (ite c!3045 (_2!2284 lt!69380) (_2!2284 lt!68661))))))

(assert (= (and d!13122 c!3045) b!45154))

(assert (= (and d!13122 (not c!3045)) b!45152))

(assert (= (or b!45154 b!45152) bm!541))

(assert (= (and d!13122 res!38167) b!45156))

(assert (= (and b!45156 res!38169) b!45159))

(assert (= (and b!45159 res!38170) b!45158))

(assert (= (and b!45158 res!38172) b!45155))

(assert (= (and b!45155 res!38168) b!45157))

(assert (= (and b!45157 res!38171) b!45153))

(declare-fun m!68875 () Bool)

(assert (=> bm!541 m!68875))

(declare-fun m!68877 () Bool)

(assert (=> b!45153 m!68877))

(declare-fun m!68879 () Bool)

(assert (=> b!45158 m!68879))

(declare-fun m!68881 () Bool)

(assert (=> b!45156 m!68881))

(declare-fun m!68883 () Bool)

(assert (=> b!45152 m!68883))

(declare-fun m!68885 () Bool)

(assert (=> b!45152 m!68885))

(declare-fun m!68887 () Bool)

(assert (=> b!45157 m!68887))

(declare-fun m!68889 () Bool)

(assert (=> b!45157 m!68889))

(declare-fun m!68891 () Bool)

(assert (=> b!45157 m!68891))

(declare-fun m!68893 () Bool)

(assert (=> b!45157 m!68893))

(declare-fun m!68895 () Bool)

(assert (=> b!45157 m!68895))

(declare-fun m!68897 () Bool)

(assert (=> b!45154 m!68897))

(declare-fun m!68899 () Bool)

(assert (=> b!45154 m!68899))

(declare-fun m!68901 () Bool)

(assert (=> b!45154 m!68901))

(declare-fun m!68903 () Bool)

(assert (=> b!45154 m!68903))

(declare-fun m!68905 () Bool)

(assert (=> b!45154 m!68905))

(declare-fun m!68907 () Bool)

(assert (=> b!45154 m!68907))

(assert (=> b!45154 m!68343))

(declare-fun m!68909 () Bool)

(assert (=> b!45154 m!68909))

(declare-fun m!68911 () Bool)

(assert (=> b!45154 m!68911))

(declare-fun m!68913 () Bool)

(assert (=> b!45154 m!68913))

(declare-fun m!68915 () Bool)

(assert (=> b!45154 m!68915))

(assert (=> b!45154 m!68911))

(declare-fun m!68917 () Bool)

(assert (=> b!45154 m!68917))

(declare-fun m!68919 () Bool)

(assert (=> b!45154 m!68919))

(declare-fun m!68921 () Bool)

(assert (=> b!45154 m!68921))

(declare-fun m!68923 () Bool)

(assert (=> b!45154 m!68923))

(declare-fun m!68925 () Bool)

(assert (=> b!45154 m!68925))

(declare-fun m!68927 () Bool)

(assert (=> b!45154 m!68927))

(declare-fun m!68929 () Bool)

(assert (=> b!45154 m!68929))

(declare-fun m!68931 () Bool)

(assert (=> b!45154 m!68931))

(declare-fun m!68933 () Bool)

(assert (=> b!45154 m!68933))

(declare-fun m!68935 () Bool)

(assert (=> b!45154 m!68935))

(declare-fun m!68937 () Bool)

(assert (=> b!45154 m!68937))

(declare-fun m!68939 () Bool)

(assert (=> b!45154 m!68939))

(declare-fun m!68941 () Bool)

(assert (=> b!45154 m!68941))

(declare-fun m!68943 () Bool)

(assert (=> b!45154 m!68943))

(assert (=> b!45154 m!68925))

(declare-fun m!68945 () Bool)

(assert (=> b!45154 m!68945))

(declare-fun m!68947 () Bool)

(assert (=> b!45154 m!68947))

(declare-fun m!68949 () Bool)

(assert (=> b!45154 m!68949))

(declare-fun m!68951 () Bool)

(assert (=> b!45154 m!68951))

(assert (=> b!45154 m!68933))

(declare-fun m!68953 () Bool)

(assert (=> b!45154 m!68953))

(declare-fun m!68955 () Bool)

(assert (=> b!45154 m!68955))

(assert (=> b!45154 m!68941))

(declare-fun m!68957 () Bool)

(assert (=> b!45154 m!68957))

(declare-fun m!68959 () Bool)

(assert (=> d!13122 m!68959))

(assert (=> d!13122 m!68343))

(declare-fun m!68961 () Bool)

(assert (=> d!13122 m!68961))

(declare-fun m!68963 () Bool)

(assert (=> d!13122 m!68963))

(assert (=> b!44798 d!13122))

(declare-fun d!13164 () Bool)

(assert (=> d!13164 (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68661)))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69418 () Unit!3190)

(declare-fun choose!9 (BitStream!1768 array!2248 (_ BitVec 64) BitStream!1768) Unit!3190)

(assert (=> d!13164 (= lt!69418 (choose!9 thiss!1379 (buf!1358 (_2!2284 lt!68661)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1769 (buf!1358 (_2!2284 lt!68661)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379))))))

(assert (=> d!13164 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1358 (_2!2284 lt!68661)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!69418)))

(declare-fun bs!3489 () Bool)

(assert (= bs!3489 d!13164))

(assert (=> bs!3489 m!68383))

(declare-fun m!68965 () Bool)

(assert (=> bs!3489 m!68965))

(assert (=> b!44798 d!13164))

(declare-fun b!45170 () Bool)

(declare-fun res!38180 () Bool)

(declare-fun e!30043 () Bool)

(assert (=> b!45170 (=> (not res!38180) (not e!30043))))

(declare-fun lt!69468 () tuple2!4384)

(assert (=> b!45170 (= res!38180 (isPrefixOf!0 (_1!2285 lt!69468) thiss!1379))))

(declare-fun d!13166 () Bool)

(assert (=> d!13166 e!30043))

(declare-fun res!38179 () Bool)

(assert (=> d!13166 (=> (not res!38179) (not e!30043))))

(assert (=> d!13166 (= res!38179 (isPrefixOf!0 (_1!2285 lt!69468) (_2!2285 lt!69468)))))

(declare-fun lt!69461 () BitStream!1768)

(assert (=> d!13166 (= lt!69468 (tuple2!4385 lt!69461 (_2!2284 lt!68661)))))

(declare-fun lt!69462 () Unit!3190)

(declare-fun lt!69465 () Unit!3190)

(assert (=> d!13166 (= lt!69462 lt!69465)))

(assert (=> d!13166 (isPrefixOf!0 lt!69461 (_2!2284 lt!68661))))

(assert (=> d!13166 (= lt!69465 (lemmaIsPrefixTransitive!0 lt!69461 (_2!2284 lt!68661) (_2!2284 lt!68661)))))

(declare-fun lt!69466 () Unit!3190)

(declare-fun lt!69477 () Unit!3190)

(assert (=> d!13166 (= lt!69466 lt!69477)))

(assert (=> d!13166 (isPrefixOf!0 lt!69461 (_2!2284 lt!68661))))

(assert (=> d!13166 (= lt!69477 (lemmaIsPrefixTransitive!0 lt!69461 thiss!1379 (_2!2284 lt!68661)))))

(declare-fun lt!69463 () Unit!3190)

(declare-fun e!30044 () Unit!3190)

(assert (=> d!13166 (= lt!69463 e!30044)))

(declare-fun c!3048 () Bool)

(assert (=> d!13166 (= c!3048 (not (= (size!1012 (buf!1358 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!69474 () Unit!3190)

(declare-fun lt!69470 () Unit!3190)

(assert (=> d!13166 (= lt!69474 lt!69470)))

(assert (=> d!13166 (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!68661))))

(assert (=> d!13166 (= lt!69470 (lemmaIsPrefixRefl!0 (_2!2284 lt!68661)))))

(declare-fun lt!69476 () Unit!3190)

(declare-fun lt!69478 () Unit!3190)

(assert (=> d!13166 (= lt!69476 lt!69478)))

(assert (=> d!13166 (= lt!69478 (lemmaIsPrefixRefl!0 (_2!2284 lt!68661)))))

(declare-fun lt!69464 () Unit!3190)

(declare-fun lt!69459 () Unit!3190)

(assert (=> d!13166 (= lt!69464 lt!69459)))

(assert (=> d!13166 (isPrefixOf!0 lt!69461 lt!69461)))

(assert (=> d!13166 (= lt!69459 (lemmaIsPrefixRefl!0 lt!69461))))

(declare-fun lt!69467 () Unit!3190)

(declare-fun lt!69460 () Unit!3190)

(assert (=> d!13166 (= lt!69467 lt!69460)))

(assert (=> d!13166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13166 (= lt!69460 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13166 (= lt!69461 (BitStream!1769 (buf!1358 (_2!2284 lt!68661)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)))))

(assert (=> d!13166 (isPrefixOf!0 thiss!1379 (_2!2284 lt!68661))))

(assert (=> d!13166 (= (reader!0 thiss!1379 (_2!2284 lt!68661)) lt!69468)))

(declare-fun b!45171 () Bool)

(declare-fun lt!69471 () Unit!3190)

(assert (=> b!45171 (= e!30044 lt!69471)))

(declare-fun lt!69469 () (_ BitVec 64))

(assert (=> b!45171 (= lt!69469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69475 () (_ BitVec 64))

(assert (=> b!45171 (= lt!69475 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2248 array!2248 (_ BitVec 64) (_ BitVec 64)) Unit!3190)

(assert (=> b!45171 (= lt!69471 (arrayBitRangesEqSymmetric!0 (buf!1358 thiss!1379) (buf!1358 (_2!2284 lt!68661)) lt!69469 lt!69475))))

(assert (=> b!45171 (arrayBitRangesEq!0 (buf!1358 (_2!2284 lt!68661)) (buf!1358 thiss!1379) lt!69469 lt!69475)))

(declare-fun lt!69472 () (_ BitVec 64))

(declare-fun b!45172 () Bool)

(declare-fun lt!69473 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1768 (_ BitVec 64)) BitStream!1768)

(assert (=> b!45172 (= e!30043 (= (_1!2285 lt!69468) (withMovedBitIndex!0 (_2!2285 lt!69468) (bvsub lt!69473 lt!69472))))))

(assert (=> b!45172 (or (= (bvand lt!69473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69473 lt!69472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45172 (= lt!69472 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))))))

(assert (=> b!45172 (= lt!69473 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)))))

(declare-fun b!45173 () Bool)

(declare-fun Unit!3218 () Unit!3190)

(assert (=> b!45173 (= e!30044 Unit!3218)))

(declare-fun b!45174 () Bool)

(declare-fun res!38181 () Bool)

(assert (=> b!45174 (=> (not res!38181) (not e!30043))))

(assert (=> b!45174 (= res!38181 (isPrefixOf!0 (_2!2285 lt!69468) (_2!2284 lt!68661)))))

(assert (= (and d!13166 c!3048) b!45171))

(assert (= (and d!13166 (not c!3048)) b!45173))

(assert (= (and d!13166 res!38179) b!45170))

(assert (= (and b!45170 res!38180) b!45174))

(assert (= (and b!45174 res!38181) b!45172))

(declare-fun m!68967 () Bool)

(assert (=> d!13166 m!68967))

(declare-fun m!68969 () Bool)

(assert (=> d!13166 m!68969))

(declare-fun m!68971 () Bool)

(assert (=> d!13166 m!68971))

(assert (=> d!13166 m!68961))

(declare-fun m!68973 () Bool)

(assert (=> d!13166 m!68973))

(assert (=> d!13166 m!68353))

(assert (=> d!13166 m!68963))

(assert (=> d!13166 m!68373))

(declare-fun m!68975 () Bool)

(assert (=> d!13166 m!68975))

(declare-fun m!68977 () Bool)

(assert (=> d!13166 m!68977))

(assert (=> d!13166 m!68371))

(declare-fun m!68979 () Bool)

(assert (=> b!45172 m!68979))

(assert (=> b!45172 m!68343))

(assert (=> b!45172 m!68375))

(assert (=> b!45171 m!68375))

(declare-fun m!68981 () Bool)

(assert (=> b!45171 m!68981))

(declare-fun m!68983 () Bool)

(assert (=> b!45171 m!68983))

(declare-fun m!68985 () Bool)

(assert (=> b!45170 m!68985))

(declare-fun m!68987 () Bool)

(assert (=> b!45174 m!68987))

(assert (=> b!44798 d!13166))

(declare-fun d!13168 () Bool)

(declare-fun res!38182 () Bool)

(declare-fun e!30046 () Bool)

(assert (=> d!13168 (=> (not res!38182) (not e!30046))))

(assert (=> d!13168 (= res!38182 (= (size!1012 (buf!1358 thiss!1379)) (size!1012 (buf!1358 (_2!2284 lt!68656)))))))

(assert (=> d!13168 (= (isPrefixOf!0 thiss!1379 (_2!2284 lt!68656)) e!30046)))

(declare-fun b!45175 () Bool)

(declare-fun res!38184 () Bool)

(assert (=> b!45175 (=> (not res!38184) (not e!30046))))

(assert (=> b!45175 (= res!38184 (bvsle (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379)) (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68656))) (currentByte!2845 (_2!2284 lt!68656)) (currentBit!2840 (_2!2284 lt!68656)))))))

(declare-fun b!45176 () Bool)

(declare-fun e!30045 () Bool)

(assert (=> b!45176 (= e!30046 e!30045)))

(declare-fun res!38183 () Bool)

(assert (=> b!45176 (=> res!38183 e!30045)))

(assert (=> b!45176 (= res!38183 (= (size!1012 (buf!1358 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45177 () Bool)

(assert (=> b!45177 (= e!30045 (arrayBitRangesEq!0 (buf!1358 thiss!1379) (buf!1358 (_2!2284 lt!68656)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1012 (buf!1358 thiss!1379)) (currentByte!2845 thiss!1379) (currentBit!2840 thiss!1379))))))

(assert (= (and d!13168 res!38182) b!45175))

(assert (= (and b!45175 res!38184) b!45176))

(assert (= (and b!45176 (not res!38183)) b!45177))

(assert (=> b!45175 m!68375))

(assert (=> b!45175 m!68377))

(assert (=> b!45177 m!68375))

(assert (=> b!45177 m!68375))

(declare-fun m!68989 () Bool)

(assert (=> b!45177 m!68989))

(assert (=> b!44798 d!13168))

(declare-fun d!13170 () Bool)

(declare-fun res!38185 () Bool)

(declare-fun e!30048 () Bool)

(assert (=> d!13170 (=> (not res!38185) (not e!30048))))

(assert (=> d!13170 (= res!38185 (= (size!1012 (buf!1358 (_2!2284 lt!68661))) (size!1012 (buf!1358 (_2!2284 lt!68656)))))))

(assert (=> d!13170 (= (isPrefixOf!0 (_2!2284 lt!68661) (_2!2284 lt!68656)) e!30048)))

(declare-fun b!45178 () Bool)

(declare-fun res!38187 () Bool)

(assert (=> b!45178 (=> (not res!38187) (not e!30048))))

(assert (=> b!45178 (= res!38187 (bvsle (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661))) (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68656))) (currentByte!2845 (_2!2284 lt!68656)) (currentBit!2840 (_2!2284 lt!68656)))))))

(declare-fun b!45179 () Bool)

(declare-fun e!30047 () Bool)

(assert (=> b!45179 (= e!30048 e!30047)))

(declare-fun res!38186 () Bool)

(assert (=> b!45179 (=> res!38186 e!30047)))

(assert (=> b!45179 (= res!38186 (= (size!1012 (buf!1358 (_2!2284 lt!68661))) #b00000000000000000000000000000000))))

(declare-fun b!45180 () Bool)

(assert (=> b!45180 (= e!30047 (arrayBitRangesEq!0 (buf!1358 (_2!2284 lt!68661)) (buf!1358 (_2!2284 lt!68656)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68661))) (currentByte!2845 (_2!2284 lt!68661)) (currentBit!2840 (_2!2284 lt!68661)))))))

(assert (= (and d!13170 res!38185) b!45178))

(assert (= (and b!45178 res!38187) b!45179))

(assert (= (and b!45179 (not res!38186)) b!45180))

(assert (=> b!45178 m!68343))

(assert (=> b!45178 m!68377))

(assert (=> b!45180 m!68343))

(assert (=> b!45180 m!68343))

(declare-fun m!68991 () Bool)

(assert (=> b!45180 m!68991))

(assert (=> b!44798 d!13170))

(declare-fun d!13172 () Bool)

(assert (=> d!13172 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 thiss!1379))) ((_ sign_extend 32) (currentByte!2845 thiss!1379)) ((_ sign_extend 32) (currentBit!2840 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3490 () Bool)

(assert (= bs!3490 d!13172))

(assert (=> bs!3490 m!68609))

(assert (=> b!44803 d!13172))

(declare-fun d!13174 () Bool)

(assert (=> d!13174 (= (array_inv!937 srcBuffer!2) (bvsge (size!1012 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9050 d!13174))

(declare-fun d!13176 () Bool)

(assert (=> d!13176 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2840 thiss!1379) (currentByte!2845 thiss!1379) (size!1012 (buf!1358 thiss!1379))))))

(declare-fun bs!3491 () Bool)

(assert (= bs!3491 d!13176))

(assert (=> bs!3491 m!68611))

(assert (=> start!9050 d!13176))

(declare-fun d!13178 () Bool)

(declare-fun e!30049 () Bool)

(assert (=> d!13178 e!30049))

(declare-fun res!38189 () Bool)

(assert (=> d!13178 (=> (not res!38189) (not e!30049))))

(declare-fun lt!69484 () (_ BitVec 64))

(declare-fun lt!69483 () (_ BitVec 64))

(declare-fun lt!69479 () (_ BitVec 64))

(assert (=> d!13178 (= res!38189 (= lt!69483 (bvsub lt!69484 lt!69479)))))

(assert (=> d!13178 (or (= (bvand lt!69484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69484 lt!69479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13178 (= lt!69479 (remainingBits!0 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68656)))) ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68656))) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68656)))))))

(declare-fun lt!69481 () (_ BitVec 64))

(declare-fun lt!69482 () (_ BitVec 64))

(assert (=> d!13178 (= lt!69484 (bvmul lt!69481 lt!69482))))

(assert (=> d!13178 (or (= lt!69481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!69482 (bvsdiv (bvmul lt!69481 lt!69482) lt!69481)))))

(assert (=> d!13178 (= lt!69482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13178 (= lt!69481 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68656)))))))

(assert (=> d!13178 (= lt!69483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2845 (_2!2284 lt!68656))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2840 (_2!2284 lt!68656)))))))

(assert (=> d!13178 (invariant!0 (currentBit!2840 (_2!2284 lt!68656)) (currentByte!2845 (_2!2284 lt!68656)) (size!1012 (buf!1358 (_2!2284 lt!68656))))))

(assert (=> d!13178 (= (bitIndex!0 (size!1012 (buf!1358 (_2!2284 lt!68656))) (currentByte!2845 (_2!2284 lt!68656)) (currentBit!2840 (_2!2284 lt!68656))) lt!69483)))

(declare-fun b!45181 () Bool)

(declare-fun res!38188 () Bool)

(assert (=> b!45181 (=> (not res!38188) (not e!30049))))

(assert (=> b!45181 (= res!38188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!69483))))

(declare-fun b!45182 () Bool)

(declare-fun lt!69480 () (_ BitVec 64))

(assert (=> b!45182 (= e!30049 (bvsle lt!69483 (bvmul lt!69480 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45182 (or (= lt!69480 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!69480 #b0000000000000000000000000000000000000000000000000000000000001000) lt!69480)))))

(assert (=> b!45182 (= lt!69480 ((_ sign_extend 32) (size!1012 (buf!1358 (_2!2284 lt!68656)))))))

(assert (= (and d!13178 res!38189) b!45181))

(assert (= (and b!45181 res!38188) b!45182))

(declare-fun m!68993 () Bool)

(assert (=> d!13178 m!68993))

(assert (=> d!13178 m!68341))

(assert (=> b!44808 d!13178))

(declare-fun d!13180 () Bool)

(assert (=> d!13180 (= (invariant!0 (currentBit!2840 (_2!2284 lt!68661)) (currentByte!2845 (_2!2284 lt!68661)) (size!1012 (buf!1358 (_2!2284 lt!68661)))) (and (bvsge (currentBit!2840 (_2!2284 lt!68661)) #b00000000000000000000000000000000) (bvslt (currentBit!2840 (_2!2284 lt!68661)) #b00000000000000000000000000001000) (bvsge (currentByte!2845 (_2!2284 lt!68661)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2845 (_2!2284 lt!68661)) (size!1012 (buf!1358 (_2!2284 lt!68661)))) (and (= (currentBit!2840 (_2!2284 lt!68661)) #b00000000000000000000000000000000) (= (currentByte!2845 (_2!2284 lt!68661)) (size!1012 (buf!1358 (_2!2284 lt!68661))))))))))

(assert (=> b!44805 d!13180))

(declare-fun d!13182 () Bool)

(assert (=> d!13182 (= (array_inv!937 (buf!1358 thiss!1379)) (bvsge (size!1012 (buf!1358 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!44804 d!13182))

(push 1)

(assert (not d!13178))

(assert (not b!45175))

(assert (not b!45180))

(assert (not b!44998))

(assert (not d!13118))

(assert (not b!44929))

(assert (not b!45157))

(assert (not d!13078))

(assert (not b!44985))

(assert (not b!44987))

(assert (not b!44992))

(assert (not b!44924))

(assert (not b!45009))

(assert (not d!13166))

(assert (not b!45170))

(assert (not b!45172))

(assert (not bm!541))

(assert (not b!45154))

(assert (not d!13080))

(assert (not b!45156))

(assert (not b!45171))

(assert (not b!45152))

(assert (not d!13114))

(assert (not b!44926))

(assert (not b!44988))

(assert (not d!13082))

(assert (not b!44990))

(assert (not d!13074))

(assert (not d!13120))

(assert (not b!45011))

(assert (not d!13176))

(assert (not b!45174))

(assert (not d!13172))

(assert (not b!44986))

(assert (not b!45158))

(assert (not b!45153))

(assert (not b!45177))

(assert (not b!45178))

(assert (not d!13116))

(assert (not d!13122))

(assert (not b!44991))

(assert (not b!44989))

(assert (not d!13164))

(assert (not b!45008))

(assert (not b!45010))

(assert (not b!45013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

