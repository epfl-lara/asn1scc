; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10684 () Bool)

(assert start!10684)

(declare-fun b!53412 () Bool)

(declare-fun e!35606 () Bool)

(declare-fun e!35604 () Bool)

(assert (=> b!53412 (= e!35606 e!35604)))

(declare-fun res!44628 () Bool)

(assert (=> b!53412 (=> res!44628 e!35604)))

(declare-datatypes ((array!2525 0))(
  ( (array!2526 (arr!1687 (Array (_ BitVec 32) (_ BitVec 8))) (size!1151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1994 0))(
  ( (BitStream!1995 (buf!1501 array!2525) (currentByte!3068 (_ BitVec 32)) (currentBit!3063 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1994)

(declare-datatypes ((Unit!3712 0))(
  ( (Unit!3713) )
))
(declare-datatypes ((tuple2!4874 0))(
  ( (tuple2!4875 (_1!2542 Unit!3712) (_2!2542 BitStream!1994)) )
))
(declare-fun lt!82812 () tuple2!4874)

(declare-fun isPrefixOf!0 (BitStream!1994 BitStream!1994) Bool)

(assert (=> b!53412 (= res!44628 (not (isPrefixOf!0 thiss!1379 (_2!2542 lt!82812))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53412 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82810 () Unit!3712)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1994 BitStream!1994 (_ BitVec 64) (_ BitVec 64)) Unit!3712)

(assert (=> b!53412 (= lt!82810 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2542 lt!82812) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2525)

(declare-fun appendBitFromByte!0 (BitStream!1994 (_ BitVec 8) (_ BitVec 32)) tuple2!4874)

(assert (=> b!53412 (= lt!82812 (appendBitFromByte!0 thiss!1379 (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53413 () Bool)

(declare-fun e!35605 () Bool)

(declare-fun array_inv!1056 (array!2525) Bool)

(assert (=> b!53413 (= e!35605 (array_inv!1056 (buf!1501 thiss!1379)))))

(declare-fun b!53414 () Bool)

(declare-fun e!35608 () Bool)

(assert (=> b!53414 (= e!35608 (not e!35606))))

(declare-fun res!44626 () Bool)

(assert (=> b!53414 (=> res!44626 e!35606)))

(assert (=> b!53414 (= res!44626 (bvsge i!635 to!314))))

(assert (=> b!53414 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82809 () Unit!3712)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1994) Unit!3712)

(assert (=> b!53414 (= lt!82809 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82808 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53414 (= lt!82808 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun b!53415 () Bool)

(declare-fun res!44625 () Bool)

(assert (=> b!53415 (=> (not res!44625) (not e!35608))))

(assert (=> b!53415 (= res!44625 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53416 () Bool)

(declare-datatypes ((tuple2!4876 0))(
  ( (tuple2!4877 (_1!2543 BitStream!1994) (_2!2543 BitStream!1994)) )
))
(declare-fun lt!82811 () tuple2!4876)

(declare-datatypes ((List!572 0))(
  ( (Nil!569) (Cons!568 (h!687 Bool) (t!1322 List!572)) )
))
(declare-fun head!391 (List!572) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1994 array!2525 (_ BitVec 64) (_ BitVec 64)) List!572)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1994 BitStream!1994 (_ BitVec 64)) List!572)

(assert (=> b!53416 (= e!35604 (= (head!391 (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!391 (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_1!2543 lt!82811) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!53416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!82813 () Unit!3712)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1994 array!2525 (_ BitVec 64)) Unit!3712)

(assert (=> b!53416 (= lt!82813 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1994 BitStream!1994) tuple2!4876)

(assert (=> b!53416 (= lt!82811 (reader!0 thiss!1379 (_2!2542 lt!82812)))))

(declare-fun res!44627 () Bool)

(assert (=> start!10684 (=> (not res!44627) (not e!35608))))

(assert (=> start!10684 (= res!44627 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1151 srcBuffer!2))))))))

(assert (=> start!10684 e!35608))

(assert (=> start!10684 true))

(assert (=> start!10684 (array_inv!1056 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1994) Bool)

(assert (=> start!10684 (and (inv!12 thiss!1379) e!35605)))

(assert (= (and start!10684 res!44627) b!53415))

(assert (= (and b!53415 res!44625) b!53414))

(assert (= (and b!53414 (not res!44626)) b!53412))

(assert (= (and b!53412 (not res!44628)) b!53416))

(assert (= start!10684 b!53413))

(declare-fun m!84017 () Bool)

(assert (=> start!10684 m!84017))

(declare-fun m!84019 () Bool)

(assert (=> start!10684 m!84019))

(declare-fun m!84021 () Bool)

(assert (=> b!53415 m!84021))

(declare-fun m!84023 () Bool)

(assert (=> b!53414 m!84023))

(declare-fun m!84025 () Bool)

(assert (=> b!53414 m!84025))

(declare-fun m!84027 () Bool)

(assert (=> b!53414 m!84027))

(declare-fun m!84029 () Bool)

(assert (=> b!53416 m!84029))

(declare-fun m!84031 () Bool)

(assert (=> b!53416 m!84031))

(assert (=> b!53416 m!84031))

(declare-fun m!84033 () Bool)

(assert (=> b!53416 m!84033))

(declare-fun m!84035 () Bool)

(assert (=> b!53416 m!84035))

(assert (=> b!53416 m!84035))

(declare-fun m!84037 () Bool)

(assert (=> b!53416 m!84037))

(declare-fun m!84039 () Bool)

(assert (=> b!53416 m!84039))

(declare-fun m!84041 () Bool)

(assert (=> b!53416 m!84041))

(declare-fun m!84043 () Bool)

(assert (=> b!53412 m!84043))

(declare-fun m!84045 () Bool)

(assert (=> b!53412 m!84045))

(declare-fun m!84047 () Bool)

(assert (=> b!53412 m!84047))

(assert (=> b!53412 m!84043))

(declare-fun m!84049 () Bool)

(assert (=> b!53412 m!84049))

(declare-fun m!84051 () Bool)

(assert (=> b!53412 m!84051))

(declare-fun m!84053 () Bool)

(assert (=> b!53413 m!84053))

(push 1)

(assert (not start!10684))

(assert (not b!53412))

(assert (not b!53413))

(assert (not b!53414))

(assert (not b!53416))

(assert (not b!53415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16928 () Bool)

(declare-fun res!44656 () Bool)

(declare-fun e!35635 () Bool)

(assert (=> d!16928 (=> (not res!44656) (not e!35635))))

(assert (=> d!16928 (= res!44656 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 thiss!1379))))))

(assert (=> d!16928 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35635)))

(declare-fun b!53456 () Bool)

(declare-fun res!44658 () Bool)

(assert (=> b!53456 (=> (not res!44658) (not e!35635))))

(assert (=> b!53456 (= res!44658 (bvsle (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(declare-fun b!53457 () Bool)

(declare-fun e!35634 () Bool)

(assert (=> b!53457 (= e!35635 e!35634)))

(declare-fun res!44657 () Bool)

(assert (=> b!53457 (=> res!44657 e!35634)))

(assert (=> b!53457 (= res!44657 (= (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53458 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2525 array!2525 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53458 (= e!35634 (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!16928 res!44656) b!53456))

(assert (= (and b!53456 res!44658) b!53457))

(assert (= (and b!53457 (not res!44657)) b!53458))

(assert (=> b!53456 m!84027))

(assert (=> b!53456 m!84027))

(assert (=> b!53458 m!84027))

(assert (=> b!53458 m!84027))

(declare-fun m!84083 () Bool)

(assert (=> b!53458 m!84083))

(assert (=> b!53414 d!16928))

(declare-fun d!16932 () Bool)

(assert (=> d!16932 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82852 () Unit!3712)

(declare-fun choose!11 (BitStream!1994) Unit!3712)

(assert (=> d!16932 (= lt!82852 (choose!11 thiss!1379))))

(assert (=> d!16932 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82852)))

(declare-fun bs!4297 () Bool)

(assert (= bs!4297 d!16932))

(assert (=> bs!4297 m!84023))

(declare-fun m!84085 () Bool)

(assert (=> bs!4297 m!84085))

(assert (=> b!53414 d!16932))

(declare-fun d!16934 () Bool)

(declare-fun e!35638 () Bool)

(assert (=> d!16934 e!35638))

(declare-fun res!44664 () Bool)

(assert (=> d!16934 (=> (not res!44664) (not e!35638))))

(declare-fun lt!82867 () (_ BitVec 64))

(declare-fun lt!82870 () (_ BitVec 64))

(declare-fun lt!82869 () (_ BitVec 64))

(assert (=> d!16934 (= res!44664 (= lt!82869 (bvsub lt!82870 lt!82867)))))

(assert (=> d!16934 (or (= (bvand lt!82870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82870 lt!82867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16934 (= lt!82867 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379))))))

(declare-fun lt!82866 () (_ BitVec 64))

(declare-fun lt!82865 () (_ BitVec 64))

(assert (=> d!16934 (= lt!82870 (bvmul lt!82866 lt!82865))))

(assert (=> d!16934 (or (= lt!82866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82865 (bvsdiv (bvmul lt!82866 lt!82865) lt!82866)))))

(assert (=> d!16934 (= lt!82865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16934 (= lt!82866 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))))))

(assert (=> d!16934 (= lt!82869 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16934 (invariant!0 (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379) (size!1151 (buf!1501 thiss!1379)))))

(assert (=> d!16934 (= (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) lt!82869)))

(declare-fun b!53463 () Bool)

(declare-fun res!44663 () Bool)

(assert (=> b!53463 (=> (not res!44663) (not e!35638))))

(assert (=> b!53463 (= res!44663 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82869))))

(declare-fun b!53464 () Bool)

(declare-fun lt!82868 () (_ BitVec 64))

(assert (=> b!53464 (= e!35638 (bvsle lt!82869 (bvmul lt!82868 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53464 (or (= lt!82868 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82868 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82868)))))

(assert (=> b!53464 (= lt!82868 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))))))

(assert (= (and d!16934 res!44664) b!53463))

(assert (= (and b!53463 res!44663) b!53464))

(declare-fun m!84087 () Bool)

(assert (=> d!16934 m!84087))

(declare-fun m!84089 () Bool)

(assert (=> d!16934 m!84089))

(assert (=> b!53414 d!16934))

(declare-fun d!16936 () Bool)

(assert (=> d!16936 (= (array_inv!1056 (buf!1501 thiss!1379)) (bvsge (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53413 d!16936))

(declare-fun d!16938 () Bool)

(assert (=> d!16938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4298 () Bool)

(assert (= bs!4298 d!16938))

(assert (=> bs!4298 m!84087))

(assert (=> b!53415 d!16938))

(declare-fun d!16940 () Bool)

(assert (=> d!16940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4299 () Bool)

(assert (= bs!4299 d!16940))

(declare-fun m!84091 () Bool)

(assert (=> bs!4299 m!84091))

(assert (=> b!53416 d!16940))

(declare-fun d!16942 () Bool)

(assert (=> d!16942 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!82873 () Unit!3712)

(declare-fun choose!9 (BitStream!1994 array!2525 (_ BitVec 64) BitStream!1994) Unit!3712)

(assert (=> d!16942 (= lt!82873 (choose!9 thiss!1379 (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1995 (buf!1501 (_2!2542 lt!82812)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (=> d!16942 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82873)))

(declare-fun bs!4300 () Bool)

(assert (= bs!4300 d!16942))

(assert (=> bs!4300 m!84041))

(declare-fun m!84093 () Bool)

(assert (=> bs!4300 m!84093))

(assert (=> b!53416 d!16942))

(declare-fun b!53505 () Bool)

(declare-fun res!44689 () Bool)

(declare-fun e!35659 () Bool)

(assert (=> b!53505 (=> (not res!44689) (not e!35659))))

(declare-fun lt!82997 () tuple2!4876)

(assert (=> b!53505 (= res!44689 (isPrefixOf!0 (_2!2543 lt!82997) (_2!2542 lt!82812)))))

(declare-fun d!16944 () Bool)

(assert (=> d!16944 e!35659))

(declare-fun res!44690 () Bool)

(assert (=> d!16944 (=> (not res!44690) (not e!35659))))

(assert (=> d!16944 (= res!44690 (isPrefixOf!0 (_1!2543 lt!82997) (_2!2543 lt!82997)))))

(declare-fun lt!82998 () BitStream!1994)

(assert (=> d!16944 (= lt!82997 (tuple2!4877 lt!82998 (_2!2542 lt!82812)))))

(declare-fun lt!82995 () Unit!3712)

(declare-fun lt!82996 () Unit!3712)

(assert (=> d!16944 (= lt!82995 lt!82996)))

(assert (=> d!16944 (isPrefixOf!0 lt!82998 (_2!2542 lt!82812))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1994 BitStream!1994 BitStream!1994) Unit!3712)

(assert (=> d!16944 (= lt!82996 (lemmaIsPrefixTransitive!0 lt!82998 (_2!2542 lt!82812) (_2!2542 lt!82812)))))

(declare-fun lt!82980 () Unit!3712)

(declare-fun lt!82982 () Unit!3712)

(assert (=> d!16944 (= lt!82980 lt!82982)))

(assert (=> d!16944 (isPrefixOf!0 lt!82998 (_2!2542 lt!82812))))

(assert (=> d!16944 (= lt!82982 (lemmaIsPrefixTransitive!0 lt!82998 thiss!1379 (_2!2542 lt!82812)))))

(declare-fun lt!82984 () Unit!3712)

(declare-fun e!35658 () Unit!3712)

(assert (=> d!16944 (= lt!82984 e!35658)))

(declare-fun c!3777 () Bool)

(assert (=> d!16944 (= c!3777 (not (= (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82989 () Unit!3712)

(declare-fun lt!82992 () Unit!3712)

(assert (=> d!16944 (= lt!82989 lt!82992)))

(assert (=> d!16944 (isPrefixOf!0 (_2!2542 lt!82812) (_2!2542 lt!82812))))

(assert (=> d!16944 (= lt!82992 (lemmaIsPrefixRefl!0 (_2!2542 lt!82812)))))

(declare-fun lt!82985 () Unit!3712)

(declare-fun lt!82986 () Unit!3712)

(assert (=> d!16944 (= lt!82985 lt!82986)))

(assert (=> d!16944 (= lt!82986 (lemmaIsPrefixRefl!0 (_2!2542 lt!82812)))))

(declare-fun lt!82991 () Unit!3712)

(declare-fun lt!82979 () Unit!3712)

(assert (=> d!16944 (= lt!82991 lt!82979)))

(assert (=> d!16944 (isPrefixOf!0 lt!82998 lt!82998)))

(assert (=> d!16944 (= lt!82979 (lemmaIsPrefixRefl!0 lt!82998))))

(declare-fun lt!82983 () Unit!3712)

(declare-fun lt!82990 () Unit!3712)

(assert (=> d!16944 (= lt!82983 lt!82990)))

(assert (=> d!16944 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16944 (= lt!82990 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16944 (= lt!82998 (BitStream!1995 (buf!1501 (_2!2542 lt!82812)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(assert (=> d!16944 (isPrefixOf!0 thiss!1379 (_2!2542 lt!82812))))

(assert (=> d!16944 (= (reader!0 thiss!1379 (_2!2542 lt!82812)) lt!82997)))

(declare-fun b!53506 () Bool)

(declare-fun lt!82994 () Unit!3712)

(assert (=> b!53506 (= e!35658 lt!82994)))

(declare-fun lt!82987 () (_ BitVec 64))

(assert (=> b!53506 (= lt!82987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82993 () (_ BitVec 64))

(assert (=> b!53506 (= lt!82993 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2525 array!2525 (_ BitVec 64) (_ BitVec 64)) Unit!3712)

(assert (=> b!53506 (= lt!82994 (arrayBitRangesEqSymmetric!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) lt!82987 lt!82993))))

(assert (=> b!53506 (arrayBitRangesEq!0 (buf!1501 (_2!2542 lt!82812)) (buf!1501 thiss!1379) lt!82987 lt!82993)))

(declare-fun b!53507 () Bool)

(declare-fun lt!82988 () (_ BitVec 64))

(declare-fun lt!82981 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1994 (_ BitVec 64)) BitStream!1994)

(assert (=> b!53507 (= e!35659 (= (_1!2543 lt!82997) (withMovedBitIndex!0 (_2!2543 lt!82997) (bvsub lt!82981 lt!82988))))))

(assert (=> b!53507 (or (= (bvand lt!82981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82981 lt!82988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53507 (= lt!82988 (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812))))))

(assert (=> b!53507 (= lt!82981 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun b!53508 () Bool)

(declare-fun Unit!3716 () Unit!3712)

(assert (=> b!53508 (= e!35658 Unit!3716)))

(declare-fun b!53509 () Bool)

(declare-fun res!44691 () Bool)

(assert (=> b!53509 (=> (not res!44691) (not e!35659))))

(assert (=> b!53509 (= res!44691 (isPrefixOf!0 (_1!2543 lt!82997) thiss!1379))))

(assert (= (and d!16944 c!3777) b!53506))

(assert (= (and d!16944 (not c!3777)) b!53508))

(assert (= (and d!16944 res!44690) b!53509))

(assert (= (and b!53509 res!44691) b!53505))

(assert (= (and b!53505 res!44689) b!53507))

(declare-fun m!84131 () Bool)

(assert (=> d!16944 m!84131))

(declare-fun m!84133 () Bool)

(assert (=> d!16944 m!84133))

(declare-fun m!84135 () Bool)

(assert (=> d!16944 m!84135))

(assert (=> d!16944 m!84023))

(declare-fun m!84137 () Bool)

(assert (=> d!16944 m!84137))

(assert (=> d!16944 m!84025))

(declare-fun m!84139 () Bool)

(assert (=> d!16944 m!84139))

(declare-fun m!84141 () Bool)

(assert (=> d!16944 m!84141))

(declare-fun m!84143 () Bool)

(assert (=> d!16944 m!84143))

(assert (=> d!16944 m!84045))

(declare-fun m!84145 () Bool)

(assert (=> d!16944 m!84145))

(declare-fun m!84147 () Bool)

(assert (=> b!53509 m!84147))

(declare-fun m!84149 () Bool)

(assert (=> b!53505 m!84149))

(declare-fun m!84151 () Bool)

(assert (=> b!53507 m!84151))

(declare-fun m!84153 () Bool)

(assert (=> b!53507 m!84153))

(assert (=> b!53507 m!84027))

(assert (=> b!53506 m!84027))

(declare-fun m!84155 () Bool)

(assert (=> b!53506 m!84155))

(declare-fun m!84157 () Bool)

(assert (=> b!53506 m!84157))

(assert (=> b!53416 d!16944))

(declare-fun d!16958 () Bool)

(declare-fun c!3780 () Bool)

(assert (=> d!16958 (= c!3780 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35667 () List!572)

(assert (=> d!16958 (= (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!35667)))

(declare-fun b!53523 () Bool)

(assert (=> b!53523 (= e!35667 Nil!569)))

(declare-fun b!53524 () Bool)

(assert (=> b!53524 (= e!35667 (Cons!568 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16958 c!3780) b!53523))

(assert (= (and d!16958 (not c!3780)) b!53524))

(assert (=> b!53524 m!84043))

(declare-fun m!84167 () Bool)

(assert (=> b!53524 m!84167))

(declare-fun m!84169 () Bool)

(assert (=> b!53524 m!84169))

(assert (=> b!53416 d!16958))

(declare-fun d!16972 () Bool)

(assert (=> d!16972 (= (head!391 (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!687 (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53416 d!16972))

(declare-fun b!53554 () Bool)

(declare-fun lt!83050 () (_ BitVec 64))

(declare-datatypes ((tuple2!4892 0))(
  ( (tuple2!4893 (_1!2551 Bool) (_2!2551 BitStream!1994)) )
))
(declare-fun lt!83049 () tuple2!4892)

(declare-datatypes ((tuple2!4894 0))(
  ( (tuple2!4895 (_1!2552 List!572) (_2!2552 BitStream!1994)) )
))
(declare-fun e!35684 () tuple2!4894)

(assert (=> b!53554 (= e!35684 (tuple2!4895 (Cons!568 (_1!2551 lt!83049) (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_2!2551 lt!83049) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050))) (_2!2551 lt!83049)))))

(declare-fun readBit!0 (BitStream!1994) tuple2!4892)

(assert (=> b!53554 (= lt!83049 (readBit!0 (_1!2543 lt!82811)))))

(assert (=> b!53554 (= lt!83050 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16974 () Bool)

(declare-fun e!35683 () Bool)

(assert (=> d!16974 e!35683))

(declare-fun c!3785 () Bool)

(assert (=> d!16974 (= c!3785 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!83048 () List!572)

(assert (=> d!16974 (= lt!83048 (_1!2552 e!35684))))

(declare-fun c!3786 () Bool)

(assert (=> d!16974 (= c!3786 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16974 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16974 (= (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_1!2543 lt!82811) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83048)))

(declare-fun b!53553 () Bool)

(assert (=> b!53553 (= e!35684 (tuple2!4895 Nil!569 (_1!2543 lt!82811)))))

(declare-fun b!53555 () Bool)

(declare-fun isEmpty!153 (List!572) Bool)

(assert (=> b!53555 (= e!35683 (isEmpty!153 lt!83048))))

(declare-fun b!53556 () Bool)

(declare-fun length!267 (List!572) Int)

(assert (=> b!53556 (= e!35683 (> (length!267 lt!83048) 0))))

(assert (= (and d!16974 c!3786) b!53553))

(assert (= (and d!16974 (not c!3786)) b!53554))

(assert (= (and d!16974 c!3785) b!53555))

(assert (= (and d!16974 (not c!3785)) b!53556))

(declare-fun m!84173 () Bool)

(assert (=> b!53554 m!84173))

(declare-fun m!84175 () Bool)

(assert (=> b!53554 m!84175))

(declare-fun m!84177 () Bool)

(assert (=> b!53555 m!84177))

(declare-fun m!84179 () Bool)

(assert (=> b!53556 m!84179))

(assert (=> b!53416 d!16974))

(declare-fun d!16978 () Bool)

(assert (=> d!16978 (= (head!391 (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_1!2543 lt!82811) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!687 (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_1!2543 lt!82811) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53416 d!16978))

(declare-fun d!16980 () Bool)

(declare-fun res!44720 () Bool)

(declare-fun e!35686 () Bool)

(assert (=> d!16980 (=> (not res!44720) (not e!35686))))

(assert (=> d!16980 (= res!44720 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (=> d!16980 (= (isPrefixOf!0 thiss!1379 (_2!2542 lt!82812)) e!35686)))

(declare-fun b!53557 () Bool)

(declare-fun res!44722 () Bool)

(assert (=> b!53557 (=> (not res!44722) (not e!35686))))

(assert (=> b!53557 (= res!44722 (bvsle (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812)))))))

(declare-fun b!53558 () Bool)

(declare-fun e!35685 () Bool)

(assert (=> b!53558 (= e!35686 e!35685)))

(declare-fun res!44721 () Bool)

(assert (=> b!53558 (=> res!44721 e!35685)))

(assert (=> b!53558 (= res!44721 (= (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53559 () Bool)

(assert (=> b!53559 (= e!35685 (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!16980 res!44720) b!53557))

(assert (= (and b!53557 res!44722) b!53558))

(assert (= (and b!53558 (not res!44721)) b!53559))

(assert (=> b!53557 m!84027))

(assert (=> b!53557 m!84153))

(assert (=> b!53559 m!84027))

(assert (=> b!53559 m!84027))

(declare-fun m!84181 () Bool)

(assert (=> b!53559 m!84181))

(assert (=> b!53412 d!16980))

(declare-fun d!16982 () Bool)

(assert (=> d!16982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4306 () Bool)

(assert (= bs!4306 d!16982))

(declare-fun m!84183 () Bool)

(assert (=> bs!4306 m!84183))

(assert (=> b!53412 d!16982))

(declare-fun d!16984 () Bool)

(declare-fun e!35693 () Bool)

(assert (=> d!16984 e!35693))

(declare-fun res!44733 () Bool)

(assert (=> d!16984 (=> (not res!44733) (not e!35693))))

(assert (=> d!16984 (= res!44733 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!83065 () Unit!3712)

(declare-fun choose!27 (BitStream!1994 BitStream!1994 (_ BitVec 64) (_ BitVec 64)) Unit!3712)

(assert (=> d!16984 (= lt!83065 (choose!27 thiss!1379 (_2!2542 lt!82812) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16984 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16984 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2542 lt!82812) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83065)))

(declare-fun b!53570 () Bool)

(assert (=> b!53570 (= e!35693 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16984 res!44733) b!53570))

(declare-fun m!84213 () Bool)

(assert (=> d!16984 m!84213))

(assert (=> b!53570 m!84047))

(assert (=> b!53412 d!16984))

(declare-fun b!53646 () Bool)

(declare-fun res!44789 () Bool)

(declare-fun e!35731 () Bool)

(assert (=> b!53646 (=> (not res!44789) (not e!35731))))

(declare-fun lt!83208 () tuple2!4874)

(assert (=> b!53646 (= res!44789 (isPrefixOf!0 thiss!1379 (_2!2542 lt!83208)))))

(declare-fun b!53647 () Bool)

(declare-fun res!44788 () Bool)

(assert (=> b!53647 (=> (not res!44788) (not e!35731))))

(assert (=> b!53647 (= res!44788 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83208))) (currentByte!3068 (_2!2542 lt!83208)) (currentBit!3063 (_2!2542 lt!83208))) (bvadd (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53648 () Bool)

(declare-fun e!35730 () Bool)

(assert (=> b!53648 (= e!35731 e!35730)))

(declare-fun res!44784 () Bool)

(assert (=> b!53648 (=> (not res!44784) (not e!35730))))

(declare-fun lt!83202 () Bool)

(declare-datatypes ((tuple2!4898 0))(
  ( (tuple2!4899 (_1!2554 BitStream!1994) (_2!2554 Bool)) )
))
(declare-fun lt!83207 () tuple2!4898)

(assert (=> b!53648 (= res!44784 (and (= (_2!2554 lt!83207) lt!83202) (= (_1!2554 lt!83207) (_2!2542 lt!83208))))))

(declare-fun readBitPure!0 (BitStream!1994) tuple2!4898)

(declare-fun readerFrom!0 (BitStream!1994 (_ BitVec 32) (_ BitVec 32)) BitStream!1994)

(assert (=> b!53648 (= lt!83207 (readBitPure!0 (readerFrom!0 (_2!2542 lt!83208) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379))))))

(declare-fun b!53649 () Bool)

(declare-fun e!35732 () Bool)

(declare-fun lt!83199 () tuple2!4898)

(declare-fun lt!83206 () tuple2!4874)

(assert (=> b!53649 (= e!35732 (= (bitIndex!0 (size!1151 (buf!1501 (_1!2554 lt!83199))) (currentByte!3068 (_1!2554 lt!83199)) (currentBit!3063 (_1!2554 lt!83199))) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83206))) (currentByte!3068 (_2!2542 lt!83206)) (currentBit!3063 (_2!2542 lt!83206)))))))

(declare-fun d!16990 () Bool)

(declare-fun e!35729 () Bool)

(assert (=> d!16990 e!35729))

(declare-fun res!44790 () Bool)

(assert (=> d!16990 (=> (not res!44790) (not e!35729))))

(assert (=> d!16990 (= res!44790 (= (size!1151 (buf!1501 (_2!2542 lt!83206))) (size!1151 (buf!1501 thiss!1379))))))

(declare-fun lt!83205 () (_ BitVec 8))

(declare-fun lt!83203 () array!2525)

(assert (=> d!16990 (= lt!83205 (select (arr!1687 lt!83203) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16990 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1151 lt!83203)))))

(assert (=> d!16990 (= lt!83203 (array!2526 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!83200 () tuple2!4874)

(assert (=> d!16990 (= lt!83206 (tuple2!4875 (_1!2542 lt!83200) (_2!2542 lt!83200)))))

(assert (=> d!16990 (= lt!83200 lt!83208)))

(assert (=> d!16990 e!35731))

(declare-fun res!44783 () Bool)

(assert (=> d!16990 (=> (not res!44783) (not e!35731))))

(assert (=> d!16990 (= res!44783 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(declare-fun appendBit!0 (BitStream!1994 Bool) tuple2!4874)

(assert (=> d!16990 (= lt!83208 (appendBit!0 thiss!1379 lt!83202))))

(assert (=> d!16990 (= lt!83202 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16990 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16990 (= (appendBitFromByte!0 thiss!1379 (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!83206)))

(declare-fun b!53650 () Bool)

(declare-fun res!44786 () Bool)

(assert (=> b!53650 (=> (not res!44786) (not e!35729))))

(assert (=> b!53650 (= res!44786 (isPrefixOf!0 thiss!1379 (_2!2542 lt!83206)))))

(declare-fun b!53651 () Bool)

(assert (=> b!53651 (= e!35729 e!35732)))

(declare-fun res!44785 () Bool)

(assert (=> b!53651 (=> (not res!44785) (not e!35732))))

(assert (=> b!53651 (= res!44785 (and (= (_2!2554 lt!83199) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!83205)) #b00000000000000000000000000000000))) (= (_1!2554 lt!83199) (_2!2542 lt!83206))))))

(declare-datatypes ((tuple2!4900 0))(
  ( (tuple2!4901 (_1!2555 array!2525) (_2!2555 BitStream!1994)) )
))
(declare-fun lt!83204 () tuple2!4900)

(declare-fun lt!83209 () BitStream!1994)

(declare-fun readBits!0 (BitStream!1994 (_ BitVec 64)) tuple2!4900)

(assert (=> b!53651 (= lt!83204 (readBits!0 lt!83209 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!53651 (= lt!83199 (readBitPure!0 lt!83209))))

(assert (=> b!53651 (= lt!83209 (readerFrom!0 (_2!2542 lt!83206) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379)))))

(declare-fun b!53652 () Bool)

(declare-fun res!44787 () Bool)

(assert (=> b!53652 (=> (not res!44787) (not e!35729))))

(declare-fun lt!83201 () (_ BitVec 64))

(declare-fun lt!83198 () (_ BitVec 64))

(assert (=> b!53652 (= res!44787 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83206))) (currentByte!3068 (_2!2542 lt!83206)) (currentBit!3063 (_2!2542 lt!83206))) (bvadd lt!83198 lt!83201)))))

(assert (=> b!53652 (or (not (= (bvand lt!83198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83201 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83198 lt!83201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53652 (= lt!83201 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53652 (= lt!83198 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun b!53653 () Bool)

(assert (=> b!53653 (= e!35730 (= (bitIndex!0 (size!1151 (buf!1501 (_1!2554 lt!83207))) (currentByte!3068 (_1!2554 lt!83207)) (currentBit!3063 (_1!2554 lt!83207))) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83208))) (currentByte!3068 (_2!2542 lt!83208)) (currentBit!3063 (_2!2542 lt!83208)))))))

(assert (= (and d!16990 res!44783) b!53647))

(assert (= (and b!53647 res!44788) b!53646))

(assert (= (and b!53646 res!44789) b!53648))

(assert (= (and b!53648 res!44784) b!53653))

(assert (= (and d!16990 res!44790) b!53652))

(assert (= (and b!53652 res!44787) b!53650))

(assert (= (and b!53650 res!44786) b!53651))

(assert (= (and b!53651 res!44785) b!53649))

(declare-fun m!84281 () Bool)

(assert (=> b!53648 m!84281))

(assert (=> b!53648 m!84281))

(declare-fun m!84283 () Bool)

(assert (=> b!53648 m!84283))

(declare-fun m!84285 () Bool)

(assert (=> b!53653 m!84285))

(declare-fun m!84287 () Bool)

(assert (=> b!53653 m!84287))

(declare-fun m!84289 () Bool)

(assert (=> b!53646 m!84289))

(declare-fun m!84291 () Bool)

(assert (=> b!53650 m!84291))

(declare-fun m!84293 () Bool)

(assert (=> b!53649 m!84293))

(declare-fun m!84295 () Bool)

(assert (=> b!53649 m!84295))

(assert (=> b!53647 m!84287))

(assert (=> b!53647 m!84027))

(assert (=> b!53652 m!84295))

(assert (=> b!53652 m!84027))

(declare-fun m!84297 () Bool)

(assert (=> b!53651 m!84297))

(declare-fun m!84299 () Bool)

(assert (=> b!53651 m!84299))

(declare-fun m!84301 () Bool)

(assert (=> b!53651 m!84301))

(declare-fun m!84303 () Bool)

(assert (=> d!16990 m!84303))

(declare-fun m!84305 () Bool)

(assert (=> d!16990 m!84305))

(assert (=> d!16990 m!84167))

(assert (=> b!53412 d!16990))

(declare-fun d!17006 () Bool)

(assert (=> d!17006 (= (array_inv!1056 srcBuffer!2) (bvsge (size!1151 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10684 d!17006))

(declare-fun d!17008 () Bool)

(assert (=> d!17008 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379) (size!1151 (buf!1501 thiss!1379))))))

(declare-fun bs!4310 () Bool)

(assert (= bs!4310 d!17008))

(assert (=> bs!4310 m!84089))

(assert (=> start!10684 d!17008))

(push 1)

(assert (not d!16982))

(assert (not b!53647))

(assert (not d!16942))

(assert (not b!53557))

(assert (not b!53505))

(assert (not d!16934))

(assert (not b!53648))

(assert (not b!53555))

(assert (not d!16944))

(assert (not b!53524))

(assert (not b!53509))

(assert (not d!16932))

(assert (not b!53646))

(assert (not d!16938))

(assert (not d!16940))

(assert (not d!16990))

(assert (not b!53651))

(assert (not b!53649))

(assert (not d!16984))

(assert (not b!53506))

(assert (not b!53650))

(assert (not b!53559))

(assert (not b!53554))

(assert (not b!53458))

(assert (not b!53556))

(assert (not b!53507))

(assert (not b!53456))

(assert (not b!53652))

(assert (not d!17008))

(assert (not b!53570))

(assert (not b!53653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!667 () Bool)

(declare-fun lt!83218 () (_ BitVec 32))

(declare-fun c!3801 () Bool)

(declare-datatypes ((tuple4!26 0))(
  ( (tuple4!27 (_1!2556 (_ BitVec 32)) (_2!2556 (_ BitVec 32)) (_3!105 (_ BitVec 32)) (_4!13 (_ BitVec 32))) )
))
(declare-fun lt!83216 () tuple4!26)

(declare-fun lt!83217 () (_ BitVec 32))

(declare-fun call!670 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!667 (= call!670 (byteRangesEq!0 (ite c!3801 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83216)) (select (arr!1687 (buf!1501 thiss!1379)) (_4!13 lt!83216))) (ite c!3801 (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_3!105 lt!83216)) (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_4!13 lt!83216))) (ite c!3801 lt!83217 #b00000000000000000000000000000000) lt!83218))))

(declare-fun d!17010 () Bool)

(declare-fun res!44802 () Bool)

(declare-fun e!35747 () Bool)

(assert (=> d!17010 (=> res!44802 e!35747)))

(assert (=> d!17010 (= res!44802 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (=> d!17010 (= (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))) e!35747)))

(declare-fun b!53668 () Bool)

(declare-fun e!35745 () Bool)

(declare-fun e!35746 () Bool)

(assert (=> b!53668 (= e!35745 e!35746)))

(declare-fun res!44801 () Bool)

(assert (=> b!53668 (= res!44801 (byteRangesEq!0 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83216)) (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_3!105 lt!83216)) lt!83217 #b00000000000000000000000000001000))))

(assert (=> b!53668 (=> (not res!44801) (not e!35746))))

(declare-fun b!53669 () Bool)

(assert (=> b!53669 (= e!35745 call!670)))

(declare-fun b!53670 () Bool)

(declare-fun res!44803 () Bool)

(assert (=> b!53670 (= res!44803 (= lt!83218 #b00000000000000000000000000000000))))

(declare-fun e!35750 () Bool)

(assert (=> b!53670 (=> res!44803 e!35750)))

(assert (=> b!53670 (= e!35746 e!35750)))

(declare-fun b!53671 () Bool)

(declare-fun e!35748 () Bool)

(assert (=> b!53671 (= e!35748 e!35745)))

(assert (=> b!53671 (= c!3801 (= (_3!105 lt!83216) (_4!13 lt!83216)))))

(declare-fun b!53672 () Bool)

(declare-fun e!35749 () Bool)

(declare-fun arrayRangesEq!14 (array!2525 array!2525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!53672 (= e!35749 (arrayRangesEq!14 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) (_1!2556 lt!83216) (_2!2556 lt!83216)))))

(declare-fun b!53673 () Bool)

(assert (=> b!53673 (= e!35750 call!670)))

(declare-fun b!53674 () Bool)

(assert (=> b!53674 (= e!35747 e!35748)))

(declare-fun res!44805 () Bool)

(assert (=> b!53674 (=> (not res!44805) (not e!35748))))

(assert (=> b!53674 (= res!44805 e!35749)))

(declare-fun res!44804 () Bool)

(assert (=> b!53674 (=> res!44804 e!35749)))

(assert (=> b!53674 (= res!44804 (bvsge (_1!2556 lt!83216) (_2!2556 lt!83216)))))

(assert (=> b!53674 (= lt!83218 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53674 (= lt!83217 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!26)

(assert (=> b!53674 (= lt!83216 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!17010 (not res!44802)) b!53674))

(assert (= (and b!53674 (not res!44804)) b!53672))

(assert (= (and b!53674 res!44805) b!53671))

(assert (= (and b!53671 c!3801) b!53669))

(assert (= (and b!53671 (not c!3801)) b!53668))

(assert (= (and b!53668 res!44801) b!53670))

(assert (= (and b!53670 (not res!44803)) b!53673))

(assert (= (or b!53669 b!53673) bm!667))

(declare-fun m!84307 () Bool)

(assert (=> bm!667 m!84307))

(declare-fun m!84309 () Bool)

(assert (=> bm!667 m!84309))

(declare-fun m!84311 () Bool)

(assert (=> bm!667 m!84311))

(declare-fun m!84313 () Bool)

(assert (=> bm!667 m!84313))

(declare-fun m!84315 () Bool)

(assert (=> bm!667 m!84315))

(assert (=> b!53668 m!84311))

(assert (=> b!53668 m!84315))

(assert (=> b!53668 m!84311))

(assert (=> b!53668 m!84315))

(declare-fun m!84317 () Bool)

(assert (=> b!53668 m!84317))

(declare-fun m!84319 () Bool)

(assert (=> b!53672 m!84319))

(assert (=> b!53674 m!84027))

(declare-fun m!84321 () Bool)

(assert (=> b!53674 m!84321))

(assert (=> b!53559 d!17010))

(assert (=> b!53559 d!16934))

(declare-fun lt!83221 () (_ BitVec 64))

(declare-fun lt!83220 () tuple2!4892)

(declare-fun b!53676 () Bool)

(declare-fun e!35752 () tuple2!4894)

(assert (=> b!53676 (= e!35752 (tuple2!4895 (Cons!568 (_1!2551 lt!83220) (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_2!2551 lt!83220) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050) lt!83221))) (_2!2551 lt!83220)))))

(assert (=> b!53676 (= lt!83220 (readBit!0 (_2!2551 lt!83049)))))

(assert (=> b!53676 (= lt!83221 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!17012 () Bool)

(declare-fun e!35751 () Bool)

(assert (=> d!17012 e!35751))

(declare-fun c!3802 () Bool)

(assert (=> d!17012 (= c!3802 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!83219 () List!572)

(assert (=> d!17012 (= lt!83219 (_1!2552 e!35752))))

(declare-fun c!3803 () Bool)

(assert (=> d!17012 (= c!3803 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17012 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17012 (= (bitStreamReadBitsIntoList!0 (_2!2542 lt!82812) (_2!2551 lt!83049) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83050)) lt!83219)))

(declare-fun b!53675 () Bool)

(assert (=> b!53675 (= e!35752 (tuple2!4895 Nil!569 (_2!2551 lt!83049)))))

(declare-fun b!53677 () Bool)

(assert (=> b!53677 (= e!35751 (isEmpty!153 lt!83219))))

(declare-fun b!53678 () Bool)

(assert (=> b!53678 (= e!35751 (> (length!267 lt!83219) 0))))

(assert (= (and d!17012 c!3803) b!53675))

(assert (= (and d!17012 (not c!3803)) b!53676))

(assert (= (and d!17012 c!3802) b!53677))

(assert (= (and d!17012 (not c!3802)) b!53678))

(declare-fun m!84323 () Bool)

(assert (=> b!53676 m!84323))

(declare-fun m!84325 () Bool)

(assert (=> b!53676 m!84325))

(declare-fun m!84327 () Bool)

(assert (=> b!53677 m!84327))

(declare-fun m!84329 () Bool)

(assert (=> b!53678 m!84329))

(assert (=> b!53554 d!17012))

(declare-fun d!17014 () Bool)

(declare-fun e!35759 () Bool)

(assert (=> d!17014 e!35759))

(declare-fun res!44808 () Bool)

(assert (=> d!17014 (=> (not res!44808) (not e!35759))))

(declare-fun increaseBitIndex!0 (BitStream!1994) tuple2!4874)

(assert (=> d!17014 (= res!44808 (= (buf!1501 (_2!2542 (increaseBitIndex!0 (_1!2543 lt!82811)))) (buf!1501 (_1!2543 lt!82811))))))

(declare-fun lt!83236 () Bool)

(assert (=> d!17014 (= lt!83236 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3063 (_1!2543 lt!82811))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83237 () tuple2!4892)

(assert (=> d!17014 (= lt!83237 (tuple2!4893 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3063 (_1!2543 lt!82811))))) #b00000000000000000000000000000000)) (_2!2542 (increaseBitIndex!0 (_1!2543 lt!82811)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!17014 (validate_offset_bit!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2543 lt!82811)))) ((_ sign_extend 32) (currentByte!3068 (_1!2543 lt!82811))) ((_ sign_extend 32) (currentBit!3063 (_1!2543 lt!82811))))))

(assert (=> d!17014 (= (readBit!0 (_1!2543 lt!82811)) lt!83237)))

(declare-fun lt!83241 () (_ BitVec 64))

(declare-fun lt!83240 () (_ BitVec 64))

(declare-fun b!53681 () Bool)

(assert (=> b!53681 (= e!35759 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 (increaseBitIndex!0 (_1!2543 lt!82811))))) (currentByte!3068 (_2!2542 (increaseBitIndex!0 (_1!2543 lt!82811)))) (currentBit!3063 (_2!2542 (increaseBitIndex!0 (_1!2543 lt!82811))))) (bvadd lt!83240 lt!83241)))))

(assert (=> b!53681 (or (not (= (bvand lt!83240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83241 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83240 lt!83241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53681 (= lt!83241 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53681 (= lt!83240 (bitIndex!0 (size!1151 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)) (currentBit!3063 (_1!2543 lt!82811))))))

(declare-fun lt!83242 () Bool)

(assert (=> b!53681 (= lt!83242 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3063 (_1!2543 lt!82811))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83238 () Bool)

(assert (=> b!53681 (= lt!83238 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3063 (_1!2543 lt!82811))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83239 () Bool)

(assert (=> b!53681 (= lt!83239 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 (buf!1501 (_1!2543 lt!82811))) (currentByte!3068 (_1!2543 lt!82811)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3063 (_1!2543 lt!82811))))) #b00000000000000000000000000000000)))))

(assert (= (and d!17014 res!44808) b!53681))

(declare-fun m!84331 () Bool)

(assert (=> d!17014 m!84331))

(declare-fun m!84333 () Bool)

(assert (=> d!17014 m!84333))

(declare-fun m!84335 () Bool)

(assert (=> d!17014 m!84335))

(declare-fun m!84337 () Bool)

(assert (=> d!17014 m!84337))

(declare-fun m!84339 () Bool)

(assert (=> b!53681 m!84339))

(assert (=> b!53681 m!84333))

(declare-fun m!84341 () Bool)

(assert (=> b!53681 m!84341))

(assert (=> b!53681 m!84335))

(assert (=> b!53681 m!84331))

(assert (=> b!53554 d!17014))

(declare-fun d!17016 () Bool)

(declare-fun e!35762 () Bool)

(assert (=> d!17016 e!35762))

(declare-fun res!44811 () Bool)

(assert (=> d!17016 (=> (not res!44811) (not e!35762))))

(declare-fun lt!83248 () (_ BitVec 64))

(declare-fun lt!83247 () BitStream!1994)

(assert (=> d!17016 (= res!44811 (= (bvadd lt!83248 (bvsub lt!82981 lt!82988)) (bitIndex!0 (size!1151 (buf!1501 lt!83247)) (currentByte!3068 lt!83247) (currentBit!3063 lt!83247))))))

(assert (=> d!17016 (or (not (= (bvand lt!83248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82981 lt!82988) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83248 (bvsub lt!82981 lt!82988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17016 (= lt!83248 (bitIndex!0 (size!1151 (buf!1501 (_2!2543 lt!82997))) (currentByte!3068 (_2!2543 lt!82997)) (currentBit!3063 (_2!2543 lt!82997))))))

(declare-fun moveBitIndex!0 (BitStream!1994 (_ BitVec 64)) tuple2!4874)

(assert (=> d!17016 (= lt!83247 (_2!2542 (moveBitIndex!0 (_2!2543 lt!82997) (bvsub lt!82981 lt!82988))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1994 (_ BitVec 64)) Bool)

(assert (=> d!17016 (moveBitIndexPrecond!0 (_2!2543 lt!82997) (bvsub lt!82981 lt!82988))))

(assert (=> d!17016 (= (withMovedBitIndex!0 (_2!2543 lt!82997) (bvsub lt!82981 lt!82988)) lt!83247)))

(declare-fun b!53684 () Bool)

(assert (=> b!53684 (= e!35762 (= (size!1151 (buf!1501 (_2!2543 lt!82997))) (size!1151 (buf!1501 lt!83247))))))

(assert (= (and d!17016 res!44811) b!53684))

(declare-fun m!84343 () Bool)

(assert (=> d!17016 m!84343))

(declare-fun m!84345 () Bool)

(assert (=> d!17016 m!84345))

(declare-fun m!84347 () Bool)

(assert (=> d!17016 m!84347))

(declare-fun m!84349 () Bool)

(assert (=> d!17016 m!84349))

(assert (=> b!53507 d!17016))

(declare-fun d!17018 () Bool)

(declare-fun e!35763 () Bool)

(assert (=> d!17018 e!35763))

(declare-fun res!44813 () Bool)

(assert (=> d!17018 (=> (not res!44813) (not e!35763))))

(declare-fun lt!83251 () (_ BitVec 64))

(declare-fun lt!83254 () (_ BitVec 64))

(declare-fun lt!83253 () (_ BitVec 64))

(assert (=> d!17018 (= res!44813 (= lt!83253 (bvsub lt!83254 lt!83251)))))

(assert (=> d!17018 (or (= (bvand lt!83254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83254 lt!83251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17018 (= lt!83251 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812)))))))

(declare-fun lt!83250 () (_ BitVec 64))

(declare-fun lt!83249 () (_ BitVec 64))

(assert (=> d!17018 (= lt!83254 (bvmul lt!83250 lt!83249))))

(assert (=> d!17018 (or (= lt!83250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83249 (bvsdiv (bvmul lt!83250 lt!83249) lt!83250)))))

(assert (=> d!17018 (= lt!83249 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17018 (= lt!83250 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (=> d!17018 (= lt!83253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812)))))))

(assert (=> d!17018 (invariant!0 (currentBit!3063 (_2!2542 lt!82812)) (currentByte!3068 (_2!2542 lt!82812)) (size!1151 (buf!1501 (_2!2542 lt!82812))))))

(assert (=> d!17018 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812))) lt!83253)))

(declare-fun b!53685 () Bool)

(declare-fun res!44812 () Bool)

(assert (=> b!53685 (=> (not res!44812) (not e!35763))))

(assert (=> b!53685 (= res!44812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83253))))

(declare-fun b!53686 () Bool)

(declare-fun lt!83252 () (_ BitVec 64))

(assert (=> b!53686 (= e!35763 (bvsle lt!83253 (bvmul lt!83252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53686 (or (= lt!83252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83252)))))

(assert (=> b!53686 (= lt!83252 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (= (and d!17018 res!44813) b!53685))

(assert (= (and b!53685 res!44812) b!53686))

(assert (=> d!17018 m!84183))

(declare-fun m!84351 () Bool)

(assert (=> d!17018 m!84351))

(assert (=> b!53507 d!17018))

(assert (=> b!53507 d!16934))

(declare-fun d!17020 () Bool)

(declare-fun size!1152 (List!572) Int)

(assert (=> d!17020 (= (length!267 lt!83048) (size!1152 lt!83048))))

(declare-fun bs!4311 () Bool)

(assert (= bs!4311 d!17020))

(declare-fun m!84353 () Bool)

(assert (=> bs!4311 m!84353))

(assert (=> b!53556 d!17020))

(declare-fun d!17022 () Bool)

(declare-fun res!44814 () Bool)

(declare-fun e!35765 () Bool)

(assert (=> d!17022 (=> (not res!44814) (not e!35765))))

(assert (=> d!17022 (= res!44814 (= (size!1151 (buf!1501 (_1!2543 lt!82997))) (size!1151 (buf!1501 thiss!1379))))))

(assert (=> d!17022 (= (isPrefixOf!0 (_1!2543 lt!82997) thiss!1379) e!35765)))

(declare-fun b!53687 () Bool)

(declare-fun res!44816 () Bool)

(assert (=> b!53687 (=> (not res!44816) (not e!35765))))

(assert (=> b!53687 (= res!44816 (bvsle (bitIndex!0 (size!1151 (buf!1501 (_1!2543 lt!82997))) (currentByte!3068 (_1!2543 lt!82997)) (currentBit!3063 (_1!2543 lt!82997))) (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(declare-fun b!53688 () Bool)

(declare-fun e!35764 () Bool)

(assert (=> b!53688 (= e!35765 e!35764)))

(declare-fun res!44815 () Bool)

(assert (=> b!53688 (=> res!44815 e!35764)))

(assert (=> b!53688 (= res!44815 (= (size!1151 (buf!1501 (_1!2543 lt!82997))) #b00000000000000000000000000000000))))

(declare-fun b!53689 () Bool)

(assert (=> b!53689 (= e!35764 (arrayBitRangesEq!0 (buf!1501 (_1!2543 lt!82997)) (buf!1501 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 (_1!2543 lt!82997))) (currentByte!3068 (_1!2543 lt!82997)) (currentBit!3063 (_1!2543 lt!82997)))))))

(assert (= (and d!17022 res!44814) b!53687))

(assert (= (and b!53687 res!44816) b!53688))

(assert (= (and b!53688 (not res!44815)) b!53689))

(declare-fun m!84355 () Bool)

(assert (=> b!53687 m!84355))

(assert (=> b!53687 m!84027))

(assert (=> b!53689 m!84355))

(assert (=> b!53689 m!84355))

(declare-fun m!84357 () Bool)

(assert (=> b!53689 m!84357))

(assert (=> b!53509 d!17022))

(declare-fun d!17024 () Bool)

(assert (=> d!17024 (= (isEmpty!153 lt!83048) (is-Nil!569 lt!83048))))

(assert (=> b!53555 d!17024))

(declare-fun d!17026 () Bool)

(declare-fun res!44817 () Bool)

(declare-fun e!35767 () Bool)

(assert (=> d!17026 (=> (not res!44817) (not e!35767))))

(assert (=> d!17026 (= res!44817 (= (size!1151 (buf!1501 (_2!2543 lt!82997))) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (=> d!17026 (= (isPrefixOf!0 (_2!2543 lt!82997) (_2!2542 lt!82812)) e!35767)))

(declare-fun b!53690 () Bool)

(declare-fun res!44819 () Bool)

(assert (=> b!53690 (=> (not res!44819) (not e!35767))))

(assert (=> b!53690 (= res!44819 (bvsle (bitIndex!0 (size!1151 (buf!1501 (_2!2543 lt!82997))) (currentByte!3068 (_2!2543 lt!82997)) (currentBit!3063 (_2!2543 lt!82997))) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812)))))))

(declare-fun b!53691 () Bool)

(declare-fun e!35766 () Bool)

(assert (=> b!53691 (= e!35767 e!35766)))

(declare-fun res!44818 () Bool)

(assert (=> b!53691 (=> res!44818 e!35766)))

(assert (=> b!53691 (= res!44818 (= (size!1151 (buf!1501 (_2!2543 lt!82997))) #b00000000000000000000000000000000))))

(declare-fun b!53692 () Bool)

(assert (=> b!53692 (= e!35766 (arrayBitRangesEq!0 (buf!1501 (_2!2543 lt!82997)) (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 (_2!2543 lt!82997))) (currentByte!3068 (_2!2543 lt!82997)) (currentBit!3063 (_2!2543 lt!82997)))))))

(assert (= (and d!17026 res!44817) b!53690))

(assert (= (and b!53690 res!44819) b!53691))

(assert (= (and b!53691 (not res!44818)) b!53692))

(assert (=> b!53690 m!84345))

(assert (=> b!53690 m!84153))

(assert (=> b!53692 m!84345))

(assert (=> b!53692 m!84345))

(declare-fun m!84359 () Bool)

(assert (=> b!53692 m!84359))

(assert (=> b!53505 d!17026))

(declare-fun d!17028 () Bool)

(assert (=> d!17028 (= (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 thiss!1379)))))))

(assert (=> d!16940 d!17028))

(declare-fun d!17030 () Bool)

(declare-fun e!35768 () Bool)

(assert (=> d!17030 e!35768))

(declare-fun res!44821 () Bool)

(assert (=> d!17030 (=> (not res!44821) (not e!35768))))

(declare-fun lt!83260 () (_ BitVec 64))

(declare-fun lt!83257 () (_ BitVec 64))

(declare-fun lt!83259 () (_ BitVec 64))

(assert (=> d!17030 (= res!44821 (= lt!83259 (bvsub lt!83260 lt!83257)))))

(assert (=> d!17030 (or (= (bvand lt!83260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83260 lt!83257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17030 (= lt!83257 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83206)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!83206))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!83206)))))))

(declare-fun lt!83256 () (_ BitVec 64))

(declare-fun lt!83255 () (_ BitVec 64))

(assert (=> d!17030 (= lt!83260 (bvmul lt!83256 lt!83255))))

(assert (=> d!17030 (or (= lt!83256 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83255 (bvsdiv (bvmul lt!83256 lt!83255) lt!83256)))))

(assert (=> d!17030 (= lt!83255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17030 (= lt!83256 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83206)))))))

(assert (=> d!17030 (= lt!83259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!83206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!83206)))))))

(assert (=> d!17030 (invariant!0 (currentBit!3063 (_2!2542 lt!83206)) (currentByte!3068 (_2!2542 lt!83206)) (size!1151 (buf!1501 (_2!2542 lt!83206))))))

(assert (=> d!17030 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83206))) (currentByte!3068 (_2!2542 lt!83206)) (currentBit!3063 (_2!2542 lt!83206))) lt!83259)))

(declare-fun b!53693 () Bool)

(declare-fun res!44820 () Bool)

(assert (=> b!53693 (=> (not res!44820) (not e!35768))))

(assert (=> b!53693 (= res!44820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83259))))

(declare-fun b!53694 () Bool)

(declare-fun lt!83258 () (_ BitVec 64))

(assert (=> b!53694 (= e!35768 (bvsle lt!83259 (bvmul lt!83258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53694 (or (= lt!83258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83258)))))

(assert (=> b!53694 (= lt!83258 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83206)))))))

(assert (= (and d!17030 res!44821) b!53693))

(assert (= (and b!53693 res!44820) b!53694))

(declare-fun m!84361 () Bool)

(assert (=> d!17030 m!84361))

(declare-fun m!84363 () Bool)

(assert (=> d!17030 m!84363))

(assert (=> b!53652 d!17030))

(assert (=> b!53652 d!16934))

(declare-fun d!17032 () Bool)

(declare-fun e!35769 () Bool)

(assert (=> d!17032 e!35769))

(declare-fun res!44823 () Bool)

(assert (=> d!17032 (=> (not res!44823) (not e!35769))))

(declare-fun lt!83263 () (_ BitVec 64))

(declare-fun lt!83266 () (_ BitVec 64))

(declare-fun lt!83265 () (_ BitVec 64))

(assert (=> d!17032 (= res!44823 (= lt!83265 (bvsub lt!83266 lt!83263)))))

(assert (=> d!17032 (or (= (bvand lt!83266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83266 lt!83263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17032 (= lt!83263 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83207)))) ((_ sign_extend 32) (currentByte!3068 (_1!2554 lt!83207))) ((_ sign_extend 32) (currentBit!3063 (_1!2554 lt!83207)))))))

(declare-fun lt!83262 () (_ BitVec 64))

(declare-fun lt!83261 () (_ BitVec 64))

(assert (=> d!17032 (= lt!83266 (bvmul lt!83262 lt!83261))))

(assert (=> d!17032 (or (= lt!83262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83261 (bvsdiv (bvmul lt!83262 lt!83261) lt!83262)))))

(assert (=> d!17032 (= lt!83261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17032 (= lt!83262 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83207)))))))

(assert (=> d!17032 (= lt!83265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_1!2554 lt!83207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_1!2554 lt!83207)))))))

(assert (=> d!17032 (invariant!0 (currentBit!3063 (_1!2554 lt!83207)) (currentByte!3068 (_1!2554 lt!83207)) (size!1151 (buf!1501 (_1!2554 lt!83207))))))

(assert (=> d!17032 (= (bitIndex!0 (size!1151 (buf!1501 (_1!2554 lt!83207))) (currentByte!3068 (_1!2554 lt!83207)) (currentBit!3063 (_1!2554 lt!83207))) lt!83265)))

(declare-fun b!53695 () Bool)

(declare-fun res!44822 () Bool)

(assert (=> b!53695 (=> (not res!44822) (not e!35769))))

(assert (=> b!53695 (= res!44822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83265))))

(declare-fun b!53696 () Bool)

(declare-fun lt!83264 () (_ BitVec 64))

(assert (=> b!53696 (= e!35769 (bvsle lt!83265 (bvmul lt!83264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53696 (or (= lt!83264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83264)))))

(assert (=> b!53696 (= lt!83264 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83207)))))))

(assert (= (and d!17032 res!44823) b!53695))

(assert (= (and b!53695 res!44822) b!53696))

(declare-fun m!84365 () Bool)

(assert (=> d!17032 m!84365))

(declare-fun m!84367 () Bool)

(assert (=> d!17032 m!84367))

(assert (=> b!53653 d!17032))

(declare-fun d!17034 () Bool)

(declare-fun e!35770 () Bool)

(assert (=> d!17034 e!35770))

(declare-fun res!44825 () Bool)

(assert (=> d!17034 (=> (not res!44825) (not e!35770))))

(declare-fun lt!83272 () (_ BitVec 64))

(declare-fun lt!83269 () (_ BitVec 64))

(declare-fun lt!83271 () (_ BitVec 64))

(assert (=> d!17034 (= res!44825 (= lt!83271 (bvsub lt!83272 lt!83269)))))

(assert (=> d!17034 (or (= (bvand lt!83272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83269 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83272 lt!83269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17034 (= lt!83269 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83208)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!83208))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!83208)))))))

(declare-fun lt!83268 () (_ BitVec 64))

(declare-fun lt!83267 () (_ BitVec 64))

(assert (=> d!17034 (= lt!83272 (bvmul lt!83268 lt!83267))))

(assert (=> d!17034 (or (= lt!83268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83267 (bvsdiv (bvmul lt!83268 lt!83267) lt!83268)))))

(assert (=> d!17034 (= lt!83267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17034 (= lt!83268 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(assert (=> d!17034 (= lt!83271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!83208))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!83208)))))))

(assert (=> d!17034 (invariant!0 (currentBit!3063 (_2!2542 lt!83208)) (currentByte!3068 (_2!2542 lt!83208)) (size!1151 (buf!1501 (_2!2542 lt!83208))))))

(assert (=> d!17034 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83208))) (currentByte!3068 (_2!2542 lt!83208)) (currentBit!3063 (_2!2542 lt!83208))) lt!83271)))

(declare-fun b!53697 () Bool)

(declare-fun res!44824 () Bool)

(assert (=> b!53697 (=> (not res!44824) (not e!35770))))

(assert (=> b!53697 (= res!44824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83271))))

(declare-fun b!53698 () Bool)

(declare-fun lt!83270 () (_ BitVec 64))

(assert (=> b!53698 (= e!35770 (bvsle lt!83271 (bvmul lt!83270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53698 (or (= lt!83270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83270)))))

(assert (=> b!53698 (= lt!83270 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(assert (= (and d!17034 res!44825) b!53697))

(assert (= (and b!53697 res!44824) b!53698))

(declare-fun m!84369 () Bool)

(assert (=> d!17034 m!84369))

(declare-fun m!84371 () Bool)

(assert (=> d!17034 m!84371))

(assert (=> b!53653 d!17034))

(assert (=> b!53506 d!16934))

(declare-fun d!17036 () Bool)

(assert (=> d!17036 (arrayBitRangesEq!0 (buf!1501 (_2!2542 lt!82812)) (buf!1501 thiss!1379) lt!82987 lt!82993)))

(declare-fun lt!83275 () Unit!3712)

(declare-fun choose!8 (array!2525 array!2525 (_ BitVec 64) (_ BitVec 64)) Unit!3712)

(assert (=> d!17036 (= lt!83275 (choose!8 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) lt!82987 lt!82993))))

(assert (=> d!17036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82987) (bvsle lt!82987 lt!82993))))

(assert (=> d!17036 (= (arrayBitRangesEqSymmetric!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!82812)) lt!82987 lt!82993) lt!83275)))

(declare-fun bs!4312 () Bool)

(assert (= bs!4312 d!17036))

(assert (=> bs!4312 m!84157))

(declare-fun m!84373 () Bool)

(assert (=> bs!4312 m!84373))

(assert (=> b!53506 d!17036))

(declare-fun c!3804 () Bool)

(declare-fun lt!83278 () (_ BitVec 32))

(declare-fun lt!83277 () (_ BitVec 32))

(declare-fun call!671 () Bool)

(declare-fun bm!668 () Bool)

(declare-fun lt!83276 () tuple4!26)

(assert (=> bm!668 (= call!671 (byteRangesEq!0 (ite c!3804 (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_3!105 lt!83276)) (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_4!13 lt!83276))) (ite c!3804 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83276)) (select (arr!1687 (buf!1501 thiss!1379)) (_4!13 lt!83276))) (ite c!3804 lt!83277 #b00000000000000000000000000000000) lt!83278))))

(declare-fun d!17038 () Bool)

(declare-fun res!44827 () Bool)

(declare-fun e!35773 () Bool)

(assert (=> d!17038 (=> res!44827 e!35773)))

(assert (=> d!17038 (= res!44827 (bvsge lt!82987 lt!82993))))

(assert (=> d!17038 (= (arrayBitRangesEq!0 (buf!1501 (_2!2542 lt!82812)) (buf!1501 thiss!1379) lt!82987 lt!82993) e!35773)))

(declare-fun b!53699 () Bool)

(declare-fun e!35771 () Bool)

(declare-fun e!35772 () Bool)

(assert (=> b!53699 (= e!35771 e!35772)))

(declare-fun res!44826 () Bool)

(assert (=> b!53699 (= res!44826 (byteRangesEq!0 (select (arr!1687 (buf!1501 (_2!2542 lt!82812))) (_3!105 lt!83276)) (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83276)) lt!83277 #b00000000000000000000000000001000))))

(assert (=> b!53699 (=> (not res!44826) (not e!35772))))

(declare-fun b!53700 () Bool)

(assert (=> b!53700 (= e!35771 call!671)))

(declare-fun b!53701 () Bool)

(declare-fun res!44828 () Bool)

(assert (=> b!53701 (= res!44828 (= lt!83278 #b00000000000000000000000000000000))))

(declare-fun e!35776 () Bool)

(assert (=> b!53701 (=> res!44828 e!35776)))

(assert (=> b!53701 (= e!35772 e!35776)))

(declare-fun b!53702 () Bool)

(declare-fun e!35774 () Bool)

(assert (=> b!53702 (= e!35774 e!35771)))

(assert (=> b!53702 (= c!3804 (= (_3!105 lt!83276) (_4!13 lt!83276)))))

(declare-fun e!35775 () Bool)

(declare-fun b!53703 () Bool)

(assert (=> b!53703 (= e!35775 (arrayRangesEq!14 (buf!1501 (_2!2542 lt!82812)) (buf!1501 thiss!1379) (_1!2556 lt!83276) (_2!2556 lt!83276)))))

(declare-fun b!53704 () Bool)

(assert (=> b!53704 (= e!35776 call!671)))

(declare-fun b!53705 () Bool)

(assert (=> b!53705 (= e!35773 e!35774)))

(declare-fun res!44830 () Bool)

(assert (=> b!53705 (=> (not res!44830) (not e!35774))))

(assert (=> b!53705 (= res!44830 e!35775)))

(declare-fun res!44829 () Bool)

(assert (=> b!53705 (=> res!44829 e!35775)))

(assert (=> b!53705 (= res!44829 (bvsge (_1!2556 lt!83276) (_2!2556 lt!83276)))))

(assert (=> b!53705 (= lt!83278 ((_ extract 31 0) (bvsrem lt!82993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53705 (= lt!83277 ((_ extract 31 0) (bvsrem lt!82987 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53705 (= lt!83276 (arrayBitIndices!0 lt!82987 lt!82993))))

(assert (= (and d!17038 (not res!44827)) b!53705))

(assert (= (and b!53705 (not res!44829)) b!53703))

(assert (= (and b!53705 res!44830) b!53702))

(assert (= (and b!53702 c!3804) b!53700))

(assert (= (and b!53702 (not c!3804)) b!53699))

(assert (= (and b!53699 res!44826) b!53701))

(assert (= (and b!53701 (not res!44828)) b!53704))

(assert (= (or b!53700 b!53704) bm!668))

(declare-fun m!84375 () Bool)

(assert (=> bm!668 m!84375))

(declare-fun m!84377 () Bool)

(assert (=> bm!668 m!84377))

(declare-fun m!84379 () Bool)

(assert (=> bm!668 m!84379))

(declare-fun m!84381 () Bool)

(assert (=> bm!668 m!84381))

(declare-fun m!84383 () Bool)

(assert (=> bm!668 m!84383))

(assert (=> b!53699 m!84379))

(assert (=> b!53699 m!84383))

(assert (=> b!53699 m!84379))

(assert (=> b!53699 m!84383))

(declare-fun m!84385 () Bool)

(assert (=> b!53699 m!84385))

(declare-fun m!84387 () Bool)

(assert (=> b!53703 m!84387))

(declare-fun m!84389 () Bool)

(assert (=> b!53705 m!84389))

(assert (=> b!53506 d!17038))

(assert (=> b!53557 d!16934))

(assert (=> b!53557 d!17018))

(assert (=> d!16942 d!16940))

(declare-fun d!17040 () Bool)

(assert (=> d!17040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!17040 true))

(declare-fun _$6!210 () Unit!3712)

(assert (=> d!17040 (= (choose!9 thiss!1379 (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1995 (buf!1501 (_2!2542 lt!82812)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))) _$6!210)))

(declare-fun bs!4313 () Bool)

(assert (= bs!4313 d!17040))

(assert (=> bs!4313 m!84041))

(assert (=> d!16942 d!17040))

(assert (=> b!53570 d!16982))

(declare-fun d!17042 () Bool)

(assert (=> d!17042 (= (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812)))) (bvsub (bvmul ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812))))))))

(assert (=> d!16982 d!17042))

(declare-fun d!17044 () Bool)

(assert (=> d!17044 (= (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 thiss!1379)))))))

(assert (=> d!16934 d!17044))

(declare-fun d!17046 () Bool)

(assert (=> d!17046 (= (invariant!0 (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379) (size!1151 (buf!1501 thiss!1379))) (and (bvsge (currentBit!3063 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3063 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3068 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3068 thiss!1379) (size!1151 (buf!1501 thiss!1379))) (and (= (currentBit!3063 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3068 thiss!1379) (size!1151 (buf!1501 thiss!1379)))))))))

(assert (=> d!16934 d!17046))

(declare-fun b!53718 () Bool)

(declare-fun e!35782 () Bool)

(declare-fun lt!83289 () tuple2!4898)

(declare-fun lt!83290 () tuple2!4874)

(assert (=> b!53718 (= e!35782 (= (bitIndex!0 (size!1151 (buf!1501 (_1!2554 lt!83289))) (currentByte!3068 (_1!2554 lt!83289)) (currentBit!3063 (_1!2554 lt!83289))) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83290))) (currentByte!3068 (_2!2542 lt!83290)) (currentBit!3063 (_2!2542 lt!83290)))))))

(declare-fun b!53716 () Bool)

(declare-fun res!44841 () Bool)

(declare-fun e!35781 () Bool)

(assert (=> b!53716 (=> (not res!44841) (not e!35781))))

(assert (=> b!53716 (= res!44841 (isPrefixOf!0 thiss!1379 (_2!2542 lt!83290)))))

(declare-fun d!17048 () Bool)

(assert (=> d!17048 e!35781))

(declare-fun res!44839 () Bool)

(assert (=> d!17048 (=> (not res!44839) (not e!35781))))

(assert (=> d!17048 (= res!44839 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 (_2!2542 lt!83290)))))))

(declare-fun choose!16 (BitStream!1994 Bool) tuple2!4874)

(assert (=> d!17048 (= lt!83290 (choose!16 thiss!1379 lt!83202))))

(assert (=> d!17048 (validate_offset_bit!0 ((_ sign_extend 32) (size!1151 (buf!1501 thiss!1379))) ((_ sign_extend 32) (currentByte!3068 thiss!1379)) ((_ sign_extend 32) (currentBit!3063 thiss!1379)))))

(assert (=> d!17048 (= (appendBit!0 thiss!1379 lt!83202) lt!83290)))

(declare-fun b!53717 () Bool)

(assert (=> b!53717 (= e!35781 e!35782)))

(declare-fun res!44840 () Bool)

(assert (=> b!53717 (=> (not res!44840) (not e!35782))))

(assert (=> b!53717 (= res!44840 (and (= (_2!2554 lt!83289) lt!83202) (= (_1!2554 lt!83289) (_2!2542 lt!83290))))))

(assert (=> b!53717 (= lt!83289 (readBitPure!0 (readerFrom!0 (_2!2542 lt!83290) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379))))))

(declare-fun b!53715 () Bool)

(declare-fun res!44842 () Bool)

(assert (=> b!53715 (=> (not res!44842) (not e!35781))))

(declare-fun lt!83287 () (_ BitVec 64))

(declare-fun lt!83288 () (_ BitVec 64))

(assert (=> b!53715 (= res!44842 (= (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83290))) (currentByte!3068 (_2!2542 lt!83290)) (currentBit!3063 (_2!2542 lt!83290))) (bvadd lt!83287 lt!83288)))))

(assert (=> b!53715 (or (not (= (bvand lt!83287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83287 lt!83288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53715 (= lt!83288 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53715 (= lt!83287 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(assert (= (and d!17048 res!44839) b!53715))

(assert (= (and b!53715 res!44842) b!53716))

(assert (= (and b!53716 res!44841) b!53717))

(assert (= (and b!53717 res!44840) b!53718))

(declare-fun m!84391 () Bool)

(assert (=> b!53715 m!84391))

(assert (=> b!53715 m!84027))

(declare-fun m!84393 () Bool)

(assert (=> b!53717 m!84393))

(assert (=> b!53717 m!84393))

(declare-fun m!84395 () Bool)

(assert (=> b!53717 m!84395))

(declare-fun m!84397 () Bool)

(assert (=> b!53718 m!84397))

(assert (=> b!53718 m!84391))

(declare-fun m!84399 () Bool)

(assert (=> b!53716 m!84399))

(declare-fun m!84401 () Bool)

(assert (=> d!17048 m!84401))

(declare-fun m!84403 () Bool)

(assert (=> d!17048 m!84403))

(assert (=> d!16990 d!17048))

(declare-fun bm!669 () Bool)

(declare-fun call!672 () Bool)

(declare-fun lt!83292 () (_ BitVec 32))

(declare-fun c!3805 () Bool)

(declare-fun lt!83291 () tuple4!26)

(declare-fun lt!83293 () (_ BitVec 32))

(assert (=> bm!669 (= call!672 (byteRangesEq!0 (ite c!3805 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83291)) (select (arr!1687 (buf!1501 thiss!1379)) (_4!13 lt!83291))) (ite c!3805 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83291)) (select (arr!1687 (buf!1501 thiss!1379)) (_4!13 lt!83291))) (ite c!3805 lt!83292 #b00000000000000000000000000000000) lt!83293))))

(declare-fun d!17050 () Bool)

(declare-fun res!44844 () Bool)

(declare-fun e!35785 () Bool)

(assert (=> d!17050 (=> res!44844 e!35785)))

(assert (=> d!17050 (= res!44844 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (=> d!17050 (= (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))) e!35785)))

(declare-fun b!53719 () Bool)

(declare-fun e!35783 () Bool)

(declare-fun e!35784 () Bool)

(assert (=> b!53719 (= e!35783 e!35784)))

(declare-fun res!44843 () Bool)

(assert (=> b!53719 (= res!44843 (byteRangesEq!0 (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83291)) (select (arr!1687 (buf!1501 thiss!1379)) (_3!105 lt!83291)) lt!83292 #b00000000000000000000000000001000))))

(assert (=> b!53719 (=> (not res!44843) (not e!35784))))

(declare-fun b!53720 () Bool)

(assert (=> b!53720 (= e!35783 call!672)))

(declare-fun b!53721 () Bool)

(declare-fun res!44845 () Bool)

(assert (=> b!53721 (= res!44845 (= lt!83293 #b00000000000000000000000000000000))))

(declare-fun e!35788 () Bool)

(assert (=> b!53721 (=> res!44845 e!35788)))

(assert (=> b!53721 (= e!35784 e!35788)))

(declare-fun b!53722 () Bool)

(declare-fun e!35786 () Bool)

(assert (=> b!53722 (= e!35786 e!35783)))

(assert (=> b!53722 (= c!3805 (= (_3!105 lt!83291) (_4!13 lt!83291)))))

(declare-fun b!53723 () Bool)

(declare-fun e!35787 () Bool)

(assert (=> b!53723 (= e!35787 (arrayRangesEq!14 (buf!1501 thiss!1379) (buf!1501 thiss!1379) (_1!2556 lt!83291) (_2!2556 lt!83291)))))

(declare-fun b!53724 () Bool)

(assert (=> b!53724 (= e!35788 call!672)))

(declare-fun b!53725 () Bool)

(assert (=> b!53725 (= e!35785 e!35786)))

(declare-fun res!44847 () Bool)

(assert (=> b!53725 (=> (not res!44847) (not e!35786))))

(assert (=> b!53725 (= res!44847 e!35787)))

(declare-fun res!44846 () Bool)

(assert (=> b!53725 (=> res!44846 e!35787)))

(assert (=> b!53725 (= res!44846 (bvsge (_1!2556 lt!83291) (_2!2556 lt!83291)))))

(assert (=> b!53725 (= lt!83293 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53725 (= lt!83292 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53725 (= lt!83291 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!17050 (not res!44844)) b!53725))

(assert (= (and b!53725 (not res!44846)) b!53723))

(assert (= (and b!53725 res!44847) b!53722))

(assert (= (and b!53722 c!3805) b!53720))

(assert (= (and b!53722 (not c!3805)) b!53719))

(assert (= (and b!53719 res!44843) b!53721))

(assert (= (and b!53721 (not res!44845)) b!53724))

(assert (= (or b!53720 b!53724) bm!669))

(declare-fun m!84405 () Bool)

(assert (=> bm!669 m!84405))

(declare-fun m!84407 () Bool)

(assert (=> bm!669 m!84407))

(declare-fun m!84409 () Bool)

(assert (=> bm!669 m!84409))

(assert (=> bm!669 m!84405))

(assert (=> bm!669 m!84409))

(assert (=> b!53719 m!84409))

(assert (=> b!53719 m!84409))

(assert (=> b!53719 m!84409))

(assert (=> b!53719 m!84409))

(declare-fun m!84411 () Bool)

(assert (=> b!53719 m!84411))

(declare-fun m!84413 () Bool)

(assert (=> b!53723 m!84413))

(assert (=> b!53725 m!84027))

(assert (=> b!53725 m!84321))

(assert (=> b!53458 d!17050))

(assert (=> b!53458 d!16934))

(assert (=> d!16938 d!17044))

(declare-fun d!17052 () Bool)

(declare-fun res!44848 () Bool)

(declare-fun e!35790 () Bool)

(assert (=> d!17052 (=> (not res!44848) (not e!35790))))

(assert (=> d!17052 (= res!44848 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(assert (=> d!17052 (= (isPrefixOf!0 thiss!1379 (_2!2542 lt!83208)) e!35790)))

(declare-fun b!53726 () Bool)

(declare-fun res!44850 () Bool)

(assert (=> b!53726 (=> (not res!44850) (not e!35790))))

(assert (=> b!53726 (= res!44850 (bvsle (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83208))) (currentByte!3068 (_2!2542 lt!83208)) (currentBit!3063 (_2!2542 lt!83208)))))))

(declare-fun b!53727 () Bool)

(declare-fun e!35789 () Bool)

(assert (=> b!53727 (= e!35790 e!35789)))

(declare-fun res!44849 () Bool)

(assert (=> b!53727 (=> res!44849 e!35789)))

(assert (=> b!53727 (= res!44849 (= (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53728 () Bool)

(assert (=> b!53728 (= e!35789 (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!83208)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!17052 res!44848) b!53726))

(assert (= (and b!53726 res!44850) b!53727))

(assert (= (and b!53727 (not res!44849)) b!53728))

(assert (=> b!53726 m!84027))

(assert (=> b!53726 m!84287))

(assert (=> b!53728 m!84027))

(assert (=> b!53728 m!84027))

(declare-fun m!84415 () Bool)

(assert (=> b!53728 m!84415))

(assert (=> b!53646 d!17052))

(assert (=> b!53456 d!16934))

(declare-fun d!17054 () Bool)

(assert (=> d!17054 (validate_offset_bits!1 ((_ sign_extend 32) (size!1151 (buf!1501 (_2!2542 lt!82812)))) ((_ sign_extend 32) (currentByte!3068 (_2!2542 lt!82812))) ((_ sign_extend 32) (currentBit!3063 (_2!2542 lt!82812))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17054 true))

(declare-fun _$1!309 () Unit!3712)

(assert (=> d!17054 (= (choose!27 thiss!1379 (_2!2542 lt!82812) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!309)))

(declare-fun bs!4314 () Bool)

(assert (= bs!4314 d!17054))

(assert (=> bs!4314 m!84047))

(assert (=> d!16984 d!17054))

(declare-fun d!17056 () Bool)

(declare-fun c!3806 () Bool)

(assert (=> d!17056 (= c!3806 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35791 () List!572)

(assert (=> d!17056 (= (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!35791)))

(declare-fun b!53729 () Bool)

(assert (=> b!53729 (= e!35791 Nil!569)))

(declare-fun b!53730 () Bool)

(assert (=> b!53730 (= e!35791 (Cons!568 (not (= (bvand ((_ sign_extend 24) (select (arr!1687 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2542 lt!82812) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17056 c!3806) b!53729))

(assert (= (and d!17056 (not c!3806)) b!53730))

(declare-fun m!84417 () Bool)

(assert (=> b!53730 m!84417))

(declare-fun m!84419 () Bool)

(assert (=> b!53730 m!84419))

(declare-fun m!84421 () Bool)

(assert (=> b!53730 m!84421))

(assert (=> b!53524 d!17056))

(assert (=> d!17008 d!17046))

(declare-fun d!17058 () Bool)

(assert (=> d!17058 (isPrefixOf!0 lt!82998 lt!82998)))

(declare-fun lt!83294 () Unit!3712)

(assert (=> d!17058 (= lt!83294 (choose!11 lt!82998))))

(assert (=> d!17058 (= (lemmaIsPrefixRefl!0 lt!82998) lt!83294)))

(declare-fun bs!4315 () Bool)

(assert (= bs!4315 d!17058))

(assert (=> bs!4315 m!84143))

(declare-fun m!84423 () Bool)

(assert (=> bs!4315 m!84423))

(assert (=> d!16944 d!17058))

(assert (=> d!16944 d!16928))

(declare-fun d!17060 () Bool)

(assert (=> d!17060 (isPrefixOf!0 (_2!2542 lt!82812) (_2!2542 lt!82812))))

(declare-fun lt!83295 () Unit!3712)

(assert (=> d!17060 (= lt!83295 (choose!11 (_2!2542 lt!82812)))))

(assert (=> d!17060 (= (lemmaIsPrefixRefl!0 (_2!2542 lt!82812)) lt!83295)))

(declare-fun bs!4316 () Bool)

(assert (= bs!4316 d!17060))

(assert (=> bs!4316 m!84133))

(declare-fun m!84425 () Bool)

(assert (=> bs!4316 m!84425))

(assert (=> d!16944 d!17060))

(declare-fun d!17062 () Bool)

(assert (=> d!17062 (isPrefixOf!0 lt!82998 (_2!2542 lt!82812))))

(declare-fun lt!83298 () Unit!3712)

(declare-fun choose!30 (BitStream!1994 BitStream!1994 BitStream!1994) Unit!3712)

(assert (=> d!17062 (= lt!83298 (choose!30 lt!82998 (_2!2542 lt!82812) (_2!2542 lt!82812)))))

(assert (=> d!17062 (isPrefixOf!0 lt!82998 (_2!2542 lt!82812))))

(assert (=> d!17062 (= (lemmaIsPrefixTransitive!0 lt!82998 (_2!2542 lt!82812) (_2!2542 lt!82812)) lt!83298)))

(declare-fun bs!4317 () Bool)

(assert (= bs!4317 d!17062))

(assert (=> bs!4317 m!84139))

(declare-fun m!84427 () Bool)

(assert (=> bs!4317 m!84427))

(assert (=> bs!4317 m!84139))

(assert (=> d!16944 d!17062))

(declare-fun d!17064 () Bool)

(declare-fun res!44851 () Bool)

(declare-fun e!35793 () Bool)

(assert (=> d!17064 (=> (not res!44851) (not e!35793))))

(assert (=> d!17064 (= res!44851 (= (size!1151 (buf!1501 lt!82998)) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (=> d!17064 (= (isPrefixOf!0 lt!82998 (_2!2542 lt!82812)) e!35793)))

(declare-fun b!53731 () Bool)

(declare-fun res!44853 () Bool)

(assert (=> b!53731 (=> (not res!44853) (not e!35793))))

(assert (=> b!53731 (= res!44853 (bvsle (bitIndex!0 (size!1151 (buf!1501 lt!82998)) (currentByte!3068 lt!82998) (currentBit!3063 lt!82998)) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812)))))))

(declare-fun b!53732 () Bool)

(declare-fun e!35792 () Bool)

(assert (=> b!53732 (= e!35793 e!35792)))

(declare-fun res!44852 () Bool)

(assert (=> b!53732 (=> res!44852 e!35792)))

(assert (=> b!53732 (= res!44852 (= (size!1151 (buf!1501 lt!82998)) #b00000000000000000000000000000000))))

(declare-fun b!53733 () Bool)

(assert (=> b!53733 (= e!35792 (arrayBitRangesEq!0 (buf!1501 lt!82998) (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 lt!82998)) (currentByte!3068 lt!82998) (currentBit!3063 lt!82998))))))

(assert (= (and d!17064 res!44851) b!53731))

(assert (= (and b!53731 res!44853) b!53732))

(assert (= (and b!53732 (not res!44852)) b!53733))

(declare-fun m!84429 () Bool)

(assert (=> b!53731 m!84429))

(assert (=> b!53731 m!84153))

(assert (=> b!53733 m!84429))

(assert (=> b!53733 m!84429))

(declare-fun m!84431 () Bool)

(assert (=> b!53733 m!84431))

(assert (=> d!16944 d!17064))

(declare-fun d!17066 () Bool)

(assert (=> d!17066 (isPrefixOf!0 lt!82998 (_2!2542 lt!82812))))

(declare-fun lt!83299 () Unit!3712)

(assert (=> d!17066 (= lt!83299 (choose!30 lt!82998 thiss!1379 (_2!2542 lt!82812)))))

(assert (=> d!17066 (isPrefixOf!0 lt!82998 thiss!1379)))

(assert (=> d!17066 (= (lemmaIsPrefixTransitive!0 lt!82998 thiss!1379 (_2!2542 lt!82812)) lt!83299)))

(declare-fun bs!4318 () Bool)

(assert (= bs!4318 d!17066))

(assert (=> bs!4318 m!84139))

(declare-fun m!84433 () Bool)

(assert (=> bs!4318 m!84433))

(declare-fun m!84435 () Bool)

(assert (=> bs!4318 m!84435))

(assert (=> d!16944 d!17066))

(assert (=> d!16944 d!16932))

(assert (=> d!16944 d!16980))

(declare-fun d!17068 () Bool)

(declare-fun res!44854 () Bool)

(declare-fun e!35795 () Bool)

(assert (=> d!17068 (=> (not res!44854) (not e!35795))))

(assert (=> d!17068 (= res!44854 (= (size!1151 (buf!1501 lt!82998)) (size!1151 (buf!1501 lt!82998))))))

(assert (=> d!17068 (= (isPrefixOf!0 lt!82998 lt!82998) e!35795)))

(declare-fun b!53734 () Bool)

(declare-fun res!44856 () Bool)

(assert (=> b!53734 (=> (not res!44856) (not e!35795))))

(assert (=> b!53734 (= res!44856 (bvsle (bitIndex!0 (size!1151 (buf!1501 lt!82998)) (currentByte!3068 lt!82998) (currentBit!3063 lt!82998)) (bitIndex!0 (size!1151 (buf!1501 lt!82998)) (currentByte!3068 lt!82998) (currentBit!3063 lt!82998))))))

(declare-fun b!53735 () Bool)

(declare-fun e!35794 () Bool)

(assert (=> b!53735 (= e!35795 e!35794)))

(declare-fun res!44855 () Bool)

(assert (=> b!53735 (=> res!44855 e!35794)))

(assert (=> b!53735 (= res!44855 (= (size!1151 (buf!1501 lt!82998)) #b00000000000000000000000000000000))))

(declare-fun b!53736 () Bool)

(assert (=> b!53736 (= e!35794 (arrayBitRangesEq!0 (buf!1501 lt!82998) (buf!1501 lt!82998) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 lt!82998)) (currentByte!3068 lt!82998) (currentBit!3063 lt!82998))))))

(assert (= (and d!17068 res!44854) b!53734))

(assert (= (and b!53734 res!44856) b!53735))

(assert (= (and b!53735 (not res!44855)) b!53736))

(assert (=> b!53734 m!84429))

(assert (=> b!53734 m!84429))

(assert (=> b!53736 m!84429))

(assert (=> b!53736 m!84429))

(declare-fun m!84437 () Bool)

(assert (=> b!53736 m!84437))

(assert (=> d!16944 d!17068))

(declare-fun d!17070 () Bool)

(declare-fun res!44857 () Bool)

(declare-fun e!35797 () Bool)

(assert (=> d!17070 (=> (not res!44857) (not e!35797))))

(assert (=> d!17070 (= res!44857 (= (size!1151 (buf!1501 (_2!2542 lt!82812))) (size!1151 (buf!1501 (_2!2542 lt!82812)))))))

(assert (=> d!17070 (= (isPrefixOf!0 (_2!2542 lt!82812) (_2!2542 lt!82812)) e!35797)))

(declare-fun b!53737 () Bool)

(declare-fun res!44859 () Bool)

(assert (=> b!53737 (=> (not res!44859) (not e!35797))))

(assert (=> b!53737 (= res!44859 (bvsle (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812))) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812)))))))

(declare-fun b!53738 () Bool)

(declare-fun e!35796 () Bool)

(assert (=> b!53738 (= e!35797 e!35796)))

(declare-fun res!44858 () Bool)

(assert (=> b!53738 (=> res!44858 e!35796)))

(assert (=> b!53738 (= res!44858 (= (size!1151 (buf!1501 (_2!2542 lt!82812))) #b00000000000000000000000000000000))))

(declare-fun b!53739 () Bool)

(assert (=> b!53739 (= e!35796 (arrayBitRangesEq!0 (buf!1501 (_2!2542 lt!82812)) (buf!1501 (_2!2542 lt!82812)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!82812))) (currentByte!3068 (_2!2542 lt!82812)) (currentBit!3063 (_2!2542 lt!82812)))))))

(assert (= (and d!17070 res!44857) b!53737))

(assert (= (and b!53737 res!44859) b!53738))

(assert (= (and b!53738 (not res!44858)) b!53739))

(assert (=> b!53737 m!84153))

(assert (=> b!53737 m!84153))

(assert (=> b!53739 m!84153))

(assert (=> b!53739 m!84153))

(declare-fun m!84439 () Bool)

(assert (=> b!53739 m!84439))

(assert (=> d!16944 d!17070))

(declare-fun d!17072 () Bool)

(declare-fun res!44860 () Bool)

(declare-fun e!35799 () Bool)

(assert (=> d!17072 (=> (not res!44860) (not e!35799))))

(assert (=> d!17072 (= res!44860 (= (size!1151 (buf!1501 (_1!2543 lt!82997))) (size!1151 (buf!1501 (_2!2543 lt!82997)))))))

(assert (=> d!17072 (= (isPrefixOf!0 (_1!2543 lt!82997) (_2!2543 lt!82997)) e!35799)))

(declare-fun b!53740 () Bool)

(declare-fun res!44862 () Bool)

(assert (=> b!53740 (=> (not res!44862) (not e!35799))))

(assert (=> b!53740 (= res!44862 (bvsle (bitIndex!0 (size!1151 (buf!1501 (_1!2543 lt!82997))) (currentByte!3068 (_1!2543 lt!82997)) (currentBit!3063 (_1!2543 lt!82997))) (bitIndex!0 (size!1151 (buf!1501 (_2!2543 lt!82997))) (currentByte!3068 (_2!2543 lt!82997)) (currentBit!3063 (_2!2543 lt!82997)))))))

(declare-fun b!53741 () Bool)

(declare-fun e!35798 () Bool)

(assert (=> b!53741 (= e!35799 e!35798)))

(declare-fun res!44861 () Bool)

(assert (=> b!53741 (=> res!44861 e!35798)))

(assert (=> b!53741 (= res!44861 (= (size!1151 (buf!1501 (_1!2543 lt!82997))) #b00000000000000000000000000000000))))

(declare-fun b!53742 () Bool)

(assert (=> b!53742 (= e!35798 (arrayBitRangesEq!0 (buf!1501 (_1!2543 lt!82997)) (buf!1501 (_2!2543 lt!82997)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 (_1!2543 lt!82997))) (currentByte!3068 (_1!2543 lt!82997)) (currentBit!3063 (_1!2543 lt!82997)))))))

(assert (= (and d!17072 res!44860) b!53740))

(assert (= (and b!53740 res!44862) b!53741))

(assert (= (and b!53741 (not res!44861)) b!53742))

(assert (=> b!53740 m!84355))

(assert (=> b!53740 m!84345))

(assert (=> b!53742 m!84355))

(assert (=> b!53742 m!84355))

(declare-fun m!84441 () Bool)

(assert (=> b!53742 m!84441))

(assert (=> d!16944 d!17072))

(declare-fun d!17074 () Bool)

(declare-fun res!44863 () Bool)

(declare-fun e!35801 () Bool)

(assert (=> d!17074 (=> (not res!44863) (not e!35801))))

(assert (=> d!17074 (= res!44863 (= (size!1151 (buf!1501 thiss!1379)) (size!1151 (buf!1501 (_2!2542 lt!83206)))))))

(assert (=> d!17074 (= (isPrefixOf!0 thiss!1379 (_2!2542 lt!83206)) e!35801)))

(declare-fun b!53743 () Bool)

(declare-fun res!44865 () Bool)

(assert (=> b!53743 (=> (not res!44865) (not e!35801))))

(assert (=> b!53743 (= res!44865 (bvsle (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)) (bitIndex!0 (size!1151 (buf!1501 (_2!2542 lt!83206))) (currentByte!3068 (_2!2542 lt!83206)) (currentBit!3063 (_2!2542 lt!83206)))))))

(declare-fun b!53744 () Bool)

(declare-fun e!35800 () Bool)

(assert (=> b!53744 (= e!35801 e!35800)))

(declare-fun res!44864 () Bool)

(assert (=> b!53744 (=> res!44864 e!35800)))

(assert (=> b!53744 (= res!44864 (= (size!1151 (buf!1501 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53745 () Bool)

(assert (=> b!53745 (= e!35800 (arrayBitRangesEq!0 (buf!1501 thiss!1379) (buf!1501 (_2!2542 lt!83206)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1151 (buf!1501 thiss!1379)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379))))))

(assert (= (and d!17074 res!44863) b!53743))

(assert (= (and b!53743 res!44865) b!53744))

(assert (= (and b!53744 (not res!44864)) b!53745))

(assert (=> b!53743 m!84027))

(assert (=> b!53743 m!84295))

(assert (=> b!53745 m!84027))

(assert (=> b!53745 m!84027))

(declare-fun m!84443 () Bool)

(assert (=> b!53745 m!84443))

(assert (=> b!53650 d!17074))

(declare-fun b!53756 () Bool)

(declare-fun res!44880 () Bool)

(declare-fun e!35804 () Bool)

(assert (=> b!53756 (=> (not res!44880) (not e!35804))))

(declare-fun lt!83323 () tuple2!4900)

(assert (=> b!53756 (= res!44880 (bvsle (currentByte!3068 lt!83209) (currentByte!3068 (_2!2555 lt!83323))))))

(declare-fun b!53757 () Bool)

(declare-fun res!44876 () Bool)

(assert (=> b!53757 (=> (not res!44876) (not e!35804))))

(declare-fun lt!83318 () (_ BitVec 64))

(assert (=> b!53757 (= res!44876 (= (size!1151 (_1!2555 lt!83323)) ((_ extract 31 0) lt!83318)))))

(assert (=> b!53757 (and (bvslt lt!83318 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!83318 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!83322 () (_ BitVec 64))

(declare-fun lt!83326 () (_ BitVec 64))

(assert (=> b!53757 (= lt!83318 (bvsdiv lt!83322 lt!83326))))

(assert (=> b!53757 (and (not (= lt!83326 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!83322 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!83326 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!53757 (= lt!83326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!83320 () (_ BitVec 64))

(declare-fun lt!83324 () (_ BitVec 64))

(assert (=> b!53757 (= lt!83322 (bvsub lt!83320 lt!83324))))

(assert (=> b!53757 (or (= (bvand lt!83320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83320 lt!83324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53757 (= lt!83324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!83325 () (_ BitVec 64))

(assert (=> b!53757 (= lt!83320 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83325))))

(assert (=> b!53757 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83325 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53757 (= lt!83325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!53758 () Bool)

(declare-fun res!44878 () Bool)

(assert (=> b!53758 (=> (not res!44878) (not e!35804))))

(declare-fun lt!83321 () (_ BitVec 64))

(assert (=> b!53758 (= res!44878 (= (bvadd lt!83321 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1151 (buf!1501 (_2!2555 lt!83323))) (currentByte!3068 (_2!2555 lt!83323)) (currentBit!3063 (_2!2555 lt!83323)))))))

(assert (=> b!53758 (or (not (= (bvand lt!83321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83321 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53758 (= lt!83321 (bitIndex!0 (size!1151 (buf!1501 lt!83209)) (currentByte!3068 lt!83209) (currentBit!3063 lt!83209)))))

(declare-fun b!53759 () Bool)

(declare-fun res!44877 () Bool)

(assert (=> b!53759 (=> (not res!44877) (not e!35804))))

(assert (=> b!53759 (= res!44877 (invariant!0 (currentBit!3063 (_2!2555 lt!83323)) (currentByte!3068 (_2!2555 lt!83323)) (size!1151 (buf!1501 (_2!2555 lt!83323)))))))

(declare-fun d!17076 () Bool)

(assert (=> d!17076 e!35804))

(declare-fun res!44879 () Bool)

(assert (=> d!17076 (=> (not res!44879) (not e!35804))))

(assert (=> d!17076 (= res!44879 (= (buf!1501 (_2!2555 lt!83323)) (buf!1501 lt!83209)))))

(declare-datatypes ((tuple3!184 0))(
  ( (tuple3!185 (_1!2557 Unit!3712) (_2!2557 BitStream!1994) (_3!106 array!2525)) )
))
(declare-fun lt!83319 () tuple3!184)

(assert (=> d!17076 (= lt!83323 (tuple2!4901 (_3!106 lt!83319) (_2!2557 lt!83319)))))

(declare-fun readBitsLoop!0 (BitStream!1994 (_ BitVec 64) array!2525 (_ BitVec 64) (_ BitVec 64)) tuple3!184)

(assert (=> d!17076 (= lt!83319 (readBitsLoop!0 lt!83209 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2526 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17076 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!17076 (= (readBits!0 lt!83209 #b0000000000000000000000000000000000000000000000000000000000000001) lt!83323)))

(declare-fun b!53760 () Bool)

(assert (=> b!53760 (= e!35804 (= (byteArrayBitContentToList!0 (_2!2555 lt!83323) (_1!2555 lt!83323) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2555 lt!83323) lt!83209 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17076 res!44879) b!53758))

(assert (= (and b!53758 res!44878) b!53759))

(assert (= (and b!53759 res!44877) b!53757))

(assert (= (and b!53757 res!44876) b!53756))

(assert (= (and b!53756 res!44880) b!53760))

(declare-fun m!84445 () Bool)

(assert (=> b!53758 m!84445))

(declare-fun m!84447 () Bool)

(assert (=> b!53758 m!84447))

(declare-fun m!84449 () Bool)

(assert (=> b!53759 m!84449))

(declare-fun m!84451 () Bool)

(assert (=> d!17076 m!84451))

(declare-fun m!84453 () Bool)

(assert (=> b!53760 m!84453))

(declare-fun m!84455 () Bool)

(assert (=> b!53760 m!84455))

(assert (=> b!53651 d!17076))

(declare-fun d!17078 () Bool)

(declare-fun lt!83329 () tuple2!4892)

(assert (=> d!17078 (= lt!83329 (readBit!0 lt!83209))))

(assert (=> d!17078 (= (readBitPure!0 lt!83209) (tuple2!4899 (_2!2551 lt!83329) (_1!2551 lt!83329)))))

(declare-fun bs!4319 () Bool)

(assert (= bs!4319 d!17078))

(declare-fun m!84457 () Bool)

(assert (=> bs!4319 m!84457))

(assert (=> b!53651 d!17078))

(declare-fun d!17080 () Bool)

(declare-fun e!35807 () Bool)

(assert (=> d!17080 e!35807))

(declare-fun res!44884 () Bool)

(assert (=> d!17080 (=> (not res!44884) (not e!35807))))

(assert (=> d!17080 (= res!44884 (invariant!0 (currentBit!3063 (_2!2542 lt!83206)) (currentByte!3068 (_2!2542 lt!83206)) (size!1151 (buf!1501 (_2!2542 lt!83206)))))))

(assert (=> d!17080 (= (readerFrom!0 (_2!2542 lt!83206) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379)) (BitStream!1995 (buf!1501 (_2!2542 lt!83206)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun b!53763 () Bool)

(assert (=> b!53763 (= e!35807 (invariant!0 (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379) (size!1151 (buf!1501 (_2!2542 lt!83206)))))))

(assert (= (and d!17080 res!44884) b!53763))

(assert (=> d!17080 m!84363))

(declare-fun m!84459 () Bool)

(assert (=> b!53763 m!84459))

(assert (=> b!53651 d!17080))

(assert (=> b!53647 d!17034))

(assert (=> b!53647 d!16934))

(declare-fun d!17082 () Bool)

(declare-fun lt!83330 () tuple2!4892)

(assert (=> d!17082 (= lt!83330 (readBit!0 (readerFrom!0 (_2!2542 lt!83208) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379))))))

(assert (=> d!17082 (= (readBitPure!0 (readerFrom!0 (_2!2542 lt!83208) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379))) (tuple2!4899 (_2!2551 lt!83330) (_1!2551 lt!83330)))))

(declare-fun bs!4320 () Bool)

(assert (= bs!4320 d!17082))

(assert (=> bs!4320 m!84281))

(declare-fun m!84461 () Bool)

(assert (=> bs!4320 m!84461))

(assert (=> b!53648 d!17082))

(declare-fun d!17084 () Bool)

(declare-fun e!35808 () Bool)

(assert (=> d!17084 e!35808))

(declare-fun res!44885 () Bool)

(assert (=> d!17084 (=> (not res!44885) (not e!35808))))

(assert (=> d!17084 (= res!44885 (invariant!0 (currentBit!3063 (_2!2542 lt!83208)) (currentByte!3068 (_2!2542 lt!83208)) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(assert (=> d!17084 (= (readerFrom!0 (_2!2542 lt!83208) (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379)) (BitStream!1995 (buf!1501 (_2!2542 lt!83208)) (currentByte!3068 thiss!1379) (currentBit!3063 thiss!1379)))))

(declare-fun b!53764 () Bool)

(assert (=> b!53764 (= e!35808 (invariant!0 (currentBit!3063 thiss!1379) (currentByte!3068 thiss!1379) (size!1151 (buf!1501 (_2!2542 lt!83208)))))))

(assert (= (and d!17084 res!44885) b!53764))

(assert (=> d!17084 m!84371))

(declare-fun m!84463 () Bool)

(assert (=> b!53764 m!84463))

(assert (=> b!53648 d!17084))

(declare-fun d!17086 () Bool)

(declare-fun e!35809 () Bool)

(assert (=> d!17086 e!35809))

(declare-fun res!44887 () Bool)

(assert (=> d!17086 (=> (not res!44887) (not e!35809))))

(declare-fun lt!83333 () (_ BitVec 64))

(declare-fun lt!83336 () (_ BitVec 64))

(declare-fun lt!83335 () (_ BitVec 64))

(assert (=> d!17086 (= res!44887 (= lt!83335 (bvsub lt!83336 lt!83333)))))

(assert (=> d!17086 (or (= (bvand lt!83336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83333 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83336 lt!83333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17086 (= lt!83333 (remainingBits!0 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83199)))) ((_ sign_extend 32) (currentByte!3068 (_1!2554 lt!83199))) ((_ sign_extend 32) (currentBit!3063 (_1!2554 lt!83199)))))))

(declare-fun lt!83332 () (_ BitVec 64))

(declare-fun lt!83331 () (_ BitVec 64))

(assert (=> d!17086 (= lt!83336 (bvmul lt!83332 lt!83331))))

(assert (=> d!17086 (or (= lt!83332 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83331 (bvsdiv (bvmul lt!83332 lt!83331) lt!83332)))))

(assert (=> d!17086 (= lt!83331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17086 (= lt!83332 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83199)))))))

(assert (=> d!17086 (= lt!83335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3068 (_1!2554 lt!83199))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3063 (_1!2554 lt!83199)))))))

(assert (=> d!17086 (invariant!0 (currentBit!3063 (_1!2554 lt!83199)) (currentByte!3068 (_1!2554 lt!83199)) (size!1151 (buf!1501 (_1!2554 lt!83199))))))

(assert (=> d!17086 (= (bitIndex!0 (size!1151 (buf!1501 (_1!2554 lt!83199))) (currentByte!3068 (_1!2554 lt!83199)) (currentBit!3063 (_1!2554 lt!83199))) lt!83335)))

(declare-fun b!53765 () Bool)

(declare-fun res!44886 () Bool)

(assert (=> b!53765 (=> (not res!44886) (not e!35809))))

(assert (=> b!53765 (= res!44886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83335))))

(declare-fun b!53766 () Bool)

(declare-fun lt!83334 () (_ BitVec 64))

(assert (=> b!53766 (= e!35809 (bvsle lt!83335 (bvmul lt!83334 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53766 (or (= lt!83334 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83334 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83334)))))

(assert (=> b!53766 (= lt!83334 ((_ sign_extend 32) (size!1151 (buf!1501 (_1!2554 lt!83199)))))))

(assert (= (and d!17086 res!44887) b!53765))

(assert (= (and b!53765 res!44886) b!53766))

(declare-fun m!84465 () Bool)

(assert (=> d!17086 m!84465))

(declare-fun m!84467 () Bool)

(assert (=> d!17086 m!84467))

(assert (=> b!53649 d!17086))

(assert (=> b!53649 d!17030))

(assert (=> d!16932 d!16928))

(declare-fun d!17088 () Bool)

(assert (=> d!17088 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17088 true))

(declare-fun _$14!247 () Unit!3712)

(assert (=> d!17088 (= (choose!11 thiss!1379) _$14!247)))

(declare-fun bs!4322 () Bool)

(assert (= bs!4322 d!17088))

(assert (=> bs!4322 m!84023))

(assert (=> d!16932 d!17088))

(push 1)

(assert (not b!53760))

(assert (not b!53734))

(assert (not b!53719))

(assert (not b!53703))

(assert (not d!17058))

(assert (not b!53717))

(assert (not b!53716))

(assert (not d!17082))

(assert (not b!53692))

(assert (not d!17048))

(assert (not d!17014))

(assert (not b!53733))

(assert (not b!53730))

(assert (not b!53739))

(assert (not b!53726))

(assert (not b!53681))

(assert (not d!17018))

(assert (not d!17066))

(assert (not b!53715))

(assert (not b!53705))

(assert (not b!53728))

(assert (not b!53687))

(assert (not d!17034))

(assert (not d!17032))

(assert (not d!17060))

(assert (not b!53672))

(assert (not d!17062))

(assert (not b!53674))

(assert (not b!53743))

(assert (not b!53731))

(assert (not b!53758))

(assert (not b!53745))

(assert (not b!53677))

(assert (not b!53718))

(assert (not d!17016))

(assert (not d!17088))

(assert (not b!53723))

(assert (not d!17054))

(assert (not b!53763))

(assert (not d!17084))

(assert (not d!17076))

(assert (not d!17080))

(assert (not b!53759))

(assert (not b!53764))

(assert (not b!53668))

(assert (not d!17078))

(assert (not d!17086))

(assert (not d!17030))

(assert (not b!53699))

(assert (not bm!668))

(assert (not d!17040))

(assert (not b!53690))

(assert (not b!53736))

(assert (not b!53678))

(assert (not b!53725))

(assert (not b!53740))

(assert (not b!53737))

(assert (not bm!669))

(assert (not d!17020))

(assert (not b!53676))

(assert (not b!53742))

(assert (not bm!667))

(assert (not b!53689))

(assert (not d!17036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

