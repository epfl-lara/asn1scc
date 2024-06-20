; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7202 () Bool)

(assert start!7202)

(declare-fun b!34938 () Bool)

(declare-fun res!29840 () Bool)

(declare-fun e!23111 () Bool)

(assert (=> b!34938 (=> (not res!29840) (not e!23111))))

(declare-datatypes ((array!1892 0))(
  ( (array!1893 (arr!1322 (Array (_ BitVec 32) (_ BitVec 8))) (size!841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1462 0))(
  ( (BitStream!1463 (buf!1169 array!1892) (currentByte!2548 (_ BitVec 32)) (currentBit!2543 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1462)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34938 (= res!29840 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!34939 () Bool)

(declare-fun e!23112 () Bool)

(declare-fun e!23110 () Bool)

(assert (=> b!34939 (= e!23112 e!23110)))

(declare-fun res!29851 () Bool)

(assert (=> b!34939 (=> res!29851 e!23110)))

(declare-fun lt!51944 () Bool)

(declare-fun lt!51942 () Bool)

(assert (=> b!34939 (= res!29851 (not (= lt!51944 lt!51942)))))

(declare-datatypes ((Unit!2585 0))(
  ( (Unit!2586) )
))
(declare-datatypes ((tuple2!3502 0))(
  ( (tuple2!3503 (_1!1838 Unit!2585) (_2!1838 BitStream!1462)) )
))
(declare-fun lt!51936 () tuple2!3502)

(declare-fun lt!51929 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1892 (_ BitVec 64)) Bool)

(assert (=> b!34939 (= lt!51944 (bitAt!0 (buf!1169 (_2!1838 lt!51936)) lt!51929))))

(declare-fun b!34940 () Bool)

(declare-fun e!23116 () Bool)

(declare-fun e!23114 () Bool)

(assert (=> b!34940 (= e!23116 e!23114)))

(declare-fun res!29846 () Bool)

(assert (=> b!34940 (=> res!29846 e!23114)))

(declare-datatypes ((List!432 0))(
  ( (Nil!429) (Cons!428 (h!547 Bool) (t!1182 List!432)) )
))
(declare-fun lt!51930 () List!432)

(declare-fun lt!51940 () List!432)

(assert (=> b!34940 (= res!29846 (not (= lt!51930 lt!51940)))))

(assert (=> b!34940 (= lt!51940 lt!51930)))

(declare-fun lt!51928 () List!432)

(declare-fun tail!149 (List!432) List!432)

(assert (=> b!34940 (= lt!51930 (tail!149 lt!51928))))

(declare-fun lt!51934 () tuple2!3502)

(declare-datatypes ((tuple2!3504 0))(
  ( (tuple2!3505 (_1!1839 BitStream!1462) (_2!1839 BitStream!1462)) )
))
(declare-fun lt!51946 () tuple2!3504)

(declare-fun lt!51933 () Unit!2585)

(declare-fun lt!51937 () tuple2!3504)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1462 BitStream!1462 BitStream!1462 BitStream!1462 (_ BitVec 64) List!432) Unit!2585)

(assert (=> b!34940 (= lt!51933 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1838 lt!51934) (_2!1838 lt!51934) (_1!1839 lt!51937) (_1!1839 lt!51946) (bvsub to!314 i!635) lt!51928))))

(declare-fun b!34941 () Bool)

(declare-fun e!23113 () Bool)

(assert (=> b!34941 (= e!23113 e!23116)))

(declare-fun res!29841 () Bool)

(assert (=> b!34941 (=> res!29841 e!23116)))

(assert (=> b!34941 (= res!29841 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!51949 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1462 BitStream!1462 (_ BitVec 64)) List!432)

(assert (=> b!34941 (= lt!51940 (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_1!1839 lt!51946) lt!51949))))

(assert (=> b!34941 (= lt!51928 (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_1!1839 lt!51937) (bvsub to!314 i!635)))))

(assert (=> b!34941 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!51949)))

(declare-fun lt!51947 () Unit!2585)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1462 array!1892 (_ BitVec 64)) Unit!2585)

(assert (=> b!34941 (= lt!51947 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!51934)) lt!51949))))

(declare-fun reader!0 (BitStream!1462 BitStream!1462) tuple2!3504)

(assert (=> b!34941 (= lt!51946 (reader!0 (_2!1838 lt!51936) (_2!1838 lt!51934)))))

(assert (=> b!34941 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!51945 () Unit!2585)

(assert (=> b!34941 (= lt!51945 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1169 (_2!1838 lt!51934)) (bvsub to!314 i!635)))))

(assert (=> b!34941 (= lt!51937 (reader!0 thiss!1379 (_2!1838 lt!51934)))))

(declare-fun b!34942 () Bool)

(declare-fun e!23106 () Bool)

(declare-fun e!23107 () Bool)

(assert (=> b!34942 (= e!23106 e!23107)))

(declare-fun res!29852 () Bool)

(assert (=> b!34942 (=> res!29852 e!23107)))

(declare-fun isPrefixOf!0 (BitStream!1462 BitStream!1462) Bool)

(assert (=> b!34942 (= res!29852 (not (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51934))))))

(assert (=> b!34942 (isPrefixOf!0 thiss!1379 (_2!1838 lt!51934))))

(declare-fun lt!51941 () Unit!2585)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1462 BitStream!1462 BitStream!1462) Unit!2585)

(assert (=> b!34942 (= lt!51941 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1838 lt!51936) (_2!1838 lt!51934)))))

(declare-fun srcBuffer!2 () array!1892)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1462 array!1892 (_ BitVec 64) (_ BitVec 64)) tuple2!3502)

(assert (=> b!34942 (= lt!51934 (appendBitsMSBFirstLoop!0 (_2!1838 lt!51936) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23105 () Bool)

(assert (=> b!34942 e!23105))

(declare-fun res!29853 () Bool)

(assert (=> b!34942 (=> (not res!29853) (not e!23105))))

(assert (=> b!34942 (= res!29853 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51939 () Unit!2585)

(assert (=> b!34942 (= lt!51939 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1169 (_2!1838 lt!51936)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51932 () tuple2!3504)

(assert (=> b!34942 (= lt!51932 (reader!0 thiss!1379 (_2!1838 lt!51936)))))

(declare-fun b!34943 () Bool)

(declare-fun e!23102 () Bool)

(declare-fun array_inv!784 (array!1892) Bool)

(assert (=> b!34943 (= e!23102 (array_inv!784 (buf!1169 thiss!1379)))))

(declare-fun b!34944 () Bool)

(declare-fun res!29838 () Bool)

(assert (=> b!34944 (=> res!29838 e!23116)))

(declare-fun length!158 (List!432) Int)

(assert (=> b!34944 (= res!29838 (<= (length!158 lt!51928) 0))))

(declare-fun b!34945 () Bool)

(declare-fun e!23115 () Bool)

(assert (=> b!34945 (= e!23115 e!23113)))

(declare-fun res!29835 () Bool)

(assert (=> b!34945 (=> res!29835 e!23113)))

(assert (=> b!34945 (= res!29835 (not (= (size!841 (buf!1169 (_2!1838 lt!51936))) (size!841 (buf!1169 (_2!1838 lt!51934))))))))

(declare-fun lt!51931 () (_ BitVec 64))

(declare-fun lt!51948 () (_ BitVec 64))

(assert (=> b!34945 (= lt!51931 (bvsub (bvsub (bvadd lt!51948 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!34945 (= lt!51948 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> b!34945 (= (size!841 (buf!1169 (_2!1838 lt!51934))) (size!841 (buf!1169 thiss!1379)))))

(declare-fun b!34946 () Bool)

(declare-fun res!29845 () Bool)

(assert (=> b!34946 (=> res!29845 e!23115)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!34946 (= res!29845 (not (invariant!0 (currentBit!2543 (_2!1838 lt!51934)) (currentByte!2548 (_2!1838 lt!51934)) (size!841 (buf!1169 (_2!1838 lt!51934))))))))

(declare-fun res!29837 () Bool)

(assert (=> start!7202 (=> (not res!29837) (not e!23111))))

(assert (=> start!7202 (= res!29837 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!841 srcBuffer!2))))))))

(assert (=> start!7202 e!23111))

(assert (=> start!7202 true))

(assert (=> start!7202 (array_inv!784 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1462) Bool)

(assert (=> start!7202 (and (inv!12 thiss!1379) e!23102)))

(declare-fun b!34947 () Bool)

(declare-fun res!29839 () Bool)

(assert (=> b!34947 (=> res!29839 e!23113)))

(assert (=> b!34947 (= res!29839 (not (invariant!0 (currentBit!2543 (_2!1838 lt!51936)) (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51936))))))))

(declare-fun b!34948 () Bool)

(declare-fun res!29844 () Bool)

(assert (=> b!34948 (=> res!29844 e!23113)))

(assert (=> b!34948 (= res!29844 (not (invariant!0 (currentBit!2543 (_2!1838 lt!51936)) (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51934))))))))

(declare-fun b!34949 () Bool)

(declare-fun res!29849 () Bool)

(declare-fun e!23104 () Bool)

(assert (=> b!34949 (=> res!29849 e!23104)))

(declare-fun lt!51927 () Bool)

(declare-fun head!269 (List!432) Bool)

(assert (=> b!34949 (= res!29849 (not (= (head!269 lt!51928) lt!51927)))))

(declare-fun b!34950 () Bool)

(declare-fun e!23108 () Bool)

(assert (=> b!34950 (= e!23108 e!23106)))

(declare-fun res!29850 () Bool)

(assert (=> b!34950 (=> res!29850 e!23106)))

(assert (=> b!34950 (= res!29850 (not (isPrefixOf!0 thiss!1379 (_2!1838 lt!51936))))))

(assert (=> b!34950 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!51949)))

(assert (=> b!34950 (= lt!51949 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51935 () Unit!2585)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1462 BitStream!1462 (_ BitVec 64) (_ BitVec 64)) Unit!2585)

(assert (=> b!34950 (= lt!51935 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1838 lt!51936) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1462 (_ BitVec 8) (_ BitVec 32)) tuple2!3502)

(assert (=> b!34950 (= lt!51936 (appendBitFromByte!0 thiss!1379 (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!34951 () Bool)

(assert (=> b!34951 (= e!23107 e!23115)))

(declare-fun res!29842 () Bool)

(assert (=> b!34951 (=> res!29842 e!23115)))

(assert (=> b!34951 (= res!29842 (not (= lt!51931 (bvsub (bvadd lt!51929 to!314) i!635))))))

(assert (=> b!34951 (= lt!51931 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934))))))

(declare-fun b!34952 () Bool)

(assert (=> b!34952 (= e!23114 e!23104)))

(declare-fun res!29843 () Bool)

(assert (=> b!34952 (=> res!29843 e!23104)))

(assert (=> b!34952 (= res!29843 (not (= lt!51927 (bitAt!0 (buf!1169 (_1!1839 lt!51946)) lt!51929))))))

(assert (=> b!34952 (= lt!51927 (bitAt!0 (buf!1169 (_1!1839 lt!51937)) lt!51929))))

(declare-fun b!34953 () Bool)

(declare-fun res!29847 () Bool)

(assert (=> b!34953 (=> res!29847 e!23115)))

(assert (=> b!34953 (= res!29847 (not (= (size!841 (buf!1169 thiss!1379)) (size!841 (buf!1169 (_2!1838 lt!51934))))))))

(declare-fun b!34954 () Bool)

(assert (=> b!34954 (= e!23110 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51929) (bvslt lt!51929 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934))))))))))

(assert (=> b!34954 (= lt!51944 (bitAt!0 (buf!1169 (_2!1838 lt!51934)) lt!51929))))

(declare-fun lt!51938 () Unit!2585)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1892 array!1892 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2585)

(assert (=> b!34954 (= lt!51938 (arrayBitRangesEqImpliesEq!0 (buf!1169 (_2!1838 lt!51936)) (buf!1169 (_2!1838 lt!51934)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51929 lt!51948))))

(declare-fun b!34955 () Bool)

(assert (=> b!34955 (= e!23104 e!23112)))

(declare-fun res!29836 () Bool)

(assert (=> b!34955 (=> res!29836 e!23112)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1462 array!1892 (_ BitVec 64) (_ BitVec 64)) List!432)

(assert (=> b!34955 (= res!29836 (not (= (head!269 (byteArrayBitContentToList!0 (_2!1838 lt!51934) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!51942)))))

(assert (=> b!34955 (= lt!51942 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!34956 () Bool)

(assert (=> b!34956 (= e!23111 (not e!23108))))

(declare-fun res!29848 () Bool)

(assert (=> b!34956 (=> res!29848 e!23108)))

(assert (=> b!34956 (= res!29848 (bvsge i!635 to!314))))

(assert (=> b!34956 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!51943 () Unit!2585)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1462) Unit!2585)

(assert (=> b!34956 (= lt!51943 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!34956 (= lt!51929 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(declare-fun b!34957 () Bool)

(assert (=> b!34957 (= e!23105 (= (head!269 (byteArrayBitContentToList!0 (_2!1838 lt!51936) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!269 (bitStreamReadBitsIntoList!0 (_2!1838 lt!51936) (_1!1839 lt!51932) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!7202 res!29837) b!34938))

(assert (= (and b!34938 res!29840) b!34956))

(assert (= (and b!34956 (not res!29848)) b!34950))

(assert (= (and b!34950 (not res!29850)) b!34942))

(assert (= (and b!34942 res!29853) b!34957))

(assert (= (and b!34942 (not res!29852)) b!34951))

(assert (= (and b!34951 (not res!29842)) b!34946))

(assert (= (and b!34946 (not res!29845)) b!34953))

(assert (= (and b!34953 (not res!29847)) b!34945))

(assert (= (and b!34945 (not res!29835)) b!34947))

(assert (= (and b!34947 (not res!29839)) b!34948))

(assert (= (and b!34948 (not res!29844)) b!34941))

(assert (= (and b!34941 (not res!29841)) b!34944))

(assert (= (and b!34944 (not res!29838)) b!34940))

(assert (= (and b!34940 (not res!29846)) b!34952))

(assert (= (and b!34952 (not res!29843)) b!34949))

(assert (= (and b!34949 (not res!29849)) b!34955))

(assert (= (and b!34955 (not res!29836)) b!34939))

(assert (= (and b!34939 (not res!29851)) b!34954))

(assert (= start!7202 b!34943))

(declare-fun m!52305 () Bool)

(assert (=> b!34950 m!52305))

(declare-fun m!52307 () Bool)

(assert (=> b!34950 m!52307))

(declare-fun m!52309 () Bool)

(assert (=> b!34950 m!52309))

(assert (=> b!34950 m!52307))

(declare-fun m!52311 () Bool)

(assert (=> b!34950 m!52311))

(declare-fun m!52313 () Bool)

(assert (=> b!34950 m!52313))

(declare-fun m!52315 () Bool)

(assert (=> b!34940 m!52315))

(declare-fun m!52317 () Bool)

(assert (=> b!34940 m!52317))

(declare-fun m!52319 () Bool)

(assert (=> b!34952 m!52319))

(declare-fun m!52321 () Bool)

(assert (=> b!34952 m!52321))

(declare-fun m!52323 () Bool)

(assert (=> start!7202 m!52323))

(declare-fun m!52325 () Bool)

(assert (=> start!7202 m!52325))

(declare-fun m!52327 () Bool)

(assert (=> b!34951 m!52327))

(declare-fun m!52329 () Bool)

(assert (=> b!34944 m!52329))

(declare-fun m!52331 () Bool)

(assert (=> b!34948 m!52331))

(declare-fun m!52333 () Bool)

(assert (=> b!34956 m!52333))

(declare-fun m!52335 () Bool)

(assert (=> b!34956 m!52335))

(declare-fun m!52337 () Bool)

(assert (=> b!34956 m!52337))

(declare-fun m!52339 () Bool)

(assert (=> b!34945 m!52339))

(declare-fun m!52341 () Bool)

(assert (=> b!34955 m!52341))

(assert (=> b!34955 m!52341))

(declare-fun m!52343 () Bool)

(assert (=> b!34955 m!52343))

(declare-fun m!52345 () Bool)

(assert (=> b!34955 m!52345))

(declare-fun m!52347 () Bool)

(assert (=> b!34938 m!52347))

(declare-fun m!52349 () Bool)

(assert (=> b!34942 m!52349))

(declare-fun m!52351 () Bool)

(assert (=> b!34942 m!52351))

(declare-fun m!52353 () Bool)

(assert (=> b!34942 m!52353))

(declare-fun m!52355 () Bool)

(assert (=> b!34942 m!52355))

(declare-fun m!52357 () Bool)

(assert (=> b!34942 m!52357))

(declare-fun m!52359 () Bool)

(assert (=> b!34942 m!52359))

(declare-fun m!52361 () Bool)

(assert (=> b!34942 m!52361))

(declare-fun m!52363 () Bool)

(assert (=> b!34941 m!52363))

(declare-fun m!52365 () Bool)

(assert (=> b!34941 m!52365))

(declare-fun m!52367 () Bool)

(assert (=> b!34941 m!52367))

(declare-fun m!52369 () Bool)

(assert (=> b!34941 m!52369))

(declare-fun m!52371 () Bool)

(assert (=> b!34941 m!52371))

(declare-fun m!52373 () Bool)

(assert (=> b!34941 m!52373))

(declare-fun m!52375 () Bool)

(assert (=> b!34941 m!52375))

(declare-fun m!52377 () Bool)

(assert (=> b!34941 m!52377))

(declare-fun m!52379 () Bool)

(assert (=> b!34946 m!52379))

(declare-fun m!52381 () Bool)

(assert (=> b!34943 m!52381))

(declare-fun m!52383 () Bool)

(assert (=> b!34949 m!52383))

(declare-fun m!52385 () Bool)

(assert (=> b!34957 m!52385))

(assert (=> b!34957 m!52385))

(declare-fun m!52387 () Bool)

(assert (=> b!34957 m!52387))

(declare-fun m!52389 () Bool)

(assert (=> b!34957 m!52389))

(assert (=> b!34957 m!52389))

(declare-fun m!52391 () Bool)

(assert (=> b!34957 m!52391))

(declare-fun m!52393 () Bool)

(assert (=> b!34939 m!52393))

(declare-fun m!52395 () Bool)

(assert (=> b!34947 m!52395))

(declare-fun m!52397 () Bool)

(assert (=> b!34954 m!52397))

(declare-fun m!52399 () Bool)

(assert (=> b!34954 m!52399))

(push 1)

(assert (not b!34946))

(assert (not b!34940))

(assert (not b!34939))

(assert (not b!34950))

(assert (not b!34941))

(assert (not b!34945))

(assert (not b!34948))

(assert (not start!7202))

(assert (not b!34938))

(assert (not b!34955))

(assert (not b!34944))

(assert (not b!34951))

(assert (not b!34954))

(assert (not b!34949))

(assert (not b!34956))

(assert (not b!34957))

(assert (not b!34943))

(assert (not b!34952))

(assert (not b!34942))

(assert (not b!34947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10162 () Bool)

(assert (=> d!10162 (= (bitAt!0 (buf!1169 (_2!1838 lt!51936)) lt!51929) (not (= (bvand ((_ sign_extend 24) (select (arr!1322 (buf!1169 (_2!1838 lt!51936))) ((_ extract 31 0) (bvsdiv lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2759 () Bool)

(assert (= bs!2759 d!10162))

(declare-fun m!52593 () Bool)

(assert (=> bs!2759 m!52593))

(declare-fun m!52595 () Bool)

(assert (=> bs!2759 m!52595))

(assert (=> b!34939 d!10162))

(declare-fun d!10164 () Bool)

(declare-fun res!29974 () Bool)

(declare-fun e!23211 () Bool)

(assert (=> d!10164 (=> (not res!29974) (not e!23211))))

(assert (=> d!10164 (= res!29974 (= (size!841 (buf!1169 thiss!1379)) (size!841 (buf!1169 (_2!1838 lt!51936)))))))

(assert (=> d!10164 (= (isPrefixOf!0 thiss!1379 (_2!1838 lt!51936)) e!23211)))

(declare-fun b!35084 () Bool)

(declare-fun res!29976 () Bool)

(assert (=> b!35084 (=> (not res!29976) (not e!23211))))

(assert (=> b!35084 (= res!29976 (bvsle (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)) (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936)))))))

(declare-fun b!35085 () Bool)

(declare-fun e!23212 () Bool)

(assert (=> b!35085 (= e!23211 e!23212)))

(declare-fun res!29975 () Bool)

(assert (=> b!35085 (=> res!29975 e!23212)))

(assert (=> b!35085 (= res!29975 (= (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35086 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1892 array!1892 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35086 (= e!23212 (arrayBitRangesEq!0 (buf!1169 thiss!1379) (buf!1169 (_2!1838 lt!51936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(assert (= (and d!10164 res!29974) b!35084))

(assert (= (and b!35084 res!29976) b!35085))

(assert (= (and b!35085 (not res!29975)) b!35086))

(assert (=> b!35084 m!52337))

(assert (=> b!35084 m!52339))

(assert (=> b!35086 m!52337))

(assert (=> b!35086 m!52337))

(declare-fun m!52597 () Bool)

(assert (=> b!35086 m!52597))

(assert (=> b!34950 d!10164))

(declare-fun d!10166 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10166 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!51949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936)))) lt!51949))))

(declare-fun bs!2760 () Bool)

(assert (= bs!2760 d!10166))

(declare-fun m!52599 () Bool)

(assert (=> bs!2760 m!52599))

(assert (=> b!34950 d!10166))

(declare-fun d!10168 () Bool)

(declare-fun e!23215 () Bool)

(assert (=> d!10168 e!23215))

(declare-fun res!29979 () Bool)

(assert (=> d!10168 (=> (not res!29979) (not e!23215))))

(assert (=> d!10168 (= res!29979 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52090 () Unit!2585)

(declare-fun choose!27 (BitStream!1462 BitStream!1462 (_ BitVec 64) (_ BitVec 64)) Unit!2585)

(assert (=> d!10168 (= lt!52090 (choose!27 thiss!1379 (_2!1838 lt!51936) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10168 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10168 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1838 lt!51936) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52090)))

(declare-fun b!35089 () Bool)

(assert (=> b!35089 (= e!23215 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10168 res!29979) b!35089))

(declare-fun m!52601 () Bool)

(assert (=> d!10168 m!52601))

(declare-fun m!52603 () Bool)

(assert (=> b!35089 m!52603))

(assert (=> b!34950 d!10168))

(declare-fun b!35128 () Bool)

(declare-fun e!23241 () Bool)

(declare-fun e!23238 () Bool)

(assert (=> b!35128 (= e!23241 e!23238)))

(declare-fun res!30021 () Bool)

(assert (=> b!35128 (=> (not res!30021) (not e!23238))))

(declare-fun lt!52150 () tuple2!3502)

(declare-datatypes ((tuple2!3514 0))(
  ( (tuple2!3515 (_1!1844 BitStream!1462) (_2!1844 Bool)) )
))
(declare-fun lt!52146 () tuple2!3514)

(declare-fun lt!52149 () (_ BitVec 8))

(assert (=> b!35128 (= res!30021 (and (= (_2!1844 lt!52146) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!52149)) #b00000000000000000000000000000000))) (= (_1!1844 lt!52146) (_2!1838 lt!52150))))))

(declare-datatypes ((tuple2!3516 0))(
  ( (tuple2!3517 (_1!1845 array!1892) (_2!1845 BitStream!1462)) )
))
(declare-fun lt!52143 () tuple2!3516)

(declare-fun lt!52148 () BitStream!1462)

(declare-fun readBits!0 (BitStream!1462 (_ BitVec 64)) tuple2!3516)

(assert (=> b!35128 (= lt!52143 (readBits!0 lt!52148 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1462) tuple2!3514)

(assert (=> b!35128 (= lt!52146 (readBitPure!0 lt!52148))))

(declare-fun readerFrom!0 (BitStream!1462 (_ BitVec 32) (_ BitVec 32)) BitStream!1462)

(assert (=> b!35128 (= lt!52148 (readerFrom!0 (_2!1838 lt!52150) (currentBit!2543 thiss!1379) (currentByte!2548 thiss!1379)))))

(declare-fun b!35129 () Bool)

(declare-fun e!23240 () Bool)

(declare-fun lt!52140 () tuple2!3514)

(declare-fun lt!52142 () tuple2!3502)

(assert (=> b!35129 (= e!23240 (= (bitIndex!0 (size!841 (buf!1169 (_1!1844 lt!52140))) (currentByte!2548 (_1!1844 lt!52140)) (currentBit!2543 (_1!1844 lt!52140))) (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52142))) (currentByte!2548 (_2!1838 lt!52142)) (currentBit!2543 (_2!1838 lt!52142)))))))

(declare-fun d!10170 () Bool)

(assert (=> d!10170 e!23241))

(declare-fun res!30024 () Bool)

(assert (=> d!10170 (=> (not res!30024) (not e!23241))))

(assert (=> d!10170 (= res!30024 (= (size!841 (buf!1169 (_2!1838 lt!52150))) (size!841 (buf!1169 thiss!1379))))))

(declare-fun lt!52147 () array!1892)

(assert (=> d!10170 (= lt!52149 (select (arr!1322 lt!52147) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10170 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!841 lt!52147)))))

(assert (=> d!10170 (= lt!52147 (array!1893 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!52139 () tuple2!3502)

(assert (=> d!10170 (= lt!52150 (tuple2!3503 (_1!1838 lt!52139) (_2!1838 lt!52139)))))

(assert (=> d!10170 (= lt!52139 lt!52142)))

(declare-fun e!23239 () Bool)

(assert (=> d!10170 e!23239))

(declare-fun res!30018 () Bool)

(assert (=> d!10170 (=> (not res!30018) (not e!23239))))

(assert (=> d!10170 (= res!30018 (= (size!841 (buf!1169 thiss!1379)) (size!841 (buf!1169 (_2!1838 lt!52142)))))))

(declare-fun lt!52145 () Bool)

(declare-fun appendBit!0 (BitStream!1462 Bool) tuple2!3502)

(assert (=> d!10170 (= lt!52142 (appendBit!0 thiss!1379 lt!52145))))

(assert (=> d!10170 (= lt!52145 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10170 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10170 (= (appendBitFromByte!0 thiss!1379 (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!52150)))

(declare-fun b!35130 () Bool)

(assert (=> b!35130 (= e!23239 e!23240)))

(declare-fun res!30017 () Bool)

(assert (=> b!35130 (=> (not res!30017) (not e!23240))))

(assert (=> b!35130 (= res!30017 (and (= (_2!1844 lt!52140) lt!52145) (= (_1!1844 lt!52140) (_2!1838 lt!52142))))))

(assert (=> b!35130 (= lt!52140 (readBitPure!0 (readerFrom!0 (_2!1838 lt!52142) (currentBit!2543 thiss!1379) (currentByte!2548 thiss!1379))))))

(declare-fun b!35131 () Bool)

(declare-fun res!30020 () Bool)

(assert (=> b!35131 (=> (not res!30020) (not e!23241))))

(assert (=> b!35131 (= res!30020 (isPrefixOf!0 thiss!1379 (_2!1838 lt!52150)))))

(declare-fun b!35132 () Bool)

(assert (=> b!35132 (= e!23238 (= (bitIndex!0 (size!841 (buf!1169 (_1!1844 lt!52146))) (currentByte!2548 (_1!1844 lt!52146)) (currentBit!2543 (_1!1844 lt!52146))) (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52150))) (currentByte!2548 (_2!1838 lt!52150)) (currentBit!2543 (_2!1838 lt!52150)))))))

(declare-fun b!35133 () Bool)

(declare-fun res!30022 () Bool)

(assert (=> b!35133 (=> (not res!30022) (not e!23239))))

(assert (=> b!35133 (= res!30022 (isPrefixOf!0 thiss!1379 (_2!1838 lt!52142)))))

(declare-fun b!35134 () Bool)

(declare-fun res!30019 () Bool)

(assert (=> b!35134 (=> (not res!30019) (not e!23239))))

(assert (=> b!35134 (= res!30019 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52142))) (currentByte!2548 (_2!1838 lt!52142)) (currentBit!2543 (_2!1838 lt!52142))) (bvadd (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!35135 () Bool)

(declare-fun res!30023 () Bool)

(assert (=> b!35135 (=> (not res!30023) (not e!23241))))

(declare-fun lt!52141 () (_ BitVec 64))

(declare-fun lt!52144 () (_ BitVec 64))

(assert (=> b!35135 (= res!30023 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52150))) (currentByte!2548 (_2!1838 lt!52150)) (currentBit!2543 (_2!1838 lt!52150))) (bvadd lt!52144 lt!52141)))))

(assert (=> b!35135 (or (not (= (bvand lt!52144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52141 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!52144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!52144 lt!52141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35135 (= lt!52141 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!35135 (= lt!52144 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (= (and d!10170 res!30018) b!35134))

(assert (= (and b!35134 res!30019) b!35133))

(assert (= (and b!35133 res!30022) b!35130))

(assert (= (and b!35130 res!30017) b!35129))

(assert (= (and d!10170 res!30024) b!35135))

(assert (= (and b!35135 res!30023) b!35131))

(assert (= (and b!35131 res!30020) b!35128))

(assert (= (and b!35128 res!30021) b!35132))

(declare-fun m!52621 () Bool)

(assert (=> d!10170 m!52621))

(declare-fun m!52623 () Bool)

(assert (=> d!10170 m!52623))

(declare-fun m!52625 () Bool)

(assert (=> d!10170 m!52625))

(declare-fun m!52627 () Bool)

(assert (=> b!35131 m!52627))

(declare-fun m!52629 () Bool)

(assert (=> b!35128 m!52629))

(declare-fun m!52631 () Bool)

(assert (=> b!35128 m!52631))

(declare-fun m!52633 () Bool)

(assert (=> b!35128 m!52633))

(declare-fun m!52635 () Bool)

(assert (=> b!35132 m!52635))

(declare-fun m!52637 () Bool)

(assert (=> b!35132 m!52637))

(declare-fun m!52639 () Bool)

(assert (=> b!35130 m!52639))

(assert (=> b!35130 m!52639))

(declare-fun m!52641 () Bool)

(assert (=> b!35130 m!52641))

(assert (=> b!35135 m!52637))

(assert (=> b!35135 m!52337))

(declare-fun m!52643 () Bool)

(assert (=> b!35134 m!52643))

(assert (=> b!35134 m!52337))

(declare-fun m!52645 () Bool)

(assert (=> b!35129 m!52645))

(assert (=> b!35129 m!52643))

(declare-fun m!52647 () Bool)

(assert (=> b!35133 m!52647))

(assert (=> b!34950 d!10170))

(declare-fun d!10188 () Bool)

(assert (=> d!10188 (= (array_inv!784 srcBuffer!2) (bvsge (size!841 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7202 d!10188))

(declare-fun d!10190 () Bool)

(assert (=> d!10190 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2543 thiss!1379) (currentByte!2548 thiss!1379) (size!841 (buf!1169 thiss!1379))))))

(declare-fun bs!2764 () Bool)

(assert (= bs!2764 d!10190))

(declare-fun m!52649 () Bool)

(assert (=> bs!2764 m!52649))

(assert (=> start!7202 d!10190))

(declare-fun d!10192 () Bool)

(assert (=> d!10192 (= (invariant!0 (currentBit!2543 (_2!1838 lt!51936)) (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51934)))) (and (bvsge (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (bvslt (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000001000) (bvsge (currentByte!2548 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51934)))) (and (= (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (= (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51934))))))))))

(assert (=> b!34948 d!10192))

(declare-fun d!10194 () Bool)

(assert (=> d!10194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2765 () Bool)

(assert (= bs!2765 d!10194))

(declare-fun m!52651 () Bool)

(assert (=> bs!2765 m!52651))

(assert (=> b!34938 d!10194))

(declare-fun d!10196 () Bool)

(assert (=> d!10196 (= (head!269 lt!51928) (h!547 lt!51928))))

(assert (=> b!34949 d!10196))

(declare-fun d!10198 () Bool)

(assert (=> d!10198 (= (bitAt!0 (buf!1169 (_1!1839 lt!51946)) lt!51929) (not (= (bvand ((_ sign_extend 24) (select (arr!1322 (buf!1169 (_1!1839 lt!51946))) ((_ extract 31 0) (bvsdiv lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2766 () Bool)

(assert (= bs!2766 d!10198))

(declare-fun m!52653 () Bool)

(assert (=> bs!2766 m!52653))

(assert (=> bs!2766 m!52595))

(assert (=> b!34952 d!10198))

(declare-fun d!10200 () Bool)

(assert (=> d!10200 (= (bitAt!0 (buf!1169 (_1!1839 lt!51937)) lt!51929) (not (= (bvand ((_ sign_extend 24) (select (arr!1322 (buf!1169 (_1!1839 lt!51937))) ((_ extract 31 0) (bvsdiv lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2767 () Bool)

(assert (= bs!2767 d!10200))

(declare-fun m!52655 () Bool)

(assert (=> bs!2767 m!52655))

(assert (=> bs!2767 m!52595))

(assert (=> b!34952 d!10200))

(declare-fun call!439 () tuple2!3504)

(declare-fun lt!52527 () tuple2!3502)

(declare-fun c!2380 () Bool)

(declare-fun lt!52528 () tuple2!3502)

(declare-fun bm!436 () Bool)

(assert (=> bm!436 (= call!439 (reader!0 (ite c!2380 (_2!1838 lt!52527) (_2!1838 lt!51936)) (ite c!2380 (_2!1838 lt!52528) (_2!1838 lt!51936))))))

(declare-fun b!35276 () Bool)

(declare-fun e!23312 () Bool)

(declare-fun lt!52540 () (_ BitVec 64))

(assert (=> b!35276 (= e!23312 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!52540))))

(declare-fun b!35277 () Bool)

(declare-fun e!23311 () tuple2!3502)

(declare-fun Unit!2591 () Unit!2585)

(assert (=> b!35277 (= e!23311 (tuple2!3503 Unit!2591 (_2!1838 lt!52528)))))

(assert (=> b!35277 (= lt!52527 (appendBitFromByte!0 (_2!1838 lt!51936) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!52539 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52539 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52548 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52548 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52536 () Unit!2585)

(assert (=> b!35277 (= lt!52536 (validateOffsetBitsIneqLemma!0 (_2!1838 lt!51936) (_2!1838 lt!52527) lt!52539 lt!52548))))

(assert (=> b!35277 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!52527)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!52527))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!52527))) (bvsub lt!52539 lt!52548))))

(declare-fun lt!52519 () Unit!2585)

(assert (=> b!35277 (= lt!52519 lt!52536)))

(declare-fun lt!52529 () tuple2!3504)

(assert (=> b!35277 (= lt!52529 (reader!0 (_2!1838 lt!51936) (_2!1838 lt!52527)))))

(declare-fun lt!52520 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52520 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52525 () Unit!2585)

(assert (=> b!35277 (= lt!52525 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!52527)) lt!52520))))

(assert (=> b!35277 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!52527)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!52520)))

(declare-fun lt!52524 () Unit!2585)

(assert (=> b!35277 (= lt!52524 lt!52525)))

(assert (=> b!35277 (= (head!269 (byteArrayBitContentToList!0 (_2!1838 lt!52527) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!269 (bitStreamReadBitsIntoList!0 (_2!1838 lt!52527) (_1!1839 lt!52529) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52515 () Unit!2585)

(declare-fun Unit!2592 () Unit!2585)

(assert (=> b!35277 (= lt!52515 Unit!2592)))

(assert (=> b!35277 (= lt!52528 (appendBitsMSBFirstLoop!0 (_2!1838 lt!52527) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!52543 () Unit!2585)

(assert (=> b!35277 (= lt!52543 (lemmaIsPrefixTransitive!0 (_2!1838 lt!51936) (_2!1838 lt!52527) (_2!1838 lt!52528)))))

(assert (=> b!35277 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!52528))))

(declare-fun lt!52542 () Unit!2585)

(assert (=> b!35277 (= lt!52542 lt!52543)))

(assert (=> b!35277 (= (size!841 (buf!1169 (_2!1838 lt!52528))) (size!841 (buf!1169 (_2!1838 lt!51936))))))

(declare-fun lt!52513 () Unit!2585)

(declare-fun Unit!2593 () Unit!2585)

(assert (=> b!35277 (= lt!52513 Unit!2593)))

(assert (=> b!35277 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52528))) (currentByte!2548 (_2!1838 lt!52528)) (currentBit!2543 (_2!1838 lt!52528))) (bvsub (bvadd (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52547 () Unit!2585)

(declare-fun Unit!2594 () Unit!2585)

(assert (=> b!35277 (= lt!52547 Unit!2594)))

(assert (=> b!35277 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52528))) (currentByte!2548 (_2!1838 lt!52528)) (currentBit!2543 (_2!1838 lt!52528))) (bvsub (bvsub (bvadd (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52527))) (currentByte!2548 (_2!1838 lt!52527)) (currentBit!2543 (_2!1838 lt!52527))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52514 () Unit!2585)

(declare-fun Unit!2595 () Unit!2585)

(assert (=> b!35277 (= lt!52514 Unit!2595)))

(declare-fun lt!52511 () tuple2!3504)

(assert (=> b!35277 (= lt!52511 (reader!0 (_2!1838 lt!51936) (_2!1838 lt!52528)))))

(declare-fun lt!52516 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52516 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52541 () Unit!2585)

(assert (=> b!35277 (= lt!52541 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!52528)) lt!52516))))

(assert (=> b!35277 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!52528)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!52516)))

(declare-fun lt!52544 () Unit!2585)

(assert (=> b!35277 (= lt!52544 lt!52541)))

(declare-fun lt!52533 () tuple2!3504)

(assert (=> b!35277 (= lt!52533 call!439)))

(declare-fun lt!52522 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52522 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52521 () Unit!2585)

(assert (=> b!35277 (= lt!52521 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!52527) (buf!1169 (_2!1838 lt!52528)) lt!52522))))

(assert (=> b!35277 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!52528)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!52527))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!52527))) lt!52522)))

(declare-fun lt!52530 () Unit!2585)

(assert (=> b!35277 (= lt!52530 lt!52521)))

(declare-fun lt!52537 () List!432)

(assert (=> b!35277 (= lt!52537 (byteArrayBitContentToList!0 (_2!1838 lt!52528) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52549 () List!432)

(assert (=> b!35277 (= lt!52549 (byteArrayBitContentToList!0 (_2!1838 lt!52528) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52550 () List!432)

(assert (=> b!35277 (= lt!52550 (bitStreamReadBitsIntoList!0 (_2!1838 lt!52528) (_1!1839 lt!52511) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52509 () List!432)

(assert (=> b!35277 (= lt!52509 (bitStreamReadBitsIntoList!0 (_2!1838 lt!52528) (_1!1839 lt!52533) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52510 () (_ BitVec 64))

(assert (=> b!35277 (= lt!52510 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52546 () Unit!2585)

(assert (=> b!35277 (= lt!52546 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1838 lt!52528) (_2!1838 lt!52528) (_1!1839 lt!52511) (_1!1839 lt!52533) lt!52510 lt!52550))))

(assert (=> b!35277 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!52528) (_1!1839 lt!52533) (bvsub lt!52510 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!149 lt!52550))))

(declare-fun lt!52508 () Unit!2585)

(assert (=> b!35277 (= lt!52508 lt!52546)))

(declare-fun lt!52518 () (_ BitVec 64))

(declare-fun lt!52517 () Unit!2585)

(assert (=> b!35277 (= lt!52517 (arrayBitRangesEqImpliesEq!0 (buf!1169 (_2!1838 lt!52527)) (buf!1169 (_2!1838 lt!52528)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52518 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52527))) (currentByte!2548 (_2!1838 lt!52527)) (currentBit!2543 (_2!1838 lt!52527)))))))

(assert (=> b!35277 (= (bitAt!0 (buf!1169 (_2!1838 lt!52527)) lt!52518) (bitAt!0 (buf!1169 (_2!1838 lt!52528)) lt!52518))))

(declare-fun lt!52538 () Unit!2585)

(assert (=> b!35277 (= lt!52538 lt!52517)))

(declare-fun b!35278 () Bool)

(declare-fun res!30116 () Bool)

(declare-fun e!23313 () Bool)

(assert (=> b!35278 (=> (not res!30116) (not e!23313))))

(declare-fun lt!52534 () tuple2!3502)

(assert (=> b!35278 (= res!30116 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!52534)))))

(declare-fun b!35279 () Bool)

(declare-fun Unit!2596 () Unit!2585)

(assert (=> b!35279 (= e!23311 (tuple2!3503 Unit!2596 (_2!1838 lt!51936)))))

(assert (=> b!35279 (= (size!841 (buf!1169 (_2!1838 lt!51936))) (size!841 (buf!1169 (_2!1838 lt!51936))))))

(declare-fun lt!52551 () Unit!2585)

(declare-fun Unit!2597 () Unit!2585)

(assert (=> b!35279 (= lt!52551 Unit!2597)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1462 array!1892 array!1892 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35279 (checkByteArrayBitContent!0 (_2!1838 lt!51936) srcBuffer!2 (_1!1845 (readBits!0 (_1!1839 call!439) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!35280 () Bool)

(declare-fun res!30120 () Bool)

(assert (=> b!35280 (=> (not res!30120) (not e!23313))))

(assert (=> b!35280 (= res!30120 (= (size!841 (buf!1169 (_2!1838 lt!51936))) (size!841 (buf!1169 (_2!1838 lt!52534)))))))

(declare-fun b!35282 () Bool)

(declare-fun res!30119 () Bool)

(assert (=> b!35282 (=> (not res!30119) (not e!23313))))

(assert (=> b!35282 (= res!30119 (= (size!841 (buf!1169 (_2!1838 lt!52534))) (size!841 (buf!1169 (_2!1838 lt!51936)))))))

(declare-fun b!35283 () Bool)

(declare-fun res!30121 () Bool)

(assert (=> b!35283 (=> (not res!30121) (not e!23313))))

(assert (=> b!35283 (= res!30121 (invariant!0 (currentBit!2543 (_2!1838 lt!52534)) (currentByte!2548 (_2!1838 lt!52534)) (size!841 (buf!1169 (_2!1838 lt!52534)))))))

(declare-fun b!35281 () Bool)

(declare-fun lt!52532 () tuple2!3504)

(assert (=> b!35281 (= e!23313 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!52534) (_1!1839 lt!52532) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1838 lt!52534) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!35281 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35281 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52535 () Unit!2585)

(declare-fun lt!52512 () Unit!2585)

(assert (=> b!35281 (= lt!52535 lt!52512)))

(assert (=> b!35281 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!52534)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!52540)))

(assert (=> b!35281 (= lt!52512 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!52534)) lt!52540))))

(assert (=> b!35281 e!23312))

(declare-fun res!30118 () Bool)

(assert (=> b!35281 (=> (not res!30118) (not e!23312))))

(assert (=> b!35281 (= res!30118 (and (= (size!841 (buf!1169 (_2!1838 lt!51936))) (size!841 (buf!1169 (_2!1838 lt!52534)))) (bvsge lt!52540 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35281 (= lt!52540 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!35281 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35281 (= lt!52532 (reader!0 (_2!1838 lt!51936) (_2!1838 lt!52534)))))

(declare-fun d!10202 () Bool)

(assert (=> d!10202 e!23313))

(declare-fun res!30117 () Bool)

(assert (=> d!10202 (=> (not res!30117) (not e!23313))))

(declare-fun lt!52531 () (_ BitVec 64))

(assert (=> d!10202 (= res!30117 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!52534))) (currentByte!2548 (_2!1838 lt!52534)) (currentBit!2543 (_2!1838 lt!52534))) (bvsub lt!52531 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10202 (or (= (bvand lt!52531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52531 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52545 () (_ BitVec 64))

(assert (=> d!10202 (= lt!52531 (bvadd lt!52545 to!314))))

(assert (=> d!10202 (or (not (= (bvand lt!52545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!52545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!52545 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10202 (= lt!52545 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> d!10202 (= lt!52534 e!23311)))

(assert (=> d!10202 (= c!2380 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!52526 () Unit!2585)

(declare-fun lt!52523 () Unit!2585)

(assert (=> d!10202 (= lt!52526 lt!52523)))

(assert (=> d!10202 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51936))))

(assert (=> d!10202 (= lt!52523 (lemmaIsPrefixRefl!0 (_2!1838 lt!51936)))))

(assert (=> d!10202 (= lt!52518 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> d!10202 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10202 (= (appendBitsMSBFirstLoop!0 (_2!1838 lt!51936) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!52534)))

(assert (= (and d!10202 c!2380) b!35277))

(assert (= (and d!10202 (not c!2380)) b!35279))

(assert (= (or b!35277 b!35279) bm!436))

(assert (= (and d!10202 res!30117) b!35283))

(assert (= (and b!35283 res!30121) b!35280))

(assert (= (and b!35280 res!30120) b!35278))

(assert (= (and b!35278 res!30116) b!35282))

(assert (= (and b!35282 res!30119) b!35281))

(assert (= (and b!35281 res!30118) b!35276))

(declare-fun m!52859 () Bool)

(assert (=> b!35281 m!52859))

(declare-fun m!52861 () Bool)

(assert (=> b!35281 m!52861))

(declare-fun m!52863 () Bool)

(assert (=> b!35281 m!52863))

(declare-fun m!52865 () Bool)

(assert (=> b!35281 m!52865))

(declare-fun m!52867 () Bool)

(assert (=> b!35281 m!52867))

(declare-fun m!52869 () Bool)

(assert (=> bm!436 m!52869))

(declare-fun m!52871 () Bool)

(assert (=> b!35283 m!52871))

(declare-fun m!52873 () Bool)

(assert (=> b!35276 m!52873))

(declare-fun m!52875 () Bool)

(assert (=> d!10202 m!52875))

(assert (=> d!10202 m!52339))

(declare-fun m!52877 () Bool)

(assert (=> d!10202 m!52877))

(declare-fun m!52879 () Bool)

(assert (=> d!10202 m!52879))

(declare-fun m!52881 () Bool)

(assert (=> b!35277 m!52881))

(declare-fun m!52883 () Bool)

(assert (=> b!35277 m!52883))

(assert (=> b!35277 m!52339))

(declare-fun m!52885 () Bool)

(assert (=> b!35277 m!52885))

(declare-fun m!52887 () Bool)

(assert (=> b!35277 m!52887))

(declare-fun m!52889 () Bool)

(assert (=> b!35277 m!52889))

(declare-fun m!52891 () Bool)

(assert (=> b!35277 m!52891))

(declare-fun m!52893 () Bool)

(assert (=> b!35277 m!52893))

(declare-fun m!52895 () Bool)

(assert (=> b!35277 m!52895))

(assert (=> b!35277 m!52883))

(declare-fun m!52897 () Bool)

(assert (=> b!35277 m!52897))

(declare-fun m!52899 () Bool)

(assert (=> b!35277 m!52899))

(declare-fun m!52901 () Bool)

(assert (=> b!35277 m!52901))

(declare-fun m!52903 () Bool)

(assert (=> b!35277 m!52903))

(declare-fun m!52905 () Bool)

(assert (=> b!35277 m!52905))

(declare-fun m!52907 () Bool)

(assert (=> b!35277 m!52907))

(declare-fun m!52909 () Bool)

(assert (=> b!35277 m!52909))

(declare-fun m!52911 () Bool)

(assert (=> b!35277 m!52911))

(declare-fun m!52913 () Bool)

(assert (=> b!35277 m!52913))

(declare-fun m!52915 () Bool)

(assert (=> b!35277 m!52915))

(declare-fun m!52917 () Bool)

(assert (=> b!35277 m!52917))

(declare-fun m!52919 () Bool)

(assert (=> b!35277 m!52919))

(declare-fun m!52921 () Bool)

(assert (=> b!35277 m!52921))

(declare-fun m!52923 () Bool)

(assert (=> b!35277 m!52923))

(declare-fun m!52925 () Bool)

(assert (=> b!35277 m!52925))

(declare-fun m!52927 () Bool)

(assert (=> b!35277 m!52927))

(declare-fun m!52929 () Bool)

(assert (=> b!35277 m!52929))

(declare-fun m!52931 () Bool)

(assert (=> b!35277 m!52931))

(declare-fun m!52933 () Bool)

(assert (=> b!35277 m!52933))

(declare-fun m!52935 () Bool)

(assert (=> b!35277 m!52935))

(declare-fun m!52937 () Bool)

(assert (=> b!35277 m!52937))

(declare-fun m!52939 () Bool)

(assert (=> b!35277 m!52939))

(assert (=> b!35277 m!52891))

(assert (=> b!35277 m!52911))

(assert (=> b!35277 m!52881))

(declare-fun m!52941 () Bool)

(assert (=> b!35277 m!52941))

(declare-fun m!52943 () Bool)

(assert (=> b!35279 m!52943))

(declare-fun m!52945 () Bool)

(assert (=> b!35279 m!52945))

(declare-fun m!52947 () Bool)

(assert (=> b!35278 m!52947))

(assert (=> b!34942 d!10202))

(declare-fun b!35294 () Bool)

(declare-fun res!30128 () Bool)

(declare-fun e!23318 () Bool)

(assert (=> b!35294 (=> (not res!30128) (not e!23318))))

(declare-fun lt!52597 () tuple2!3504)

(assert (=> b!35294 (= res!30128 (isPrefixOf!0 (_2!1839 lt!52597) (_2!1838 lt!51936)))))

(declare-fun b!35295 () Bool)

(declare-fun e!23319 () Unit!2585)

(declare-fun Unit!2598 () Unit!2585)

(assert (=> b!35295 (= e!23319 Unit!2598)))

(declare-fun b!35296 () Bool)

(declare-fun lt!52607 () Unit!2585)

(assert (=> b!35296 (= e!23319 lt!52607)))

(declare-fun lt!52610 () (_ BitVec 64))

(assert (=> b!35296 (= lt!52610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52599 () (_ BitVec 64))

(assert (=> b!35296 (= lt!52599 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1892 array!1892 (_ BitVec 64) (_ BitVec 64)) Unit!2585)

(assert (=> b!35296 (= lt!52607 (arrayBitRangesEqSymmetric!0 (buf!1169 thiss!1379) (buf!1169 (_2!1838 lt!51936)) lt!52610 lt!52599))))

(assert (=> b!35296 (arrayBitRangesEq!0 (buf!1169 (_2!1838 lt!51936)) (buf!1169 thiss!1379) lt!52610 lt!52599)))

(declare-fun d!10294 () Bool)

(assert (=> d!10294 e!23318))

(declare-fun res!30129 () Bool)

(assert (=> d!10294 (=> (not res!30129) (not e!23318))))

(assert (=> d!10294 (= res!30129 (isPrefixOf!0 (_1!1839 lt!52597) (_2!1839 lt!52597)))))

(declare-fun lt!52608 () BitStream!1462)

(assert (=> d!10294 (= lt!52597 (tuple2!3505 lt!52608 (_2!1838 lt!51936)))))

(declare-fun lt!52609 () Unit!2585)

(declare-fun lt!52611 () Unit!2585)

(assert (=> d!10294 (= lt!52609 lt!52611)))

(assert (=> d!10294 (isPrefixOf!0 lt!52608 (_2!1838 lt!51936))))

(assert (=> d!10294 (= lt!52611 (lemmaIsPrefixTransitive!0 lt!52608 (_2!1838 lt!51936) (_2!1838 lt!51936)))))

(declare-fun lt!52592 () Unit!2585)

(declare-fun lt!52594 () Unit!2585)

(assert (=> d!10294 (= lt!52592 lt!52594)))

(assert (=> d!10294 (isPrefixOf!0 lt!52608 (_2!1838 lt!51936))))

(assert (=> d!10294 (= lt!52594 (lemmaIsPrefixTransitive!0 lt!52608 thiss!1379 (_2!1838 lt!51936)))))

(declare-fun lt!52593 () Unit!2585)

(assert (=> d!10294 (= lt!52593 e!23319)))

(declare-fun c!2383 () Bool)

(assert (=> d!10294 (= c!2383 (not (= (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!52602 () Unit!2585)

(declare-fun lt!52601 () Unit!2585)

(assert (=> d!10294 (= lt!52602 lt!52601)))

(assert (=> d!10294 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51936))))

(assert (=> d!10294 (= lt!52601 (lemmaIsPrefixRefl!0 (_2!1838 lt!51936)))))

(declare-fun lt!52604 () Unit!2585)

(declare-fun lt!52596 () Unit!2585)

(assert (=> d!10294 (= lt!52604 lt!52596)))

(assert (=> d!10294 (= lt!52596 (lemmaIsPrefixRefl!0 (_2!1838 lt!51936)))))

(declare-fun lt!52605 () Unit!2585)

(declare-fun lt!52606 () Unit!2585)

(assert (=> d!10294 (= lt!52605 lt!52606)))

(assert (=> d!10294 (isPrefixOf!0 lt!52608 lt!52608)))

(assert (=> d!10294 (= lt!52606 (lemmaIsPrefixRefl!0 lt!52608))))

(declare-fun lt!52603 () Unit!2585)

(declare-fun lt!52600 () Unit!2585)

(assert (=> d!10294 (= lt!52603 lt!52600)))

(assert (=> d!10294 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10294 (= lt!52600 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10294 (= lt!52608 (BitStream!1463 (buf!1169 (_2!1838 lt!51936)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (=> d!10294 (isPrefixOf!0 thiss!1379 (_2!1838 lt!51936))))

(assert (=> d!10294 (= (reader!0 thiss!1379 (_2!1838 lt!51936)) lt!52597)))

(declare-fun b!35297 () Bool)

(declare-fun res!30130 () Bool)

(assert (=> b!35297 (=> (not res!30130) (not e!23318))))

(assert (=> b!35297 (= res!30130 (isPrefixOf!0 (_1!1839 lt!52597) thiss!1379))))

(declare-fun lt!52598 () (_ BitVec 64))

(declare-fun lt!52595 () (_ BitVec 64))

(declare-fun b!35298 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1462 (_ BitVec 64)) BitStream!1462)

(assert (=> b!35298 (= e!23318 (= (_1!1839 lt!52597) (withMovedBitIndex!0 (_2!1839 lt!52597) (bvsub lt!52595 lt!52598))))))

(assert (=> b!35298 (or (= (bvand lt!52595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52598 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52595 lt!52598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35298 (= lt!52598 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> b!35298 (= lt!52595 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (= (and d!10294 c!2383) b!35296))

(assert (= (and d!10294 (not c!2383)) b!35295))

(assert (= (and d!10294 res!30129) b!35297))

(assert (= (and b!35297 res!30130) b!35294))

(assert (= (and b!35294 res!30128) b!35298))

(declare-fun m!52949 () Bool)

(assert (=> b!35294 m!52949))

(assert (=> b!35296 m!52337))

(declare-fun m!52951 () Bool)

(assert (=> b!35296 m!52951))

(declare-fun m!52953 () Bool)

(assert (=> b!35296 m!52953))

(declare-fun m!52955 () Bool)

(assert (=> b!35297 m!52955))

(assert (=> d!10294 m!52877))

(assert (=> d!10294 m!52335))

(declare-fun m!52957 () Bool)

(assert (=> d!10294 m!52957))

(declare-fun m!52959 () Bool)

(assert (=> d!10294 m!52959))

(assert (=> d!10294 m!52333))

(declare-fun m!52961 () Bool)

(assert (=> d!10294 m!52961))

(assert (=> d!10294 m!52309))

(declare-fun m!52963 () Bool)

(assert (=> d!10294 m!52963))

(declare-fun m!52965 () Bool)

(assert (=> d!10294 m!52965))

(declare-fun m!52967 () Bool)

(assert (=> d!10294 m!52967))

(assert (=> d!10294 m!52879))

(declare-fun m!52969 () Bool)

(assert (=> b!35298 m!52969))

(assert (=> b!35298 m!52339))

(assert (=> b!35298 m!52337))

(assert (=> b!34942 d!10294))

(declare-fun d!10296 () Bool)

(declare-fun res!30131 () Bool)

(declare-fun e!23320 () Bool)

(assert (=> d!10296 (=> (not res!30131) (not e!23320))))

(assert (=> d!10296 (= res!30131 (= (size!841 (buf!1169 (_2!1838 lt!51936))) (size!841 (buf!1169 (_2!1838 lt!51934)))))))

(assert (=> d!10296 (= (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51934)) e!23320)))

(declare-fun b!35299 () Bool)

(declare-fun res!30133 () Bool)

(assert (=> b!35299 (=> (not res!30133) (not e!23320))))

(assert (=> b!35299 (= res!30133 (bvsle (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))) (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934)))))))

(declare-fun b!35300 () Bool)

(declare-fun e!23321 () Bool)

(assert (=> b!35300 (= e!23320 e!23321)))

(declare-fun res!30132 () Bool)

(assert (=> b!35300 (=> res!30132 e!23321)))

(assert (=> b!35300 (= res!30132 (= (size!841 (buf!1169 (_2!1838 lt!51936))) #b00000000000000000000000000000000))))

(declare-fun b!35301 () Bool)

(assert (=> b!35301 (= e!23321 (arrayBitRangesEq!0 (buf!1169 (_2!1838 lt!51936)) (buf!1169 (_2!1838 lt!51934)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936)))))))

(assert (= (and d!10296 res!30131) b!35299))

(assert (= (and b!35299 res!30133) b!35300))

(assert (= (and b!35300 (not res!30132)) b!35301))

(assert (=> b!35299 m!52339))

(assert (=> b!35299 m!52327))

(assert (=> b!35301 m!52339))

(assert (=> b!35301 m!52339))

(declare-fun m!52971 () Bool)

(assert (=> b!35301 m!52971))

(assert (=> b!34942 d!10296))

(declare-fun d!10298 () Bool)

(assert (=> d!10298 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52614 () Unit!2585)

(declare-fun choose!9 (BitStream!1462 array!1892 (_ BitVec 64) BitStream!1462) Unit!2585)

(assert (=> d!10298 (= lt!52614 (choose!9 thiss!1379 (buf!1169 (_2!1838 lt!51936)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1463 (buf!1169 (_2!1838 lt!51936)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(assert (=> d!10298 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1169 (_2!1838 lt!51936)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52614)))

(declare-fun bs!2784 () Bool)

(assert (= bs!2784 d!10298))

(assert (=> bs!2784 m!52357))

(declare-fun m!52973 () Bool)

(assert (=> bs!2784 m!52973))

(assert (=> b!34942 d!10298))

(declare-fun d!10300 () Bool)

(assert (=> d!10300 (isPrefixOf!0 thiss!1379 (_2!1838 lt!51934))))

(declare-fun lt!52617 () Unit!2585)

(declare-fun choose!30 (BitStream!1462 BitStream!1462 BitStream!1462) Unit!2585)

(assert (=> d!10300 (= lt!52617 (choose!30 thiss!1379 (_2!1838 lt!51936) (_2!1838 lt!51934)))))

(assert (=> d!10300 (isPrefixOf!0 thiss!1379 (_2!1838 lt!51936))))

(assert (=> d!10300 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1838 lt!51936) (_2!1838 lt!51934)) lt!52617)))

(declare-fun bs!2785 () Bool)

(assert (= bs!2785 d!10300))

(assert (=> bs!2785 m!52355))

(declare-fun m!52975 () Bool)

(assert (=> bs!2785 m!52975))

(assert (=> bs!2785 m!52309))

(assert (=> b!34942 d!10300))

(declare-fun d!10302 () Bool)

(assert (=> d!10302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2786 () Bool)

(assert (= bs!2786 d!10302))

(declare-fun m!52977 () Bool)

(assert (=> bs!2786 m!52977))

(assert (=> b!34942 d!10302))

(declare-fun d!10304 () Bool)

(declare-fun res!30134 () Bool)

(declare-fun e!23322 () Bool)

(assert (=> d!10304 (=> (not res!30134) (not e!23322))))

(assert (=> d!10304 (= res!30134 (= (size!841 (buf!1169 thiss!1379)) (size!841 (buf!1169 (_2!1838 lt!51934)))))))

(assert (=> d!10304 (= (isPrefixOf!0 thiss!1379 (_2!1838 lt!51934)) e!23322)))

(declare-fun b!35302 () Bool)

(declare-fun res!30136 () Bool)

(assert (=> b!35302 (=> (not res!30136) (not e!23322))))

(assert (=> b!35302 (= res!30136 (bvsle (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)) (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934)))))))

(declare-fun b!35303 () Bool)

(declare-fun e!23323 () Bool)

(assert (=> b!35303 (= e!23322 e!23323)))

(declare-fun res!30135 () Bool)

(assert (=> b!35303 (=> res!30135 e!23323)))

(assert (=> b!35303 (= res!30135 (= (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35304 () Bool)

(assert (=> b!35304 (= e!23323 (arrayBitRangesEq!0 (buf!1169 thiss!1379) (buf!1169 (_2!1838 lt!51934)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(assert (= (and d!10304 res!30134) b!35302))

(assert (= (and b!35302 res!30136) b!35303))

(assert (= (and b!35303 (not res!30135)) b!35304))

(assert (=> b!35302 m!52337))

(assert (=> b!35302 m!52327))

(assert (=> b!35304 m!52337))

(assert (=> b!35304 m!52337))

(declare-fun m!52979 () Bool)

(assert (=> b!35304 m!52979))

(assert (=> b!34942 d!10304))

(declare-fun d!10306 () Bool)

(assert (=> d!10306 (= (tail!149 lt!51928) (t!1182 lt!51928))))

(assert (=> b!34940 d!10306))

(declare-fun d!10308 () Bool)

(declare-fun e!23326 () Bool)

(assert (=> d!10308 e!23326))

(declare-fun res!30139 () Bool)

(assert (=> d!10308 (=> (not res!30139) (not e!23326))))

(declare-fun lt!52623 () (_ BitVec 64))

(assert (=> d!10308 (= res!30139 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!52623) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10308 (= lt!52623 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52622 () Unit!2585)

(declare-fun choose!42 (BitStream!1462 BitStream!1462 BitStream!1462 BitStream!1462 (_ BitVec 64) List!432) Unit!2585)

(assert (=> d!10308 (= lt!52622 (choose!42 (_2!1838 lt!51934) (_2!1838 lt!51934) (_1!1839 lt!51937) (_1!1839 lt!51946) (bvsub to!314 i!635) lt!51928))))

(assert (=> d!10308 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10308 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1838 lt!51934) (_2!1838 lt!51934) (_1!1839 lt!51937) (_1!1839 lt!51946) (bvsub to!314 i!635) lt!51928) lt!52622)))

(declare-fun b!35307 () Bool)

(assert (=> b!35307 (= e!23326 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_1!1839 lt!51946) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!149 lt!51928)))))

(assert (= (and d!10308 res!30139) b!35307))

(declare-fun m!52981 () Bool)

(assert (=> d!10308 m!52981))

(declare-fun m!52983 () Bool)

(assert (=> b!35307 m!52983))

(assert (=> b!35307 m!52315))

(assert (=> b!34940 d!10308))

(declare-fun d!10310 () Bool)

(declare-fun e!23329 () Bool)

(assert (=> d!10310 e!23329))

(declare-fun res!30144 () Bool)

(assert (=> d!10310 (=> (not res!30144) (not e!23329))))

(declare-fun lt!52636 () (_ BitVec 64))

(declare-fun lt!52637 () (_ BitVec 64))

(declare-fun lt!52638 () (_ BitVec 64))

(assert (=> d!10310 (= res!30144 (= lt!52636 (bvsub lt!52637 lt!52638)))))

(assert (=> d!10310 (or (= (bvand lt!52637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52638 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52637 lt!52638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10310 (= lt!52638 (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51934))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51934)))))))

(declare-fun lt!52639 () (_ BitVec 64))

(declare-fun lt!52641 () (_ BitVec 64))

(assert (=> d!10310 (= lt!52637 (bvmul lt!52639 lt!52641))))

(assert (=> d!10310 (or (= lt!52639 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52641 (bvsdiv (bvmul lt!52639 lt!52641) lt!52639)))))

(assert (=> d!10310 (= lt!52641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10310 (= lt!52639 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))))))

(assert (=> d!10310 (= lt!52636 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51934))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51934)))))))

(assert (=> d!10310 (invariant!0 (currentBit!2543 (_2!1838 lt!51934)) (currentByte!2548 (_2!1838 lt!51934)) (size!841 (buf!1169 (_2!1838 lt!51934))))))

(assert (=> d!10310 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934))) lt!52636)))

(declare-fun b!35312 () Bool)

(declare-fun res!30145 () Bool)

(assert (=> b!35312 (=> (not res!30145) (not e!23329))))

(assert (=> b!35312 (= res!30145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52636))))

(declare-fun b!35313 () Bool)

(declare-fun lt!52640 () (_ BitVec 64))

(assert (=> b!35313 (= e!23329 (bvsle lt!52636 (bvmul lt!52640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35313 (or (= lt!52640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52640)))))

(assert (=> b!35313 (= lt!52640 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))))))

(assert (= (and d!10310 res!30144) b!35312))

(assert (= (and b!35312 res!30145) b!35313))

(declare-fun m!52985 () Bool)

(assert (=> d!10310 m!52985))

(assert (=> d!10310 m!52379))

(assert (=> b!34951 d!10310))

(declare-fun d!10312 () Bool)

(assert (=> d!10312 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!51949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936)))) lt!51949))))

(declare-fun bs!2787 () Bool)

(assert (= bs!2787 d!10312))

(declare-fun m!52987 () Bool)

(assert (=> bs!2787 m!52987))

(assert (=> b!34941 d!10312))

(declare-fun b!35314 () Bool)

(declare-fun res!30146 () Bool)

(declare-fun e!23330 () Bool)

(assert (=> b!35314 (=> (not res!30146) (not e!23330))))

(declare-fun lt!52647 () tuple2!3504)

(assert (=> b!35314 (= res!30146 (isPrefixOf!0 (_2!1839 lt!52647) (_2!1838 lt!51934)))))

(declare-fun b!35315 () Bool)

(declare-fun e!23331 () Unit!2585)

(declare-fun Unit!2599 () Unit!2585)

(assert (=> b!35315 (= e!23331 Unit!2599)))

(declare-fun b!35316 () Bool)

(declare-fun lt!52657 () Unit!2585)

(assert (=> b!35316 (= e!23331 lt!52657)))

(declare-fun lt!52660 () (_ BitVec 64))

(assert (=> b!35316 (= lt!52660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52649 () (_ BitVec 64))

(assert (=> b!35316 (= lt!52649 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> b!35316 (= lt!52657 (arrayBitRangesEqSymmetric!0 (buf!1169 (_2!1838 lt!51936)) (buf!1169 (_2!1838 lt!51934)) lt!52660 lt!52649))))

(assert (=> b!35316 (arrayBitRangesEq!0 (buf!1169 (_2!1838 lt!51934)) (buf!1169 (_2!1838 lt!51936)) lt!52660 lt!52649)))

(declare-fun d!10314 () Bool)

(assert (=> d!10314 e!23330))

(declare-fun res!30147 () Bool)

(assert (=> d!10314 (=> (not res!30147) (not e!23330))))

(assert (=> d!10314 (= res!30147 (isPrefixOf!0 (_1!1839 lt!52647) (_2!1839 lt!52647)))))

(declare-fun lt!52658 () BitStream!1462)

(assert (=> d!10314 (= lt!52647 (tuple2!3505 lt!52658 (_2!1838 lt!51934)))))

(declare-fun lt!52659 () Unit!2585)

(declare-fun lt!52661 () Unit!2585)

(assert (=> d!10314 (= lt!52659 lt!52661)))

(assert (=> d!10314 (isPrefixOf!0 lt!52658 (_2!1838 lt!51934))))

(assert (=> d!10314 (= lt!52661 (lemmaIsPrefixTransitive!0 lt!52658 (_2!1838 lt!51934) (_2!1838 lt!51934)))))

(declare-fun lt!52642 () Unit!2585)

(declare-fun lt!52644 () Unit!2585)

(assert (=> d!10314 (= lt!52642 lt!52644)))

(assert (=> d!10314 (isPrefixOf!0 lt!52658 (_2!1838 lt!51934))))

(assert (=> d!10314 (= lt!52644 (lemmaIsPrefixTransitive!0 lt!52658 (_2!1838 lt!51936) (_2!1838 lt!51934)))))

(declare-fun lt!52643 () Unit!2585)

(assert (=> d!10314 (= lt!52643 e!23331)))

(declare-fun c!2384 () Bool)

(assert (=> d!10314 (= c!2384 (not (= (size!841 (buf!1169 (_2!1838 lt!51936))) #b00000000000000000000000000000000)))))

(declare-fun lt!52652 () Unit!2585)

(declare-fun lt!52651 () Unit!2585)

(assert (=> d!10314 (= lt!52652 lt!52651)))

(assert (=> d!10314 (isPrefixOf!0 (_2!1838 lt!51934) (_2!1838 lt!51934))))

(assert (=> d!10314 (= lt!52651 (lemmaIsPrefixRefl!0 (_2!1838 lt!51934)))))

(declare-fun lt!52654 () Unit!2585)

(declare-fun lt!52646 () Unit!2585)

(assert (=> d!10314 (= lt!52654 lt!52646)))

(assert (=> d!10314 (= lt!52646 (lemmaIsPrefixRefl!0 (_2!1838 lt!51934)))))

(declare-fun lt!52655 () Unit!2585)

(declare-fun lt!52656 () Unit!2585)

(assert (=> d!10314 (= lt!52655 lt!52656)))

(assert (=> d!10314 (isPrefixOf!0 lt!52658 lt!52658)))

(assert (=> d!10314 (= lt!52656 (lemmaIsPrefixRefl!0 lt!52658))))

(declare-fun lt!52653 () Unit!2585)

(declare-fun lt!52650 () Unit!2585)

(assert (=> d!10314 (= lt!52653 lt!52650)))

(assert (=> d!10314 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51936))))

(assert (=> d!10314 (= lt!52650 (lemmaIsPrefixRefl!0 (_2!1838 lt!51936)))))

(assert (=> d!10314 (= lt!52658 (BitStream!1463 (buf!1169 (_2!1838 lt!51934)) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (=> d!10314 (isPrefixOf!0 (_2!1838 lt!51936) (_2!1838 lt!51934))))

(assert (=> d!10314 (= (reader!0 (_2!1838 lt!51936) (_2!1838 lt!51934)) lt!52647)))

(declare-fun b!35317 () Bool)

(declare-fun res!30148 () Bool)

(assert (=> b!35317 (=> (not res!30148) (not e!23330))))

(assert (=> b!35317 (= res!30148 (isPrefixOf!0 (_1!1839 lt!52647) (_2!1838 lt!51936)))))

(declare-fun b!35318 () Bool)

(declare-fun lt!52645 () (_ BitVec 64))

(declare-fun lt!52648 () (_ BitVec 64))

(assert (=> b!35318 (= e!23330 (= (_1!1839 lt!52647) (withMovedBitIndex!0 (_2!1839 lt!52647) (bvsub lt!52645 lt!52648))))))

(assert (=> b!35318 (or (= (bvand lt!52645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52645 lt!52648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35318 (= lt!52648 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934))))))

(assert (=> b!35318 (= lt!52645 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))))))

(assert (= (and d!10314 c!2384) b!35316))

(assert (= (and d!10314 (not c!2384)) b!35315))

(assert (= (and d!10314 res!30147) b!35317))

(assert (= (and b!35317 res!30148) b!35314))

(assert (= (and b!35314 res!30146) b!35318))

(declare-fun m!52989 () Bool)

(assert (=> b!35314 m!52989))

(assert (=> b!35316 m!52339))

(declare-fun m!52991 () Bool)

(assert (=> b!35316 m!52991))

(declare-fun m!52993 () Bool)

(assert (=> b!35316 m!52993))

(declare-fun m!52995 () Bool)

(assert (=> b!35317 m!52995))

(declare-fun m!52997 () Bool)

(assert (=> d!10314 m!52997))

(assert (=> d!10314 m!52879))

(declare-fun m!52999 () Bool)

(assert (=> d!10314 m!52999))

(declare-fun m!53001 () Bool)

(assert (=> d!10314 m!53001))

(assert (=> d!10314 m!52877))

(declare-fun m!53003 () Bool)

(assert (=> d!10314 m!53003))

(assert (=> d!10314 m!52353))

(declare-fun m!53005 () Bool)

(assert (=> d!10314 m!53005))

(declare-fun m!53007 () Bool)

(assert (=> d!10314 m!53007))

(declare-fun m!53009 () Bool)

(assert (=> d!10314 m!53009))

(declare-fun m!53011 () Bool)

(assert (=> d!10314 m!53011))

(declare-fun m!53013 () Bool)

(assert (=> b!35318 m!53013))

(assert (=> b!35318 m!52327))

(assert (=> b!35318 m!52339))

(assert (=> b!34941 d!10314))

(declare-fun d!10316 () Bool)

(assert (=> d!10316 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936))) lt!51949)))

(declare-fun lt!52662 () Unit!2585)

(assert (=> d!10316 (= lt!52662 (choose!9 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!51934)) lt!51949 (BitStream!1463 (buf!1169 (_2!1838 lt!51934)) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936)))))))

(assert (=> d!10316 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1838 lt!51936) (buf!1169 (_2!1838 lt!51934)) lt!51949) lt!52662)))

(declare-fun bs!2788 () Bool)

(assert (= bs!2788 d!10316))

(assert (=> bs!2788 m!52369))

(declare-fun m!53015 () Bool)

(assert (=> bs!2788 m!53015))

(assert (=> b!34941 d!10316))

(declare-fun b!35319 () Bool)

(declare-fun res!30149 () Bool)

(declare-fun e!23332 () Bool)

(assert (=> b!35319 (=> (not res!30149) (not e!23332))))

(declare-fun lt!52668 () tuple2!3504)

(assert (=> b!35319 (= res!30149 (isPrefixOf!0 (_2!1839 lt!52668) (_2!1838 lt!51934)))))

(declare-fun b!35320 () Bool)

(declare-fun e!23333 () Unit!2585)

(declare-fun Unit!2600 () Unit!2585)

(assert (=> b!35320 (= e!23333 Unit!2600)))

(declare-fun b!35321 () Bool)

(declare-fun lt!52678 () Unit!2585)

(assert (=> b!35321 (= e!23333 lt!52678)))

(declare-fun lt!52681 () (_ BitVec 64))

(assert (=> b!35321 (= lt!52681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52670 () (_ BitVec 64))

(assert (=> b!35321 (= lt!52670 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (=> b!35321 (= lt!52678 (arrayBitRangesEqSymmetric!0 (buf!1169 thiss!1379) (buf!1169 (_2!1838 lt!51934)) lt!52681 lt!52670))))

(assert (=> b!35321 (arrayBitRangesEq!0 (buf!1169 (_2!1838 lt!51934)) (buf!1169 thiss!1379) lt!52681 lt!52670)))

(declare-fun d!10318 () Bool)

(assert (=> d!10318 e!23332))

(declare-fun res!30150 () Bool)

(assert (=> d!10318 (=> (not res!30150) (not e!23332))))

(assert (=> d!10318 (= res!30150 (isPrefixOf!0 (_1!1839 lt!52668) (_2!1839 lt!52668)))))

(declare-fun lt!52679 () BitStream!1462)

(assert (=> d!10318 (= lt!52668 (tuple2!3505 lt!52679 (_2!1838 lt!51934)))))

(declare-fun lt!52680 () Unit!2585)

(declare-fun lt!52682 () Unit!2585)

(assert (=> d!10318 (= lt!52680 lt!52682)))

(assert (=> d!10318 (isPrefixOf!0 lt!52679 (_2!1838 lt!51934))))

(assert (=> d!10318 (= lt!52682 (lemmaIsPrefixTransitive!0 lt!52679 (_2!1838 lt!51934) (_2!1838 lt!51934)))))

(declare-fun lt!52663 () Unit!2585)

(declare-fun lt!52665 () Unit!2585)

(assert (=> d!10318 (= lt!52663 lt!52665)))

(assert (=> d!10318 (isPrefixOf!0 lt!52679 (_2!1838 lt!51934))))

(assert (=> d!10318 (= lt!52665 (lemmaIsPrefixTransitive!0 lt!52679 thiss!1379 (_2!1838 lt!51934)))))

(declare-fun lt!52664 () Unit!2585)

(assert (=> d!10318 (= lt!52664 e!23333)))

(declare-fun c!2385 () Bool)

(assert (=> d!10318 (= c!2385 (not (= (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!52673 () Unit!2585)

(declare-fun lt!52672 () Unit!2585)

(assert (=> d!10318 (= lt!52673 lt!52672)))

(assert (=> d!10318 (isPrefixOf!0 (_2!1838 lt!51934) (_2!1838 lt!51934))))

(assert (=> d!10318 (= lt!52672 (lemmaIsPrefixRefl!0 (_2!1838 lt!51934)))))

(declare-fun lt!52675 () Unit!2585)

(declare-fun lt!52667 () Unit!2585)

(assert (=> d!10318 (= lt!52675 lt!52667)))

(assert (=> d!10318 (= lt!52667 (lemmaIsPrefixRefl!0 (_2!1838 lt!51934)))))

(declare-fun lt!52676 () Unit!2585)

(declare-fun lt!52677 () Unit!2585)

(assert (=> d!10318 (= lt!52676 lt!52677)))

(assert (=> d!10318 (isPrefixOf!0 lt!52679 lt!52679)))

(assert (=> d!10318 (= lt!52677 (lemmaIsPrefixRefl!0 lt!52679))))

(declare-fun lt!52674 () Unit!2585)

(declare-fun lt!52671 () Unit!2585)

(assert (=> d!10318 (= lt!52674 lt!52671)))

(assert (=> d!10318 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10318 (= lt!52671 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10318 (= lt!52679 (BitStream!1463 (buf!1169 (_2!1838 lt!51934)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (=> d!10318 (isPrefixOf!0 thiss!1379 (_2!1838 lt!51934))))

(assert (=> d!10318 (= (reader!0 thiss!1379 (_2!1838 lt!51934)) lt!52668)))

(declare-fun b!35322 () Bool)

(declare-fun res!30151 () Bool)

(assert (=> b!35322 (=> (not res!30151) (not e!23332))))

(assert (=> b!35322 (= res!30151 (isPrefixOf!0 (_1!1839 lt!52668) thiss!1379))))

(declare-fun b!35323 () Bool)

(declare-fun lt!52666 () (_ BitVec 64))

(declare-fun lt!52669 () (_ BitVec 64))

(assert (=> b!35323 (= e!23332 (= (_1!1839 lt!52668) (withMovedBitIndex!0 (_2!1839 lt!52668) (bvsub lt!52666 lt!52669))))))

(assert (=> b!35323 (or (= (bvand lt!52666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52666 lt!52669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35323 (= lt!52669 (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51934))) (currentByte!2548 (_2!1838 lt!51934)) (currentBit!2543 (_2!1838 lt!51934))))))

(assert (=> b!35323 (= lt!52666 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)))))

(assert (= (and d!10318 c!2385) b!35321))

(assert (= (and d!10318 (not c!2385)) b!35320))

(assert (= (and d!10318 res!30150) b!35322))

(assert (= (and b!35322 res!30151) b!35319))

(assert (= (and b!35319 res!30149) b!35323))

(declare-fun m!53017 () Bool)

(assert (=> b!35319 m!53017))

(assert (=> b!35321 m!52337))

(declare-fun m!53019 () Bool)

(assert (=> b!35321 m!53019))

(declare-fun m!53021 () Bool)

(assert (=> b!35321 m!53021))

(declare-fun m!53023 () Bool)

(assert (=> b!35322 m!53023))

(assert (=> d!10318 m!52997))

(assert (=> d!10318 m!52335))

(declare-fun m!53025 () Bool)

(assert (=> d!10318 m!53025))

(declare-fun m!53027 () Bool)

(assert (=> d!10318 m!53027))

(assert (=> d!10318 m!52333))

(declare-fun m!53029 () Bool)

(assert (=> d!10318 m!53029))

(assert (=> d!10318 m!52355))

(declare-fun m!53031 () Bool)

(assert (=> d!10318 m!53031))

(declare-fun m!53033 () Bool)

(assert (=> d!10318 m!53033))

(declare-fun m!53035 () Bool)

(assert (=> d!10318 m!53035))

(assert (=> d!10318 m!53011))

(declare-fun m!53037 () Bool)

(assert (=> b!35323 m!53037))

(assert (=> b!35323 m!52327))

(assert (=> b!35323 m!52337))

(assert (=> b!34941 d!10318))

(declare-fun b!35334 () Bool)

(declare-fun e!23338 () Bool)

(declare-fun lt!52691 () List!432)

(declare-fun isEmpty!97 (List!432) Bool)

(assert (=> b!35334 (= e!23338 (isEmpty!97 lt!52691))))

(declare-fun lt!52689 () (_ BitVec 64))

(declare-fun b!35333 () Bool)

(declare-datatypes ((tuple2!3526 0))(
  ( (tuple2!3527 (_1!1850 List!432) (_2!1850 BitStream!1462)) )
))
(declare-fun e!23339 () tuple2!3526)

(declare-datatypes ((tuple2!3528 0))(
  ( (tuple2!3529 (_1!1851 Bool) (_2!1851 BitStream!1462)) )
))
(declare-fun lt!52690 () tuple2!3528)

(assert (=> b!35333 (= e!23339 (tuple2!3527 (Cons!428 (_1!1851 lt!52690) (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_2!1851 lt!52690) (bvsub (bvsub to!314 i!635) lt!52689))) (_2!1851 lt!52690)))))

(declare-fun readBit!0 (BitStream!1462) tuple2!3528)

(assert (=> b!35333 (= lt!52690 (readBit!0 (_1!1839 lt!51937)))))

(assert (=> b!35333 (= lt!52689 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35332 () Bool)

(assert (=> b!35332 (= e!23339 (tuple2!3527 Nil!429 (_1!1839 lt!51937)))))

(declare-fun b!35335 () Bool)

(assert (=> b!35335 (= e!23338 (> (length!158 lt!52691) 0))))

(declare-fun d!10320 () Bool)

(assert (=> d!10320 e!23338))

(declare-fun c!2391 () Bool)

(assert (=> d!10320 (= c!2391 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10320 (= lt!52691 (_1!1850 e!23339))))

(declare-fun c!2390 () Bool)

(assert (=> d!10320 (= c!2390 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10320 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10320 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_1!1839 lt!51937) (bvsub to!314 i!635)) lt!52691)))

(assert (= (and d!10320 c!2390) b!35332))

(assert (= (and d!10320 (not c!2390)) b!35333))

(assert (= (and d!10320 c!2391) b!35334))

(assert (= (and d!10320 (not c!2391)) b!35335))

(declare-fun m!53039 () Bool)

(assert (=> b!35334 m!53039))

(declare-fun m!53041 () Bool)

(assert (=> b!35333 m!53041))

(declare-fun m!53043 () Bool)

(assert (=> b!35333 m!53043))

(declare-fun m!53045 () Bool)

(assert (=> b!35335 m!53045))

(assert (=> b!34941 d!10320))

(declare-fun d!10322 () Bool)

(assert (=> d!10322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2789 () Bool)

(assert (= bs!2789 d!10322))

(declare-fun m!53047 () Bool)

(assert (=> bs!2789 m!53047))

(assert (=> b!34941 d!10322))

(declare-fun b!35338 () Bool)

(declare-fun e!23340 () Bool)

(declare-fun lt!52694 () List!432)

(assert (=> b!35338 (= e!23340 (isEmpty!97 lt!52694))))

(declare-fun b!35337 () Bool)

(declare-fun e!23341 () tuple2!3526)

(declare-fun lt!52693 () tuple2!3528)

(declare-fun lt!52692 () (_ BitVec 64))

(assert (=> b!35337 (= e!23341 (tuple2!3527 (Cons!428 (_1!1851 lt!52693) (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_2!1851 lt!52693) (bvsub lt!51949 lt!52692))) (_2!1851 lt!52693)))))

(assert (=> b!35337 (= lt!52693 (readBit!0 (_1!1839 lt!51946)))))

(assert (=> b!35337 (= lt!52692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35336 () Bool)

(assert (=> b!35336 (= e!23341 (tuple2!3527 Nil!429 (_1!1839 lt!51946)))))

(declare-fun b!35339 () Bool)

(assert (=> b!35339 (= e!23340 (> (length!158 lt!52694) 0))))

(declare-fun d!10324 () Bool)

(assert (=> d!10324 e!23340))

(declare-fun c!2393 () Bool)

(assert (=> d!10324 (= c!2393 (= lt!51949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10324 (= lt!52694 (_1!1850 e!23341))))

(declare-fun c!2392 () Bool)

(assert (=> d!10324 (= c!2392 (= lt!51949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10324 (bvsge lt!51949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10324 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!51934) (_1!1839 lt!51946) lt!51949) lt!52694)))

(assert (= (and d!10324 c!2392) b!35336))

(assert (= (and d!10324 (not c!2392)) b!35337))

(assert (= (and d!10324 c!2393) b!35338))

(assert (= (and d!10324 (not c!2393)) b!35339))

(declare-fun m!53049 () Bool)

(assert (=> b!35338 m!53049))

(declare-fun m!53051 () Bool)

(assert (=> b!35337 m!53051))

(declare-fun m!53053 () Bool)

(assert (=> b!35337 m!53053))

(declare-fun m!53055 () Bool)

(assert (=> b!35339 m!53055))

(assert (=> b!34941 d!10324))

(declare-fun d!10326 () Bool)

(assert (=> d!10326 (validate_offset_bits!1 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51934)))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!52695 () Unit!2585)

(assert (=> d!10326 (= lt!52695 (choose!9 thiss!1379 (buf!1169 (_2!1838 lt!51934)) (bvsub to!314 i!635) (BitStream!1463 (buf!1169 (_2!1838 lt!51934)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(assert (=> d!10326 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1169 (_2!1838 lt!51934)) (bvsub to!314 i!635)) lt!52695)))

(declare-fun bs!2790 () Bool)

(assert (= bs!2790 d!10326))

(assert (=> bs!2790 m!52365))

(declare-fun m!53057 () Bool)

(assert (=> bs!2790 m!53057))

(assert (=> b!34941 d!10326))

(declare-fun d!10328 () Bool)

(declare-fun size!844 (List!432) Int)

(assert (=> d!10328 (= (length!158 lt!51928) (size!844 lt!51928))))

(declare-fun bs!2791 () Bool)

(assert (= bs!2791 d!10328))

(declare-fun m!53059 () Bool)

(assert (=> bs!2791 m!53059))

(assert (=> b!34944 d!10328))

(declare-fun d!10330 () Bool)

(assert (=> d!10330 (= (head!269 (byteArrayBitContentToList!0 (_2!1838 lt!51934) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!547 (byteArrayBitContentToList!0 (_2!1838 lt!51934) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!34955 d!10330))

(declare-fun d!10332 () Bool)

(declare-fun c!2396 () Bool)

(assert (=> d!10332 (= c!2396 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23344 () List!432)

(assert (=> d!10332 (= (byteArrayBitContentToList!0 (_2!1838 lt!51934) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23344)))

(declare-fun b!35344 () Bool)

(assert (=> b!35344 (= e!23344 Nil!429)))

(declare-fun b!35345 () Bool)

(assert (=> b!35345 (= e!23344 (Cons!428 (not (= (bvand ((_ sign_extend 24) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1838 lt!51934) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10332 c!2396) b!35344))

(assert (= (and d!10332 (not c!2396)) b!35345))

(assert (=> b!35345 m!52307))

(assert (=> b!35345 m!52625))

(declare-fun m!53061 () Bool)

(assert (=> b!35345 m!53061))

(assert (=> b!34955 d!10332))

(declare-fun d!10334 () Bool)

(assert (=> d!10334 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2792 () Bool)

(assert (= bs!2792 d!10334))

(assert (=> bs!2792 m!52307))

(assert (=> bs!2792 m!52625))

(assert (=> b!34955 d!10334))

(declare-fun d!10336 () Bool)

(declare-fun e!23345 () Bool)

(assert (=> d!10336 e!23345))

(declare-fun res!30152 () Bool)

(assert (=> d!10336 (=> (not res!30152) (not e!23345))))

(declare-fun lt!52696 () (_ BitVec 64))

(declare-fun lt!52697 () (_ BitVec 64))

(declare-fun lt!52698 () (_ BitVec 64))

(assert (=> d!10336 (= res!30152 (= lt!52696 (bvsub lt!52697 lt!52698)))))

(assert (=> d!10336 (or (= (bvand lt!52697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52697 lt!52698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10336 (= lt!52698 (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))) ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936)))))))

(declare-fun lt!52699 () (_ BitVec 64))

(declare-fun lt!52701 () (_ BitVec 64))

(assert (=> d!10336 (= lt!52697 (bvmul lt!52699 lt!52701))))

(assert (=> d!10336 (or (= lt!52699 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52701 (bvsdiv (bvmul lt!52699 lt!52701) lt!52699)))))

(assert (=> d!10336 (= lt!52701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10336 (= lt!52699 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))))))

(assert (=> d!10336 (= lt!52696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2548 (_2!1838 lt!51936))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2543 (_2!1838 lt!51936)))))))

(assert (=> d!10336 (invariant!0 (currentBit!2543 (_2!1838 lt!51936)) (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51936))))))

(assert (=> d!10336 (= (bitIndex!0 (size!841 (buf!1169 (_2!1838 lt!51936))) (currentByte!2548 (_2!1838 lt!51936)) (currentBit!2543 (_2!1838 lt!51936))) lt!52696)))

(declare-fun b!35346 () Bool)

(declare-fun res!30153 () Bool)

(assert (=> b!35346 (=> (not res!30153) (not e!23345))))

(assert (=> b!35346 (= res!30153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52696))))

(declare-fun b!35347 () Bool)

(declare-fun lt!52700 () (_ BitVec 64))

(assert (=> b!35347 (= e!23345 (bvsle lt!52696 (bvmul lt!52700 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35347 (or (= lt!52700 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52700 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52700)))))

(assert (=> b!35347 (= lt!52700 ((_ sign_extend 32) (size!841 (buf!1169 (_2!1838 lt!51936)))))))

(assert (= (and d!10336 res!30152) b!35346))

(assert (= (and b!35346 res!30153) b!35347))

(assert (=> d!10336 m!52599))

(assert (=> d!10336 m!52395))

(assert (=> b!34945 d!10336))

(declare-fun d!10338 () Bool)

(assert (=> d!10338 (= (array_inv!784 (buf!1169 thiss!1379)) (bvsge (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!34943 d!10338))

(declare-fun d!10340 () Bool)

(assert (=> d!10340 (= (bitAt!0 (buf!1169 (_2!1838 lt!51934)) lt!51929) (not (= (bvand ((_ sign_extend 24) (select (arr!1322 (buf!1169 (_2!1838 lt!51934))) ((_ extract 31 0) (bvsdiv lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!51929 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2793 () Bool)

(assert (= bs!2793 d!10340))

(declare-fun m!53063 () Bool)

(assert (=> bs!2793 m!53063))

(assert (=> bs!2793 m!52595))

(assert (=> b!34954 d!10340))

(declare-fun d!10342 () Bool)

(assert (=> d!10342 (= (bitAt!0 (buf!1169 (_2!1838 lt!51936)) lt!51929) (bitAt!0 (buf!1169 (_2!1838 lt!51934)) lt!51929))))

(declare-fun lt!52704 () Unit!2585)

(declare-fun choose!31 (array!1892 array!1892 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2585)

(assert (=> d!10342 (= lt!52704 (choose!31 (buf!1169 (_2!1838 lt!51936)) (buf!1169 (_2!1838 lt!51934)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51929 lt!51948))))

(assert (=> d!10342 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51948))))

(assert (=> d!10342 (= (arrayBitRangesEqImpliesEq!0 (buf!1169 (_2!1838 lt!51936)) (buf!1169 (_2!1838 lt!51934)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51929 lt!51948) lt!52704)))

(declare-fun bs!2794 () Bool)

(assert (= bs!2794 d!10342))

(assert (=> bs!2794 m!52393))

(assert (=> bs!2794 m!52397))

(declare-fun m!53065 () Bool)

(assert (=> bs!2794 m!53065))

(assert (=> b!34954 d!10342))

(declare-fun d!10344 () Bool)

(assert (=> d!10344 (= (invariant!0 (currentBit!2543 (_2!1838 lt!51936)) (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51936)))) (and (bvsge (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (bvslt (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000001000) (bvsge (currentByte!2548 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51936)))) (and (= (currentBit!2543 (_2!1838 lt!51936)) #b00000000000000000000000000000000) (= (currentByte!2548 (_2!1838 lt!51936)) (size!841 (buf!1169 (_2!1838 lt!51936))))))))))

(assert (=> b!34947 d!10344))

(declare-fun d!10346 () Bool)

(declare-fun res!30154 () Bool)

(declare-fun e!23346 () Bool)

(assert (=> d!10346 (=> (not res!30154) (not e!23346))))

(assert (=> d!10346 (= res!30154 (= (size!841 (buf!1169 thiss!1379)) (size!841 (buf!1169 thiss!1379))))))

(assert (=> d!10346 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23346)))

(declare-fun b!35348 () Bool)

(declare-fun res!30156 () Bool)

(assert (=> b!35348 (=> (not res!30156) (not e!23346))))

(assert (=> b!35348 (= res!30156 (bvsle (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)) (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(declare-fun b!35349 () Bool)

(declare-fun e!23347 () Bool)

(assert (=> b!35349 (= e!23346 e!23347)))

(declare-fun res!30155 () Bool)

(assert (=> b!35349 (=> res!30155 e!23347)))

(assert (=> b!35349 (= res!30155 (= (size!841 (buf!1169 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35350 () Bool)

(assert (=> b!35350 (= e!23347 (arrayBitRangesEq!0 (buf!1169 thiss!1379) (buf!1169 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379))))))

(assert (= (and d!10346 res!30154) b!35348))

(assert (= (and b!35348 res!30156) b!35349))

(assert (= (and b!35349 (not res!30155)) b!35350))

(assert (=> b!35348 m!52337))

(assert (=> b!35348 m!52337))

(assert (=> b!35350 m!52337))

(assert (=> b!35350 m!52337))

(declare-fun m!53067 () Bool)

(assert (=> b!35350 m!53067))

(assert (=> b!34956 d!10346))

(declare-fun d!10348 () Bool)

(assert (=> d!10348 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!52707 () Unit!2585)

(declare-fun choose!11 (BitStream!1462) Unit!2585)

(assert (=> d!10348 (= lt!52707 (choose!11 thiss!1379))))

(assert (=> d!10348 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!52707)))

(declare-fun bs!2796 () Bool)

(assert (= bs!2796 d!10348))

(assert (=> bs!2796 m!52333))

(declare-fun m!53069 () Bool)

(assert (=> bs!2796 m!53069))

(assert (=> b!34956 d!10348))

(declare-fun d!10350 () Bool)

(declare-fun e!23348 () Bool)

(assert (=> d!10350 e!23348))

(declare-fun res!30157 () Bool)

(assert (=> d!10350 (=> (not res!30157) (not e!23348))))

(declare-fun lt!52709 () (_ BitVec 64))

(declare-fun lt!52708 () (_ BitVec 64))

(declare-fun lt!52710 () (_ BitVec 64))

(assert (=> d!10350 (= res!30157 (= lt!52708 (bvsub lt!52709 lt!52710)))))

(assert (=> d!10350 (or (= (bvand lt!52709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52709 lt!52710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10350 (= lt!52710 (remainingBits!0 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))) ((_ sign_extend 32) (currentByte!2548 thiss!1379)) ((_ sign_extend 32) (currentBit!2543 thiss!1379))))))

(declare-fun lt!52711 () (_ BitVec 64))

(declare-fun lt!52713 () (_ BitVec 64))

(assert (=> d!10350 (= lt!52709 (bvmul lt!52711 lt!52713))))

(assert (=> d!10350 (or (= lt!52711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52713 (bvsdiv (bvmul lt!52711 lt!52713) lt!52711)))))

(assert (=> d!10350 (= lt!52713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10350 (= lt!52711 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))))))

(assert (=> d!10350 (= lt!52708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2548 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2543 thiss!1379))))))

(assert (=> d!10350 (invariant!0 (currentBit!2543 thiss!1379) (currentByte!2548 thiss!1379) (size!841 (buf!1169 thiss!1379)))))

(assert (=> d!10350 (= (bitIndex!0 (size!841 (buf!1169 thiss!1379)) (currentByte!2548 thiss!1379) (currentBit!2543 thiss!1379)) lt!52708)))

(declare-fun b!35351 () Bool)

(declare-fun res!30158 () Bool)

(assert (=> b!35351 (=> (not res!30158) (not e!23348))))

(assert (=> b!35351 (= res!30158 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52708))))

(declare-fun b!35352 () Bool)

(declare-fun lt!52712 () (_ BitVec 64))

(assert (=> b!35352 (= e!23348 (bvsle lt!52708 (bvmul lt!52712 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35352 (or (= lt!52712 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52712 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52712)))))

(assert (=> b!35352 (= lt!52712 ((_ sign_extend 32) (size!841 (buf!1169 thiss!1379))))))

(assert (= (and d!10350 res!30157) b!35351))

(assert (= (and b!35351 res!30158) b!35352))

(assert (=> d!10350 m!52651))

(assert (=> d!10350 m!52649))

(assert (=> b!34956 d!10350))

(declare-fun d!10352 () Bool)

(assert (=> d!10352 (= (invariant!0 (currentBit!2543 (_2!1838 lt!51934)) (currentByte!2548 (_2!1838 lt!51934)) (size!841 (buf!1169 (_2!1838 lt!51934)))) (and (bvsge (currentBit!2543 (_2!1838 lt!51934)) #b00000000000000000000000000000000) (bvslt (currentBit!2543 (_2!1838 lt!51934)) #b00000000000000000000000000001000) (bvsge (currentByte!2548 (_2!1838 lt!51934)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2548 (_2!1838 lt!51934)) (size!841 (buf!1169 (_2!1838 lt!51934)))) (and (= (currentBit!2543 (_2!1838 lt!51934)) #b00000000000000000000000000000000) (= (currentByte!2548 (_2!1838 lt!51934)) (size!841 (buf!1169 (_2!1838 lt!51934))))))))))

(assert (=> b!34946 d!10352))

(declare-fun d!10354 () Bool)

(assert (=> d!10354 (= (head!269 (byteArrayBitContentToList!0 (_2!1838 lt!51936) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!547 (byteArrayBitContentToList!0 (_2!1838 lt!51936) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34957 d!10354))

(declare-fun d!10356 () Bool)

(declare-fun c!2397 () Bool)

(assert (=> d!10356 (= c!2397 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23349 () List!432)

(assert (=> d!10356 (= (byteArrayBitContentToList!0 (_2!1838 lt!51936) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23349)))

(declare-fun b!35353 () Bool)

(assert (=> b!35353 (= e!23349 Nil!429)))

(declare-fun b!35354 () Bool)

(assert (=> b!35354 (= e!23349 (Cons!428 (not (= (bvand ((_ sign_extend 24) (select (arr!1322 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1838 lt!51936) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10356 c!2397) b!35353))

(assert (= (and d!10356 (not c!2397)) b!35354))

(assert (=> b!35354 m!52307))

(assert (=> b!35354 m!52625))

(declare-fun m!53071 () Bool)

(assert (=> b!35354 m!53071))

(assert (=> b!34957 d!10356))

(declare-fun d!10358 () Bool)

(assert (=> d!10358 (= (head!269 (bitStreamReadBitsIntoList!0 (_2!1838 lt!51936) (_1!1839 lt!51932) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!547 (bitStreamReadBitsIntoList!0 (_2!1838 lt!51936) (_1!1839 lt!51932) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34957 d!10358))

(declare-fun b!35357 () Bool)

(declare-fun e!23350 () Bool)

(declare-fun lt!52716 () List!432)

(assert (=> b!35357 (= e!23350 (isEmpty!97 lt!52716))))

(declare-fun lt!52714 () (_ BitVec 64))

(declare-fun lt!52715 () tuple2!3528)

(declare-fun b!35356 () Bool)

(declare-fun e!23351 () tuple2!3526)

(assert (=> b!35356 (= e!23351 (tuple2!3527 (Cons!428 (_1!1851 lt!52715) (bitStreamReadBitsIntoList!0 (_2!1838 lt!51936) (_2!1851 lt!52715) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!52714))) (_2!1851 lt!52715)))))

(assert (=> b!35356 (= lt!52715 (readBit!0 (_1!1839 lt!51932)))))

(assert (=> b!35356 (= lt!52714 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35355 () Bool)

(assert (=> b!35355 (= e!23351 (tuple2!3527 Nil!429 (_1!1839 lt!51932)))))

(declare-fun b!35358 () Bool)

(assert (=> b!35358 (= e!23350 (> (length!158 lt!52716) 0))))

(declare-fun d!10360 () Bool)

(assert (=> d!10360 e!23350))

(declare-fun c!2399 () Bool)

(assert (=> d!10360 (= c!2399 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10360 (= lt!52716 (_1!1850 e!23351))))

(declare-fun c!2398 () Bool)

(assert (=> d!10360 (= c!2398 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10360 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10360 (= (bitStreamReadBitsIntoList!0 (_2!1838 lt!51936) (_1!1839 lt!51932) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52716)))

(assert (= (and d!10360 c!2398) b!35355))

(assert (= (and d!10360 (not c!2398)) b!35356))

(assert (= (and d!10360 c!2399) b!35357))

(assert (= (and d!10360 (not c!2399)) b!35358))

(declare-fun m!53073 () Bool)

(assert (=> b!35357 m!53073))

(declare-fun m!53075 () Bool)

(assert (=> b!35356 m!53075))

(declare-fun m!53077 () Bool)

(assert (=> b!35356 m!53077))

(declare-fun m!53079 () Bool)

(assert (=> b!35358 m!53079))

(assert (=> b!34957 d!10360))

(push 1)

(assert (not d!10302))

(assert (not d!10170))

(assert (not d!10166))

(assert (not b!35279))

(assert (not b!35316))

(assert (not d!10310))

(assert (not b!35298))

(assert (not b!35128))

(assert (not b!35334))

(assert (not b!35345))

(assert (not b!35277))

(assert (not b!35086))

(assert (not b!35302))

(assert (not d!10300))

(assert (not d!10348))

(assert (not d!10322))

(assert (not d!10190))

(assert (not bm!436))

(assert (not b!35089))

(assert (not b!35319))

(assert (not d!10318))

(assert (not b!35322))

(assert (not b!35321))

(assert (not b!35323))

(assert (not b!35133))

(assert (not b!35357))

(assert (not d!10312))

(assert (not d!10314))

(assert (not d!10336))

(assert (not d!10168))

(assert (not b!35130))

(assert (not b!35317))

(assert (not d!10350))

(assert (not b!35307))

(assert (not d!10298))

(assert (not b!35335))

(assert (not b!35276))

(assert (not b!35283))

(assert (not b!35281))

(assert (not b!35134))

(assert (not b!35131))

(assert (not b!35299))

(assert (not b!35318))

(assert (not d!10326))

(assert (not b!35301))

(assert (not d!10342))

(assert (not d!10308))

(assert (not b!35278))

(assert (not b!35348))

(assert (not b!35354))

(assert (not b!35084))

(assert (not b!35304))

(assert (not d!10316))

(assert (not b!35356))

(assert (not b!35296))

(assert (not b!35338))

(assert (not b!35129))

(assert (not b!35297))

(assert (not b!35350))

(assert (not b!35337))

(assert (not b!35339))

(assert (not d!10194))

(assert (not d!10202))

(assert (not d!10328))

(assert (not b!35358))

(assert (not b!35135))

(assert (not d!10294))

(assert (not b!35314))

(assert (not b!35294))

(assert (not b!35132))

(assert (not b!35333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

