; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6762 () Bool)

(assert start!6762)

(declare-fun b!31953 () Bool)

(declare-fun res!27371 () Bool)

(declare-fun e!21185 () Bool)

(assert (=> b!31953 (=> res!27371 e!21185)))

(declare-datatypes ((array!1815 0))(
  ( (array!1816 (arr!1270 (Array (_ BitVec 32) (_ BitVec 8))) (size!798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1394 0))(
  ( (BitStream!1395 (buf!1126 array!1815) (currentByte!2487 (_ BitVec 32)) (currentBit!2482 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2427 0))(
  ( (Unit!2428) )
))
(declare-datatypes ((tuple2!3294 0))(
  ( (tuple2!3295 (_1!1734 Unit!2427) (_2!1734 BitStream!1394)) )
))
(declare-fun lt!47038 () tuple2!3294)

(declare-fun lt!47034 () tuple2!3294)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31953 (= res!27371 (not (invariant!0 (currentBit!2482 (_2!1734 lt!47038)) (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47034))))))))

(declare-fun b!31954 () Bool)

(declare-fun e!21179 () Bool)

(declare-fun lt!47036 () (_ BitVec 64))

(assert (=> b!31954 (= e!21179 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47036) (bvslt lt!47036 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038))))))))))

(declare-fun b!31955 () Bool)

(declare-fun e!21186 () Bool)

(declare-fun thiss!1379 () BitStream!1394)

(declare-fun array_inv!750 (array!1815) Bool)

(assert (=> b!31955 (= e!21186 (array_inv!750 (buf!1126 thiss!1379)))))

(declare-fun b!31956 () Bool)

(declare-fun e!21178 () Bool)

(declare-fun e!21187 () Bool)

(assert (=> b!31956 (= e!21178 e!21187)))

(declare-fun res!27365 () Bool)

(assert (=> b!31956 (=> res!27365 e!21187)))

(declare-fun isPrefixOf!0 (BitStream!1394 BitStream!1394) Bool)

(assert (=> b!31956 (= res!27365 (not (isPrefixOf!0 thiss!1379 (_2!1734 lt!47038))))))

(declare-fun lt!47046 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31956 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!47046)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!31956 (= lt!47046 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47041 () Unit!2427)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1394 BitStream!1394 (_ BitVec 64) (_ BitVec 64)) Unit!2427)

(assert (=> b!31956 (= lt!47041 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1734 lt!47038) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1815)

(declare-fun appendBitFromByte!0 (BitStream!1394 (_ BitVec 8) (_ BitVec 32)) tuple2!3294)

(assert (=> b!31956 (= lt!47038 (appendBitFromByte!0 thiss!1379 (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!31957 () Bool)

(declare-fun res!27363 () Bool)

(declare-fun e!21177 () Bool)

(assert (=> b!31957 (=> (not res!27363) (not e!21177))))

(assert (=> b!31957 (= res!27363 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31958 () Bool)

(declare-fun e!21183 () Bool)

(assert (=> b!31958 (= e!21185 e!21183)))

(declare-fun res!27370 () Bool)

(assert (=> b!31958 (=> res!27370 e!21183)))

(assert (=> b!31958 (= res!27370 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3296 0))(
  ( (tuple2!3297 (_1!1735 BitStream!1394) (_2!1735 BitStream!1394)) )
))
(declare-fun lt!47029 () tuple2!3296)

(declare-datatypes ((List!398 0))(
  ( (Nil!395) (Cons!394 (h!513 Bool) (t!1148 List!398)) )
))
(declare-fun lt!47045 () List!398)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1394 BitStream!1394 (_ BitVec 64)) List!398)

(assert (=> b!31958 (= lt!47045 (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_1!1735 lt!47029) lt!47046))))

(declare-fun lt!47030 () List!398)

(declare-fun lt!47039 () tuple2!3296)

(assert (=> b!31958 (= lt!47030 (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_1!1735 lt!47039) (bvsub to!314 i!635)))))

(assert (=> b!31958 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!47046)))

(declare-fun lt!47043 () Unit!2427)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1394 array!1815 (_ BitVec 64)) Unit!2427)

(assert (=> b!31958 (= lt!47043 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!47034)) lt!47046))))

(declare-fun reader!0 (BitStream!1394 BitStream!1394) tuple2!3296)

(assert (=> b!31958 (= lt!47029 (reader!0 (_2!1734 lt!47038) (_2!1734 lt!47034)))))

(assert (=> b!31958 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!47035 () Unit!2427)

(assert (=> b!31958 (= lt!47035 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1126 (_2!1734 lt!47034)) (bvsub to!314 i!635)))))

(assert (=> b!31958 (= lt!47039 (reader!0 thiss!1379 (_2!1734 lt!47034)))))

(declare-fun b!31959 () Bool)

(declare-fun res!27360 () Bool)

(assert (=> b!31959 (=> res!27360 e!21185)))

(assert (=> b!31959 (= res!27360 (not (invariant!0 (currentBit!2482 (_2!1734 lt!47038)) (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47038))))))))

(declare-fun res!27364 () Bool)

(assert (=> start!6762 (=> (not res!27364) (not e!21177))))

(assert (=> start!6762 (= res!27364 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!798 srcBuffer!2))))))))

(assert (=> start!6762 e!21177))

(assert (=> start!6762 true))

(assert (=> start!6762 (array_inv!750 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1394) Bool)

(assert (=> start!6762 (and (inv!12 thiss!1379) e!21186)))

(declare-fun b!31960 () Bool)

(declare-fun res!27368 () Bool)

(assert (=> b!31960 (=> res!27368 e!21179)))

(declare-fun head!235 (List!398) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1394 array!1815 (_ BitVec 64) (_ BitVec 64)) List!398)

(declare-fun bitAt!0 (array!1815 (_ BitVec 64)) Bool)

(assert (=> b!31960 (= res!27368 (not (= (head!235 (byteArrayBitContentToList!0 (_2!1734 lt!47034) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun b!31961 () Bool)

(declare-fun e!21181 () Bool)

(assert (=> b!31961 (= e!21181 e!21179)))

(declare-fun res!27375 () Bool)

(assert (=> b!31961 (=> res!27375 e!21179)))

(declare-fun lt!47044 () Bool)

(assert (=> b!31961 (= res!27375 (not (= lt!47044 (bitAt!0 (buf!1126 (_1!1735 lt!47029)) lt!47036))))))

(assert (=> b!31961 (= lt!47044 (bitAt!0 (buf!1126 (_1!1735 lt!47039)) lt!47036))))

(declare-fun e!21189 () Bool)

(declare-fun lt!47031 () tuple2!3296)

(declare-fun b!31962 () Bool)

(assert (=> b!31962 (= e!21189 (= (head!235 (byteArrayBitContentToList!0 (_2!1734 lt!47038) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!235 (bitStreamReadBitsIntoList!0 (_2!1734 lt!47038) (_1!1735 lt!47031) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31963 () Bool)

(declare-fun e!21184 () Bool)

(assert (=> b!31963 (= e!21187 e!21184)))

(declare-fun res!27374 () Bool)

(assert (=> b!31963 (=> res!27374 e!21184)))

(assert (=> b!31963 (= res!27374 (not (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47034))))))

(assert (=> b!31963 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47034))))

(declare-fun lt!47037 () Unit!2427)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1394 BitStream!1394 BitStream!1394) Unit!2427)

(assert (=> b!31963 (= lt!47037 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1734 lt!47038) (_2!1734 lt!47034)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1394 array!1815 (_ BitVec 64) (_ BitVec 64)) tuple2!3294)

(assert (=> b!31963 (= lt!47034 (appendBitsMSBFirstLoop!0 (_2!1734 lt!47038) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31963 e!21189))

(declare-fun res!27358 () Bool)

(assert (=> b!31963 (=> (not res!27358) (not e!21189))))

(assert (=> b!31963 (= res!27358 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47033 () Unit!2427)

(assert (=> b!31963 (= lt!47033 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1126 (_2!1734 lt!47038)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!31963 (= lt!47031 (reader!0 thiss!1379 (_2!1734 lt!47038)))))

(declare-fun b!31964 () Bool)

(declare-fun res!27369 () Bool)

(assert (=> b!31964 (=> res!27369 e!21179)))

(assert (=> b!31964 (= res!27369 (not (= (head!235 lt!47030) lt!47044)))))

(declare-fun b!31965 () Bool)

(assert (=> b!31965 (= e!21183 e!21181)))

(declare-fun res!27367 () Bool)

(assert (=> b!31965 (=> res!27367 e!21181)))

(declare-fun lt!47042 () List!398)

(assert (=> b!31965 (= res!27367 (not (= lt!47042 lt!47045)))))

(assert (=> b!31965 (= lt!47045 lt!47042)))

(declare-fun tail!115 (List!398) List!398)

(assert (=> b!31965 (= lt!47042 (tail!115 lt!47030))))

(declare-fun lt!47047 () Unit!2427)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1394 BitStream!1394 BitStream!1394 BitStream!1394 (_ BitVec 64) List!398) Unit!2427)

(assert (=> b!31965 (= lt!47047 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1734 lt!47034) (_2!1734 lt!47034) (_1!1735 lt!47039) (_1!1735 lt!47029) (bvsub to!314 i!635) lt!47030))))

(declare-fun b!31966 () Bool)

(assert (=> b!31966 (= e!21177 (not e!21178))))

(declare-fun res!27362 () Bool)

(assert (=> b!31966 (=> res!27362 e!21178)))

(assert (=> b!31966 (= res!27362 (bvsge i!635 to!314))))

(assert (=> b!31966 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!47040 () Unit!2427)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1394) Unit!2427)

(assert (=> b!31966 (= lt!47040 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31966 (= lt!47036 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(declare-fun b!31967 () Bool)

(declare-fun res!27361 () Bool)

(declare-fun e!21190 () Bool)

(assert (=> b!31967 (=> res!27361 e!21190)))

(assert (=> b!31967 (= res!27361 (not (invariant!0 (currentBit!2482 (_2!1734 lt!47034)) (currentByte!2487 (_2!1734 lt!47034)) (size!798 (buf!1126 (_2!1734 lt!47034))))))))

(declare-fun b!31968 () Bool)

(assert (=> b!31968 (= e!21190 e!21185)))

(declare-fun res!27366 () Bool)

(assert (=> b!31968 (=> res!27366 e!21185)))

(assert (=> b!31968 (= res!27366 (not (= (size!798 (buf!1126 (_2!1734 lt!47038))) (size!798 (buf!1126 (_2!1734 lt!47034))))))))

(declare-fun e!21180 () Bool)

(assert (=> b!31968 e!21180))

(declare-fun res!27372 () Bool)

(assert (=> b!31968 (=> (not res!27372) (not e!21180))))

(assert (=> b!31968 (= res!27372 (= (size!798 (buf!1126 (_2!1734 lt!47034))) (size!798 (buf!1126 thiss!1379))))))

(declare-fun b!31969 () Bool)

(assert (=> b!31969 (= e!21184 e!21190)))

(declare-fun res!27373 () Bool)

(assert (=> b!31969 (=> res!27373 e!21190)))

(declare-fun lt!47032 () (_ BitVec 64))

(assert (=> b!31969 (= res!27373 (not (= lt!47032 (bvsub (bvadd lt!47036 to!314) i!635))))))

(assert (=> b!31969 (= lt!47032 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034))))))

(declare-fun b!31970 () Bool)

(declare-fun res!27357 () Bool)

(assert (=> b!31970 (=> res!27357 e!21183)))

(declare-fun length!124 (List!398) Int)

(assert (=> b!31970 (= res!27357 (<= (length!124 lt!47030) 0))))

(declare-fun b!31971 () Bool)

(assert (=> b!31971 (= e!21180 (= lt!47032 (bvsub (bvsub (bvadd (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31972 () Bool)

(declare-fun res!27359 () Bool)

(assert (=> b!31972 (=> res!27359 e!21190)))

(assert (=> b!31972 (= res!27359 (not (= (size!798 (buf!1126 thiss!1379)) (size!798 (buf!1126 (_2!1734 lt!47034))))))))

(assert (= (and start!6762 res!27364) b!31957))

(assert (= (and b!31957 res!27363) b!31966))

(assert (= (and b!31966 (not res!27362)) b!31956))

(assert (= (and b!31956 (not res!27365)) b!31963))

(assert (= (and b!31963 res!27358) b!31962))

(assert (= (and b!31963 (not res!27374)) b!31969))

(assert (= (and b!31969 (not res!27373)) b!31967))

(assert (= (and b!31967 (not res!27361)) b!31972))

(assert (= (and b!31972 (not res!27359)) b!31968))

(assert (= (and b!31968 res!27372) b!31971))

(assert (= (and b!31968 (not res!27366)) b!31959))

(assert (= (and b!31959 (not res!27360)) b!31953))

(assert (= (and b!31953 (not res!27371)) b!31958))

(assert (= (and b!31958 (not res!27370)) b!31970))

(assert (= (and b!31970 (not res!27357)) b!31965))

(assert (= (and b!31965 (not res!27367)) b!31961))

(assert (= (and b!31961 (not res!27375)) b!31964))

(assert (= (and b!31964 (not res!27369)) b!31960))

(assert (= (and b!31960 (not res!27368)) b!31954))

(assert (= start!6762 b!31955))

(declare-fun m!47085 () Bool)

(assert (=> b!31971 m!47085))

(declare-fun m!47087 () Bool)

(assert (=> b!31963 m!47087))

(declare-fun m!47089 () Bool)

(assert (=> b!31963 m!47089))

(declare-fun m!47091 () Bool)

(assert (=> b!31963 m!47091))

(declare-fun m!47093 () Bool)

(assert (=> b!31963 m!47093))

(declare-fun m!47095 () Bool)

(assert (=> b!31963 m!47095))

(declare-fun m!47097 () Bool)

(assert (=> b!31963 m!47097))

(declare-fun m!47099 () Bool)

(assert (=> b!31963 m!47099))

(declare-fun m!47101 () Bool)

(assert (=> b!31960 m!47101))

(assert (=> b!31960 m!47101))

(declare-fun m!47103 () Bool)

(assert (=> b!31960 m!47103))

(declare-fun m!47105 () Bool)

(assert (=> b!31960 m!47105))

(declare-fun m!47107 () Bool)

(assert (=> b!31958 m!47107))

(declare-fun m!47109 () Bool)

(assert (=> b!31958 m!47109))

(declare-fun m!47111 () Bool)

(assert (=> b!31958 m!47111))

(declare-fun m!47113 () Bool)

(assert (=> b!31958 m!47113))

(declare-fun m!47115 () Bool)

(assert (=> b!31958 m!47115))

(declare-fun m!47117 () Bool)

(assert (=> b!31958 m!47117))

(declare-fun m!47119 () Bool)

(assert (=> b!31958 m!47119))

(declare-fun m!47121 () Bool)

(assert (=> b!31958 m!47121))

(declare-fun m!47123 () Bool)

(assert (=> b!31966 m!47123))

(declare-fun m!47125 () Bool)

(assert (=> b!31966 m!47125))

(declare-fun m!47127 () Bool)

(assert (=> b!31966 m!47127))

(declare-fun m!47129 () Bool)

(assert (=> b!31967 m!47129))

(declare-fun m!47131 () Bool)

(assert (=> b!31959 m!47131))

(declare-fun m!47133 () Bool)

(assert (=> b!31957 m!47133))

(declare-fun m!47135 () Bool)

(assert (=> b!31953 m!47135))

(declare-fun m!47137 () Bool)

(assert (=> b!31955 m!47137))

(declare-fun m!47139 () Bool)

(assert (=> b!31961 m!47139))

(declare-fun m!47141 () Bool)

(assert (=> b!31961 m!47141))

(declare-fun m!47143 () Bool)

(assert (=> start!6762 m!47143))

(declare-fun m!47145 () Bool)

(assert (=> start!6762 m!47145))

(declare-fun m!47147 () Bool)

(assert (=> b!31956 m!47147))

(declare-fun m!47149 () Bool)

(assert (=> b!31956 m!47149))

(declare-fun m!47151 () Bool)

(assert (=> b!31956 m!47151))

(assert (=> b!31956 m!47147))

(declare-fun m!47153 () Bool)

(assert (=> b!31956 m!47153))

(declare-fun m!47155 () Bool)

(assert (=> b!31956 m!47155))

(declare-fun m!47157 () Bool)

(assert (=> b!31965 m!47157))

(declare-fun m!47159 () Bool)

(assert (=> b!31965 m!47159))

(declare-fun m!47161 () Bool)

(assert (=> b!31962 m!47161))

(assert (=> b!31962 m!47161))

(declare-fun m!47163 () Bool)

(assert (=> b!31962 m!47163))

(declare-fun m!47165 () Bool)

(assert (=> b!31962 m!47165))

(assert (=> b!31962 m!47165))

(declare-fun m!47167 () Bool)

(assert (=> b!31962 m!47167))

(declare-fun m!47169 () Bool)

(assert (=> b!31970 m!47169))

(declare-fun m!47171 () Bool)

(assert (=> b!31969 m!47171))

(declare-fun m!47173 () Bool)

(assert (=> b!31964 m!47173))

(push 1)

(assert (not b!31961))

(assert (not start!6762))

(assert (not b!31970))

(assert (not b!31967))

(assert (not b!31964))

(assert (not b!31971))

(assert (not b!31966))

(assert (not b!31963))

(assert (not b!31962))

(assert (not b!31955))

(assert (not b!31969))

(assert (not b!31953))

(assert (not b!31957))

(assert (not b!31956))

(assert (not b!31959))

(assert (not b!31965))

(assert (not b!31958))

(assert (not b!31960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9396 () Bool)

(declare-fun size!801 (List!398) Int)

(assert (=> d!9396 (= (length!124 lt!47030) (size!801 lt!47030))))

(declare-fun bs!2578 () Bool)

(assert (= bs!2578 d!9396))

(declare-fun m!47417 () Bool)

(assert (=> bs!2578 m!47417))

(assert (=> b!31970 d!9396))

(declare-fun d!9398 () Bool)

(assert (=> d!9398 (= (invariant!0 (currentBit!2482 (_2!1734 lt!47038)) (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47038)))) (and (bvsge (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (bvslt (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000001000) (bvsge (currentByte!2487 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47038)))) (and (= (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (= (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47038))))))))))

(assert (=> b!31959 d!9398))

(declare-fun d!9400 () Bool)

(assert (=> d!9400 (= (head!235 (byteArrayBitContentToList!0 (_2!1734 lt!47034) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!513 (byteArrayBitContentToList!0 (_2!1734 lt!47034) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!31960 d!9400))

(declare-fun d!9402 () Bool)

(declare-fun c!2188 () Bool)

(assert (=> d!9402 (= c!2188 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21266 () List!398)

(assert (=> d!9402 (= (byteArrayBitContentToList!0 (_2!1734 lt!47034) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!21266)))

(declare-fun b!32121 () Bool)

(assert (=> b!32121 (= e!21266 Nil!395)))

(declare-fun b!32122 () Bool)

(assert (=> b!32122 (= e!21266 (Cons!394 (not (= (bvand ((_ sign_extend 24) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1734 lt!47034) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9402 c!2188) b!32121))

(assert (= (and d!9402 (not c!2188)) b!32122))

(assert (=> b!32122 m!47147))

(declare-fun m!47419 () Bool)

(assert (=> b!32122 m!47419))

(declare-fun m!47421 () Bool)

(assert (=> b!32122 m!47421))

(assert (=> b!31960 d!9402))

(declare-fun d!9404 () Bool)

(assert (=> d!9404 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2579 () Bool)

(assert (= bs!2579 d!9404))

(assert (=> bs!2579 m!47147))

(assert (=> bs!2579 m!47419))

(assert (=> b!31960 d!9404))

(declare-fun d!9406 () Bool)

(declare-fun e!21269 () Bool)

(assert (=> d!9406 e!21269))

(declare-fun res!27468 () Bool)

(assert (=> d!9406 (=> (not res!27468) (not e!21269))))

(declare-fun lt!47363 () (_ BitVec 64))

(declare-fun lt!47361 () (_ BitVec 64))

(declare-fun lt!47360 () (_ BitVec 64))

(assert (=> d!9406 (= res!27468 (= lt!47360 (bvsub lt!47363 lt!47361)))))

(assert (=> d!9406 (or (= (bvand lt!47363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47361 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47363 lt!47361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9406 (= lt!47361 (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038)))))))

(declare-fun lt!47362 () (_ BitVec 64))

(declare-fun lt!47364 () (_ BitVec 64))

(assert (=> d!9406 (= lt!47363 (bvmul lt!47362 lt!47364))))

(assert (=> d!9406 (or (= lt!47362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47364 (bvsdiv (bvmul lt!47362 lt!47364) lt!47362)))))

(assert (=> d!9406 (= lt!47364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9406 (= lt!47362 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))))))

(assert (=> d!9406 (= lt!47360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038)))))))

(assert (=> d!9406 (invariant!0 (currentBit!2482 (_2!1734 lt!47038)) (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47038))))))

(assert (=> d!9406 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))) lt!47360)))

(declare-fun b!32127 () Bool)

(declare-fun res!27467 () Bool)

(assert (=> b!32127 (=> (not res!27467) (not e!21269))))

(assert (=> b!32127 (= res!27467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47360))))

(declare-fun b!32128 () Bool)

(declare-fun lt!47359 () (_ BitVec 64))

(assert (=> b!32128 (= e!21269 (bvsle lt!47360 (bvmul lt!47359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32128 (or (= lt!47359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47359)))))

(assert (=> b!32128 (= lt!47359 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))))))

(assert (= (and d!9406 res!27468) b!32127))

(assert (= (and b!32127 res!27467) b!32128))

(declare-fun m!47423 () Bool)

(assert (=> d!9406 m!47423))

(assert (=> d!9406 m!47131))

(assert (=> b!31971 d!9406))

(declare-fun d!9408 () Bool)

(assert (=> d!9408 (= (bitAt!0 (buf!1126 (_1!1735 lt!47029)) lt!47036) (not (= (bvand ((_ sign_extend 24) (select (arr!1270 (buf!1126 (_1!1735 lt!47029))) ((_ extract 31 0) (bvsdiv lt!47036 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!47036 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2580 () Bool)

(assert (= bs!2580 d!9408))

(declare-fun m!47425 () Bool)

(assert (=> bs!2580 m!47425))

(declare-fun m!47427 () Bool)

(assert (=> bs!2580 m!47427))

(assert (=> b!31961 d!9408))

(declare-fun d!9410 () Bool)

(assert (=> d!9410 (= (bitAt!0 (buf!1126 (_1!1735 lt!47039)) lt!47036) (not (= (bvand ((_ sign_extend 24) (select (arr!1270 (buf!1126 (_1!1735 lt!47039))) ((_ extract 31 0) (bvsdiv lt!47036 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!47036 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2581 () Bool)

(assert (= bs!2581 d!9410))

(declare-fun m!47429 () Bool)

(assert (=> bs!2581 m!47429))

(assert (=> bs!2581 m!47427))

(assert (=> b!31961 d!9410))

(declare-fun d!9412 () Bool)

(assert (=> d!9412 (= (invariant!0 (currentBit!2482 (_2!1734 lt!47034)) (currentByte!2487 (_2!1734 lt!47034)) (size!798 (buf!1126 (_2!1734 lt!47034)))) (and (bvsge (currentBit!2482 (_2!1734 lt!47034)) #b00000000000000000000000000000000) (bvslt (currentBit!2482 (_2!1734 lt!47034)) #b00000000000000000000000000001000) (bvsge (currentByte!2487 (_2!1734 lt!47034)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2487 (_2!1734 lt!47034)) (size!798 (buf!1126 (_2!1734 lt!47034)))) (and (= (currentBit!2482 (_2!1734 lt!47034)) #b00000000000000000000000000000000) (= (currentByte!2487 (_2!1734 lt!47034)) (size!798 (buf!1126 (_2!1734 lt!47034))))))))))

(assert (=> b!31967 d!9412))

(declare-fun d!9414 () Bool)

(assert (=> d!9414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2582 () Bool)

(assert (= bs!2582 d!9414))

(declare-fun m!47431 () Bool)

(assert (=> bs!2582 m!47431))

(assert (=> b!31957 d!9414))

(declare-fun d!9416 () Bool)

(assert (=> d!9416 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!47367 () Unit!2427)

(declare-fun choose!9 (BitStream!1394 array!1815 (_ BitVec 64) BitStream!1394) Unit!2427)

(assert (=> d!9416 (= lt!47367 (choose!9 thiss!1379 (buf!1126 (_2!1734 lt!47034)) (bvsub to!314 i!635) (BitStream!1395 (buf!1126 (_2!1734 lt!47034)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(assert (=> d!9416 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1126 (_2!1734 lt!47034)) (bvsub to!314 i!635)) lt!47367)))

(declare-fun bs!2583 () Bool)

(assert (= bs!2583 d!9416))

(assert (=> bs!2583 m!47119))

(declare-fun m!47433 () Bool)

(assert (=> bs!2583 m!47433))

(assert (=> b!31958 d!9416))

(declare-fun b!32139 () Bool)

(declare-fun e!21274 () Unit!2427)

(declare-fun Unit!2449 () Unit!2427)

(assert (=> b!32139 (= e!21274 Unit!2449)))

(declare-fun b!32140 () Bool)

(declare-fun res!27476 () Bool)

(declare-fun e!21275 () Bool)

(assert (=> b!32140 (=> (not res!27476) (not e!21275))))

(declare-fun lt!47419 () tuple2!3296)

(assert (=> b!32140 (= res!27476 (isPrefixOf!0 (_1!1735 lt!47419) thiss!1379))))

(declare-fun b!32141 () Bool)

(declare-fun lt!47424 () (_ BitVec 64))

(declare-fun lt!47425 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1394 (_ BitVec 64)) BitStream!1394)

(assert (=> b!32141 (= e!21275 (= (_1!1735 lt!47419) (withMovedBitIndex!0 (_2!1735 lt!47419) (bvsub lt!47424 lt!47425))))))

(assert (=> b!32141 (or (= (bvand lt!47424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47424 lt!47425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32141 (= lt!47425 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034))))))

(assert (=> b!32141 (= lt!47424 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(declare-fun b!32142 () Bool)

(declare-fun lt!47410 () Unit!2427)

(assert (=> b!32142 (= e!21274 lt!47410)))

(declare-fun lt!47412 () (_ BitVec 64))

(assert (=> b!32142 (= lt!47412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47426 () (_ BitVec 64))

(assert (=> b!32142 (= lt!47426 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1815 array!1815 (_ BitVec 64) (_ BitVec 64)) Unit!2427)

(assert (=> b!32142 (= lt!47410 (arrayBitRangesEqSymmetric!0 (buf!1126 thiss!1379) (buf!1126 (_2!1734 lt!47034)) lt!47412 lt!47426))))

(declare-fun arrayBitRangesEq!0 (array!1815 array!1815 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32142 (arrayBitRangesEq!0 (buf!1126 (_2!1734 lt!47034)) (buf!1126 thiss!1379) lt!47412 lt!47426)))

(declare-fun b!32143 () Bool)

(declare-fun res!27477 () Bool)

(assert (=> b!32143 (=> (not res!27477) (not e!21275))))

(assert (=> b!32143 (= res!27477 (isPrefixOf!0 (_2!1735 lt!47419) (_2!1734 lt!47034)))))

(declare-fun d!9418 () Bool)

(assert (=> d!9418 e!21275))

(declare-fun res!27475 () Bool)

(assert (=> d!9418 (=> (not res!27475) (not e!21275))))

(assert (=> d!9418 (= res!27475 (isPrefixOf!0 (_1!1735 lt!47419) (_2!1735 lt!47419)))))

(declare-fun lt!47409 () BitStream!1394)

(assert (=> d!9418 (= lt!47419 (tuple2!3297 lt!47409 (_2!1734 lt!47034)))))

(declare-fun lt!47415 () Unit!2427)

(declare-fun lt!47416 () Unit!2427)

(assert (=> d!9418 (= lt!47415 lt!47416)))

(assert (=> d!9418 (isPrefixOf!0 lt!47409 (_2!1734 lt!47034))))

(assert (=> d!9418 (= lt!47416 (lemmaIsPrefixTransitive!0 lt!47409 (_2!1734 lt!47034) (_2!1734 lt!47034)))))

(declare-fun lt!47418 () Unit!2427)

(declare-fun lt!47422 () Unit!2427)

(assert (=> d!9418 (= lt!47418 lt!47422)))

(assert (=> d!9418 (isPrefixOf!0 lt!47409 (_2!1734 lt!47034))))

(assert (=> d!9418 (= lt!47422 (lemmaIsPrefixTransitive!0 lt!47409 thiss!1379 (_2!1734 lt!47034)))))

(declare-fun lt!47420 () Unit!2427)

(assert (=> d!9418 (= lt!47420 e!21274)))

(declare-fun c!2191 () Bool)

(assert (=> d!9418 (= c!2191 (not (= (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47427 () Unit!2427)

(declare-fun lt!47423 () Unit!2427)

(assert (=> d!9418 (= lt!47427 lt!47423)))

(assert (=> d!9418 (isPrefixOf!0 (_2!1734 lt!47034) (_2!1734 lt!47034))))

(assert (=> d!9418 (= lt!47423 (lemmaIsPrefixRefl!0 (_2!1734 lt!47034)))))

(declare-fun lt!47408 () Unit!2427)

(declare-fun lt!47417 () Unit!2427)

(assert (=> d!9418 (= lt!47408 lt!47417)))

(assert (=> d!9418 (= lt!47417 (lemmaIsPrefixRefl!0 (_2!1734 lt!47034)))))

(declare-fun lt!47413 () Unit!2427)

(declare-fun lt!47411 () Unit!2427)

(assert (=> d!9418 (= lt!47413 lt!47411)))

(assert (=> d!9418 (isPrefixOf!0 lt!47409 lt!47409)))

(assert (=> d!9418 (= lt!47411 (lemmaIsPrefixRefl!0 lt!47409))))

(declare-fun lt!47421 () Unit!2427)

(declare-fun lt!47414 () Unit!2427)

(assert (=> d!9418 (= lt!47421 lt!47414)))

(assert (=> d!9418 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9418 (= lt!47414 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9418 (= lt!47409 (BitStream!1395 (buf!1126 (_2!1734 lt!47034)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(assert (=> d!9418 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47034))))

(assert (=> d!9418 (= (reader!0 thiss!1379 (_2!1734 lt!47034)) lt!47419)))

(assert (= (and d!9418 c!2191) b!32142))

(assert (= (and d!9418 (not c!2191)) b!32139))

(assert (= (and d!9418 res!27475) b!32140))

(assert (= (and b!32140 res!27476) b!32143))

(assert (= (and b!32143 res!27477) b!32141))

(declare-fun m!47435 () Bool)

(assert (=> b!32143 m!47435))

(declare-fun m!47437 () Bool)

(assert (=> b!32140 m!47437))

(declare-fun m!47439 () Bool)

(assert (=> b!32141 m!47439))

(assert (=> b!32141 m!47171))

(assert (=> b!32141 m!47127))

(declare-fun m!47441 () Bool)

(assert (=> d!9418 m!47441))

(declare-fun m!47443 () Bool)

(assert (=> d!9418 m!47443))

(declare-fun m!47445 () Bool)

(assert (=> d!9418 m!47445))

(assert (=> d!9418 m!47125))

(assert (=> d!9418 m!47091))

(declare-fun m!47447 () Bool)

(assert (=> d!9418 m!47447))

(declare-fun m!47449 () Bool)

(assert (=> d!9418 m!47449))

(declare-fun m!47451 () Bool)

(assert (=> d!9418 m!47451))

(assert (=> d!9418 m!47123))

(declare-fun m!47453 () Bool)

(assert (=> d!9418 m!47453))

(declare-fun m!47455 () Bool)

(assert (=> d!9418 m!47455))

(assert (=> b!32142 m!47127))

(declare-fun m!47457 () Bool)

(assert (=> b!32142 m!47457))

(declare-fun m!47459 () Bool)

(assert (=> b!32142 m!47459))

(assert (=> b!31958 d!9418))

(declare-fun d!9420 () Bool)

(assert (=> d!9420 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!47046)))

(declare-fun lt!47428 () Unit!2427)

(assert (=> d!9420 (= lt!47428 (choose!9 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!47034)) lt!47046 (BitStream!1395 (buf!1126 (_2!1734 lt!47034)) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038)))))))

(assert (=> d!9420 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!47034)) lt!47046) lt!47428)))

(declare-fun bs!2584 () Bool)

(assert (= bs!2584 d!9420))

(assert (=> bs!2584 m!47111))

(declare-fun m!47461 () Bool)

(assert (=> bs!2584 m!47461))

(assert (=> b!31958 d!9420))

(declare-fun d!9422 () Bool)

(assert (=> d!9422 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2585 () Bool)

(assert (= bs!2585 d!9422))

(declare-fun m!47463 () Bool)

(assert (=> bs!2585 m!47463))

(assert (=> b!31958 d!9422))

(declare-fun b!32154 () Bool)

(declare-fun e!21281 () Bool)

(declare-fun lt!47436 () List!398)

(declare-fun isEmpty!89 (List!398) Bool)

(assert (=> b!32154 (= e!21281 (isEmpty!89 lt!47436))))

(declare-fun b!32155 () Bool)

(assert (=> b!32155 (= e!21281 (> (length!124 lt!47436) 0))))

(declare-fun d!9424 () Bool)

(assert (=> d!9424 e!21281))

(declare-fun c!2196 () Bool)

(assert (=> d!9424 (= c!2196 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3314 0))(
  ( (tuple2!3315 (_1!1744 List!398) (_2!1744 BitStream!1394)) )
))
(declare-fun e!21280 () tuple2!3314)

(assert (=> d!9424 (= lt!47436 (_1!1744 e!21280))))

(declare-fun c!2197 () Bool)

(assert (=> d!9424 (= c!2197 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9424 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9424 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_1!1735 lt!47039) (bvsub to!314 i!635)) lt!47436)))

(declare-datatypes ((tuple2!3316 0))(
  ( (tuple2!3317 (_1!1745 Bool) (_2!1745 BitStream!1394)) )
))
(declare-fun lt!47437 () tuple2!3316)

(declare-fun b!32153 () Bool)

(declare-fun lt!47435 () (_ BitVec 64))

(assert (=> b!32153 (= e!21280 (tuple2!3315 (Cons!394 (_1!1745 lt!47437) (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_2!1745 lt!47437) (bvsub (bvsub to!314 i!635) lt!47435))) (_2!1745 lt!47437)))))

(declare-fun readBit!0 (BitStream!1394) tuple2!3316)

(assert (=> b!32153 (= lt!47437 (readBit!0 (_1!1735 lt!47039)))))

(assert (=> b!32153 (= lt!47435 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32152 () Bool)

(assert (=> b!32152 (= e!21280 (tuple2!3315 Nil!395 (_1!1735 lt!47039)))))

(assert (= (and d!9424 c!2197) b!32152))

(assert (= (and d!9424 (not c!2197)) b!32153))

(assert (= (and d!9424 c!2196) b!32154))

(assert (= (and d!9424 (not c!2196)) b!32155))

(declare-fun m!47465 () Bool)

(assert (=> b!32154 m!47465))

(declare-fun m!47467 () Bool)

(assert (=> b!32155 m!47467))

(declare-fun m!47469 () Bool)

(assert (=> b!32153 m!47469))

(declare-fun m!47471 () Bool)

(assert (=> b!32153 m!47471))

(assert (=> b!31958 d!9424))

(declare-fun b!32156 () Bool)

(declare-fun e!21282 () Unit!2427)

(declare-fun Unit!2450 () Unit!2427)

(assert (=> b!32156 (= e!21282 Unit!2450)))

(declare-fun b!32157 () Bool)

(declare-fun res!27479 () Bool)

(declare-fun e!21283 () Bool)

(assert (=> b!32157 (=> (not res!27479) (not e!21283))))

(declare-fun lt!47449 () tuple2!3296)

(assert (=> b!32157 (= res!27479 (isPrefixOf!0 (_1!1735 lt!47449) (_2!1734 lt!47038)))))

(declare-fun lt!47455 () (_ BitVec 64))

(declare-fun b!32158 () Bool)

(declare-fun lt!47454 () (_ BitVec 64))

(assert (=> b!32158 (= e!21283 (= (_1!1735 lt!47449) (withMovedBitIndex!0 (_2!1735 lt!47449) (bvsub lt!47454 lt!47455))))))

(assert (=> b!32158 (or (= (bvand lt!47454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47454 lt!47455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32158 (= lt!47455 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034))))))

(assert (=> b!32158 (= lt!47454 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(declare-fun b!32159 () Bool)

(declare-fun lt!47440 () Unit!2427)

(assert (=> b!32159 (= e!21282 lt!47440)))

(declare-fun lt!47442 () (_ BitVec 64))

(assert (=> b!32159 (= lt!47442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47456 () (_ BitVec 64))

(assert (=> b!32159 (= lt!47456 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(assert (=> b!32159 (= lt!47440 (arrayBitRangesEqSymmetric!0 (buf!1126 (_2!1734 lt!47038)) (buf!1126 (_2!1734 lt!47034)) lt!47442 lt!47456))))

(assert (=> b!32159 (arrayBitRangesEq!0 (buf!1126 (_2!1734 lt!47034)) (buf!1126 (_2!1734 lt!47038)) lt!47442 lt!47456)))

(declare-fun b!32160 () Bool)

(declare-fun res!27480 () Bool)

(assert (=> b!32160 (=> (not res!27480) (not e!21283))))

(assert (=> b!32160 (= res!27480 (isPrefixOf!0 (_2!1735 lt!47449) (_2!1734 lt!47034)))))

(declare-fun d!9426 () Bool)

(assert (=> d!9426 e!21283))

(declare-fun res!27478 () Bool)

(assert (=> d!9426 (=> (not res!27478) (not e!21283))))

(assert (=> d!9426 (= res!27478 (isPrefixOf!0 (_1!1735 lt!47449) (_2!1735 lt!47449)))))

(declare-fun lt!47439 () BitStream!1394)

(assert (=> d!9426 (= lt!47449 (tuple2!3297 lt!47439 (_2!1734 lt!47034)))))

(declare-fun lt!47445 () Unit!2427)

(declare-fun lt!47446 () Unit!2427)

(assert (=> d!9426 (= lt!47445 lt!47446)))

(assert (=> d!9426 (isPrefixOf!0 lt!47439 (_2!1734 lt!47034))))

(assert (=> d!9426 (= lt!47446 (lemmaIsPrefixTransitive!0 lt!47439 (_2!1734 lt!47034) (_2!1734 lt!47034)))))

(declare-fun lt!47448 () Unit!2427)

(declare-fun lt!47452 () Unit!2427)

(assert (=> d!9426 (= lt!47448 lt!47452)))

(assert (=> d!9426 (isPrefixOf!0 lt!47439 (_2!1734 lt!47034))))

(assert (=> d!9426 (= lt!47452 (lemmaIsPrefixTransitive!0 lt!47439 (_2!1734 lt!47038) (_2!1734 lt!47034)))))

(declare-fun lt!47450 () Unit!2427)

(assert (=> d!9426 (= lt!47450 e!21282)))

(declare-fun c!2198 () Bool)

(assert (=> d!9426 (= c!2198 (not (= (size!798 (buf!1126 (_2!1734 lt!47038))) #b00000000000000000000000000000000)))))

(declare-fun lt!47457 () Unit!2427)

(declare-fun lt!47453 () Unit!2427)

(assert (=> d!9426 (= lt!47457 lt!47453)))

(assert (=> d!9426 (isPrefixOf!0 (_2!1734 lt!47034) (_2!1734 lt!47034))))

(assert (=> d!9426 (= lt!47453 (lemmaIsPrefixRefl!0 (_2!1734 lt!47034)))))

(declare-fun lt!47438 () Unit!2427)

(declare-fun lt!47447 () Unit!2427)

(assert (=> d!9426 (= lt!47438 lt!47447)))

(assert (=> d!9426 (= lt!47447 (lemmaIsPrefixRefl!0 (_2!1734 lt!47034)))))

(declare-fun lt!47443 () Unit!2427)

(declare-fun lt!47441 () Unit!2427)

(assert (=> d!9426 (= lt!47443 lt!47441)))

(assert (=> d!9426 (isPrefixOf!0 lt!47439 lt!47439)))

(assert (=> d!9426 (= lt!47441 (lemmaIsPrefixRefl!0 lt!47439))))

(declare-fun lt!47451 () Unit!2427)

(declare-fun lt!47444 () Unit!2427)

(assert (=> d!9426 (= lt!47451 lt!47444)))

(assert (=> d!9426 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47038))))

(assert (=> d!9426 (= lt!47444 (lemmaIsPrefixRefl!0 (_2!1734 lt!47038)))))

(assert (=> d!9426 (= lt!47439 (BitStream!1395 (buf!1126 (_2!1734 lt!47034)) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(assert (=> d!9426 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47034))))

(assert (=> d!9426 (= (reader!0 (_2!1734 lt!47038) (_2!1734 lt!47034)) lt!47449)))

(assert (= (and d!9426 c!2198) b!32159))

(assert (= (and d!9426 (not c!2198)) b!32156))

(assert (= (and d!9426 res!27478) b!32157))

(assert (= (and b!32157 res!27479) b!32160))

(assert (= (and b!32160 res!27480) b!32158))

(declare-fun m!47473 () Bool)

(assert (=> b!32160 m!47473))

(declare-fun m!47475 () Bool)

(assert (=> b!32157 m!47475))

(declare-fun m!47477 () Bool)

(assert (=> b!32158 m!47477))

(assert (=> b!32158 m!47171))

(assert (=> b!32158 m!47085))

(assert (=> d!9426 m!47441))

(declare-fun m!47479 () Bool)

(assert (=> d!9426 m!47479))

(declare-fun m!47481 () Bool)

(assert (=> d!9426 m!47481))

(declare-fun m!47483 () Bool)

(assert (=> d!9426 m!47483))

(assert (=> d!9426 m!47087))

(declare-fun m!47485 () Bool)

(assert (=> d!9426 m!47485))

(declare-fun m!47487 () Bool)

(assert (=> d!9426 m!47487))

(assert (=> d!9426 m!47451))

(declare-fun m!47489 () Bool)

(assert (=> d!9426 m!47489))

(declare-fun m!47491 () Bool)

(assert (=> d!9426 m!47491))

(declare-fun m!47493 () Bool)

(assert (=> d!9426 m!47493))

(assert (=> b!32159 m!47085))

(declare-fun m!47495 () Bool)

(assert (=> b!32159 m!47495))

(declare-fun m!47497 () Bool)

(assert (=> b!32159 m!47497))

(assert (=> b!31958 d!9426))

(declare-fun d!9428 () Bool)

(assert (=> d!9428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!47046) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038)))) lt!47046))))

(declare-fun bs!2586 () Bool)

(assert (= bs!2586 d!9428))

(declare-fun m!47499 () Bool)

(assert (=> bs!2586 m!47499))

(assert (=> b!31958 d!9428))

(declare-fun b!32163 () Bool)

(declare-fun e!21285 () Bool)

(declare-fun lt!47459 () List!398)

(assert (=> b!32163 (= e!21285 (isEmpty!89 lt!47459))))

(declare-fun b!32164 () Bool)

(assert (=> b!32164 (= e!21285 (> (length!124 lt!47459) 0))))

(declare-fun d!9430 () Bool)

(assert (=> d!9430 e!21285))

(declare-fun c!2199 () Bool)

(assert (=> d!9430 (= c!2199 (= lt!47046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21284 () tuple2!3314)

(assert (=> d!9430 (= lt!47459 (_1!1744 e!21284))))

(declare-fun c!2200 () Bool)

(assert (=> d!9430 (= c!2200 (= lt!47046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9430 (bvsge lt!47046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9430 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_1!1735 lt!47029) lt!47046) lt!47459)))

(declare-fun b!32162 () Bool)

(declare-fun lt!47458 () (_ BitVec 64))

(declare-fun lt!47460 () tuple2!3316)

(assert (=> b!32162 (= e!21284 (tuple2!3315 (Cons!394 (_1!1745 lt!47460) (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_2!1745 lt!47460) (bvsub lt!47046 lt!47458))) (_2!1745 lt!47460)))))

(assert (=> b!32162 (= lt!47460 (readBit!0 (_1!1735 lt!47029)))))

(assert (=> b!32162 (= lt!47458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32161 () Bool)

(assert (=> b!32161 (= e!21284 (tuple2!3315 Nil!395 (_1!1735 lt!47029)))))

(assert (= (and d!9430 c!2200) b!32161))

(assert (= (and d!9430 (not c!2200)) b!32162))

(assert (= (and d!9430 c!2199) b!32163))

(assert (= (and d!9430 (not c!2199)) b!32164))

(declare-fun m!47501 () Bool)

(assert (=> b!32163 m!47501))

(declare-fun m!47503 () Bool)

(assert (=> b!32164 m!47503))

(declare-fun m!47505 () Bool)

(assert (=> b!32162 m!47505))

(declare-fun m!47507 () Bool)

(assert (=> b!32162 m!47507))

(assert (=> b!31958 d!9430))

(declare-fun d!9432 () Bool)

(assert (=> d!9432 (= (array_inv!750 srcBuffer!2) (bvsge (size!798 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6762 d!9432))

(declare-fun d!9434 () Bool)

(assert (=> d!9434 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2482 thiss!1379) (currentByte!2487 thiss!1379) (size!798 (buf!1126 thiss!1379))))))

(declare-fun bs!2587 () Bool)

(assert (= bs!2587 d!9434))

(declare-fun m!47509 () Bool)

(assert (=> bs!2587 m!47509))

(assert (=> start!6762 d!9434))

(declare-fun d!9436 () Bool)

(declare-fun e!21286 () Bool)

(assert (=> d!9436 e!21286))

(declare-fun res!27482 () Bool)

(assert (=> d!9436 (=> (not res!27482) (not e!21286))))

(declare-fun lt!47465 () (_ BitVec 64))

(declare-fun lt!47462 () (_ BitVec 64))

(declare-fun lt!47463 () (_ BitVec 64))

(assert (=> d!9436 (= res!27482 (= lt!47462 (bvsub lt!47465 lt!47463)))))

(assert (=> d!9436 (or (= (bvand lt!47465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47465 lt!47463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9436 (= lt!47463 (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47034))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47034)))))))

(declare-fun lt!47464 () (_ BitVec 64))

(declare-fun lt!47466 () (_ BitVec 64))

(assert (=> d!9436 (= lt!47465 (bvmul lt!47464 lt!47466))))

(assert (=> d!9436 (or (= lt!47464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47466 (bvsdiv (bvmul lt!47464 lt!47466) lt!47464)))))

(assert (=> d!9436 (= lt!47466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9436 (= lt!47464 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))))))

(assert (=> d!9436 (= lt!47462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47034))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47034)))))))

(assert (=> d!9436 (invariant!0 (currentBit!2482 (_2!1734 lt!47034)) (currentByte!2487 (_2!1734 lt!47034)) (size!798 (buf!1126 (_2!1734 lt!47034))))))

(assert (=> d!9436 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034))) lt!47462)))

(declare-fun b!32165 () Bool)

(declare-fun res!27481 () Bool)

(assert (=> b!32165 (=> (not res!27481) (not e!21286))))

(assert (=> b!32165 (= res!27481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47462))))

(declare-fun b!32166 () Bool)

(declare-fun lt!47461 () (_ BitVec 64))

(assert (=> b!32166 (= e!21286 (bvsle lt!47462 (bvmul lt!47461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32166 (or (= lt!47461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47461)))))

(assert (=> b!32166 (= lt!47461 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47034)))))))

(assert (= (and d!9436 res!27482) b!32165))

(assert (= (and b!32165 res!27481) b!32166))

(declare-fun m!47511 () Bool)

(assert (=> d!9436 m!47511))

(assert (=> d!9436 m!47129))

(assert (=> b!31969 d!9436))

(declare-fun d!9438 () Bool)

(assert (=> d!9438 (= (tail!115 lt!47030) (t!1148 lt!47030))))

(assert (=> b!31965 d!9438))

(declare-fun d!9440 () Bool)

(declare-fun e!21289 () Bool)

(assert (=> d!9440 e!21289))

(declare-fun res!27485 () Bool)

(assert (=> d!9440 (=> (not res!27485) (not e!21289))))

(declare-fun lt!47472 () (_ BitVec 64))

(assert (=> d!9440 (= res!27485 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!47472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9440 (= lt!47472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47471 () Unit!2427)

(declare-fun choose!42 (BitStream!1394 BitStream!1394 BitStream!1394 BitStream!1394 (_ BitVec 64) List!398) Unit!2427)

(assert (=> d!9440 (= lt!47471 (choose!42 (_2!1734 lt!47034) (_2!1734 lt!47034) (_1!1735 lt!47039) (_1!1735 lt!47029) (bvsub to!314 i!635) lt!47030))))

(assert (=> d!9440 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9440 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1734 lt!47034) (_2!1734 lt!47034) (_1!1735 lt!47039) (_1!1735 lt!47029) (bvsub to!314 i!635) lt!47030) lt!47471)))

(declare-fun b!32169 () Bool)

(assert (=> b!32169 (= e!21289 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!47034) (_1!1735 lt!47029) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!115 lt!47030)))))

(assert (= (and d!9440 res!27485) b!32169))

(declare-fun m!47513 () Bool)

(assert (=> d!9440 m!47513))

(declare-fun m!47515 () Bool)

(assert (=> b!32169 m!47515))

(assert (=> b!32169 m!47157))

(assert (=> b!31965 d!9440))

(declare-fun d!9442 () Bool)

(declare-fun res!27494 () Bool)

(declare-fun e!21295 () Bool)

(assert (=> d!9442 (=> (not res!27494) (not e!21295))))

(assert (=> d!9442 (= res!27494 (= (size!798 (buf!1126 thiss!1379)) (size!798 (buf!1126 thiss!1379))))))

(assert (=> d!9442 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!21295)))

(declare-fun b!32176 () Bool)

(declare-fun res!27492 () Bool)

(assert (=> b!32176 (=> (not res!27492) (not e!21295))))

(assert (=> b!32176 (= res!27492 (bvsle (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)) (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(declare-fun b!32177 () Bool)

(declare-fun e!21294 () Bool)

(assert (=> b!32177 (= e!21295 e!21294)))

(declare-fun res!27493 () Bool)

(assert (=> b!32177 (=> res!27493 e!21294)))

(assert (=> b!32177 (= res!27493 (= (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32178 () Bool)

(assert (=> b!32178 (= e!21294 (arrayBitRangesEq!0 (buf!1126 thiss!1379) (buf!1126 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(assert (= (and d!9442 res!27494) b!32176))

(assert (= (and b!32176 res!27492) b!32177))

(assert (= (and b!32177 (not res!27493)) b!32178))

(assert (=> b!32176 m!47127))

(assert (=> b!32176 m!47127))

(assert (=> b!32178 m!47127))

(assert (=> b!32178 m!47127))

(declare-fun m!47517 () Bool)

(assert (=> b!32178 m!47517))

(assert (=> b!31966 d!9442))

(declare-fun d!9444 () Bool)

(assert (=> d!9444 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!47475 () Unit!2427)

(declare-fun choose!11 (BitStream!1394) Unit!2427)

(assert (=> d!9444 (= lt!47475 (choose!11 thiss!1379))))

(assert (=> d!9444 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!47475)))

(declare-fun bs!2589 () Bool)

(assert (= bs!2589 d!9444))

(assert (=> bs!2589 m!47123))

(declare-fun m!47519 () Bool)

(assert (=> bs!2589 m!47519))

(assert (=> b!31966 d!9444))

(declare-fun d!9446 () Bool)

(declare-fun e!21296 () Bool)

(assert (=> d!9446 e!21296))

(declare-fun res!27496 () Bool)

(assert (=> d!9446 (=> (not res!27496) (not e!21296))))

(declare-fun lt!47477 () (_ BitVec 64))

(declare-fun lt!47478 () (_ BitVec 64))

(declare-fun lt!47480 () (_ BitVec 64))

(assert (=> d!9446 (= res!27496 (= lt!47477 (bvsub lt!47480 lt!47478)))))

(assert (=> d!9446 (or (= (bvand lt!47480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47480 lt!47478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9446 (= lt!47478 (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379))))))

(declare-fun lt!47479 () (_ BitVec 64))

(declare-fun lt!47481 () (_ BitVec 64))

(assert (=> d!9446 (= lt!47480 (bvmul lt!47479 lt!47481))))

(assert (=> d!9446 (or (= lt!47479 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47481 (bvsdiv (bvmul lt!47479 lt!47481) lt!47479)))))

(assert (=> d!9446 (= lt!47481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9446 (= lt!47479 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))))))

(assert (=> d!9446 (= lt!47477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2487 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2482 thiss!1379))))))

(assert (=> d!9446 (invariant!0 (currentBit!2482 thiss!1379) (currentByte!2487 thiss!1379) (size!798 (buf!1126 thiss!1379)))))

(assert (=> d!9446 (= (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)) lt!47477)))

(declare-fun b!32179 () Bool)

(declare-fun res!27495 () Bool)

(assert (=> b!32179 (=> (not res!27495) (not e!21296))))

(assert (=> b!32179 (= res!27495 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47477))))

(declare-fun b!32180 () Bool)

(declare-fun lt!47476 () (_ BitVec 64))

(assert (=> b!32180 (= e!21296 (bvsle lt!47477 (bvmul lt!47476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32180 (or (= lt!47476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47476)))))

(assert (=> b!32180 (= lt!47476 ((_ sign_extend 32) (size!798 (buf!1126 thiss!1379))))))

(assert (= (and d!9446 res!27496) b!32179))

(assert (= (and b!32179 res!27495) b!32180))

(assert (=> d!9446 m!47431))

(assert (=> d!9446 m!47509))

(assert (=> b!31966 d!9446))

(declare-fun d!9448 () Bool)

(assert (=> d!9448 (= (array_inv!750 (buf!1126 thiss!1379)) (bvsge (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31955 d!9448))

(declare-fun d!9450 () Bool)

(declare-fun res!27499 () Bool)

(declare-fun e!21298 () Bool)

(assert (=> d!9450 (=> (not res!27499) (not e!21298))))

(assert (=> d!9450 (= res!27499 (= (size!798 (buf!1126 thiss!1379)) (size!798 (buf!1126 (_2!1734 lt!47038)))))))

(assert (=> d!9450 (= (isPrefixOf!0 thiss!1379 (_2!1734 lt!47038)) e!21298)))

(declare-fun b!32181 () Bool)

(declare-fun res!27497 () Bool)

(assert (=> b!32181 (=> (not res!27497) (not e!21298))))

(assert (=> b!32181 (= res!27497 (bvsle (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)) (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038)))))))

(declare-fun b!32182 () Bool)

(declare-fun e!21297 () Bool)

(assert (=> b!32182 (= e!21298 e!21297)))

(declare-fun res!27498 () Bool)

(assert (=> b!32182 (=> res!27498 e!21297)))

(assert (=> b!32182 (= res!27498 (= (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32183 () Bool)

(assert (=> b!32183 (= e!21297 (arrayBitRangesEq!0 (buf!1126 thiss!1379) (buf!1126 (_2!1734 lt!47038)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(assert (= (and d!9450 res!27499) b!32181))

(assert (= (and b!32181 res!27497) b!32182))

(assert (= (and b!32182 (not res!27498)) b!32183))

(assert (=> b!32181 m!47127))

(assert (=> b!32181 m!47085))

(assert (=> b!32183 m!47127))

(assert (=> b!32183 m!47127))

(declare-fun m!47521 () Bool)

(assert (=> b!32183 m!47521))

(assert (=> b!31956 d!9450))

(declare-fun d!9452 () Bool)

(assert (=> d!9452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!47046) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038)))) lt!47046))))

(declare-fun bs!2590 () Bool)

(assert (= bs!2590 d!9452))

(assert (=> bs!2590 m!47423))

(assert (=> b!31956 d!9452))

(declare-fun d!9454 () Bool)

(declare-fun e!21301 () Bool)

(assert (=> d!9454 e!21301))

(declare-fun res!27502 () Bool)

(assert (=> d!9454 (=> (not res!27502) (not e!21301))))

(assert (=> d!9454 (= res!27502 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!47484 () Unit!2427)

(declare-fun choose!27 (BitStream!1394 BitStream!1394 (_ BitVec 64) (_ BitVec 64)) Unit!2427)

(assert (=> d!9454 (= lt!47484 (choose!27 thiss!1379 (_2!1734 lt!47038) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9454 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1734 lt!47038) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47484)))

(declare-fun b!32186 () Bool)

(assert (=> b!32186 (= e!21301 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9454 res!27502) b!32186))

(declare-fun m!47523 () Bool)

(assert (=> d!9454 m!47523))

(declare-fun m!47525 () Bool)

(assert (=> b!32186 m!47525))

(assert (=> b!31956 d!9454))

(declare-fun b!32204 () Bool)

(declare-fun e!21313 () Bool)

(declare-fun e!21310 () Bool)

(assert (=> b!32204 (= e!21313 e!21310)))

(declare-fun res!27520 () Bool)

(assert (=> b!32204 (=> (not res!27520) (not e!21310))))

(declare-fun lt!47516 () tuple2!3294)

(declare-datatypes ((tuple2!3318 0))(
  ( (tuple2!3319 (_1!1746 BitStream!1394) (_2!1746 Bool)) )
))
(declare-fun lt!47518 () tuple2!3318)

(declare-fun lt!47519 () Bool)

(assert (=> b!32204 (= res!27520 (and (= (_2!1746 lt!47518) lt!47519) (= (_1!1746 lt!47518) (_2!1734 lt!47516))))))

(declare-fun readBitPure!0 (BitStream!1394) tuple2!3318)

(declare-fun readerFrom!0 (BitStream!1394 (_ BitVec 32) (_ BitVec 32)) BitStream!1394)

(assert (=> b!32204 (= lt!47518 (readBitPure!0 (readerFrom!0 (_2!1734 lt!47516) (currentBit!2482 thiss!1379) (currentByte!2487 thiss!1379))))))

(declare-fun b!32205 () Bool)

(declare-fun res!27523 () Bool)

(assert (=> b!32205 (=> (not res!27523) (not e!21313))))

(assert (=> b!32205 (= res!27523 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47516)))))

(declare-fun b!32206 () Bool)

(declare-fun res!27519 () Bool)

(declare-fun e!21312 () Bool)

(assert (=> b!32206 (=> (not res!27519) (not e!21312))))

(declare-fun lt!47514 () (_ BitVec 64))

(declare-fun lt!47517 () (_ BitVec 64))

(declare-fun lt!47509 () tuple2!3294)

(assert (=> b!32206 (= res!27519 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47509))) (currentByte!2487 (_2!1734 lt!47509)) (currentBit!2482 (_2!1734 lt!47509))) (bvadd lt!47517 lt!47514)))))

(assert (=> b!32206 (or (not (= (bvand lt!47517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47514 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!47517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!47517 lt!47514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32206 (= lt!47514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!32206 (= lt!47517 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(declare-fun b!32207 () Bool)

(declare-fun e!21311 () Bool)

(assert (=> b!32207 (= e!21312 e!21311)))

(declare-fun res!27524 () Bool)

(assert (=> b!32207 (=> (not res!27524) (not e!21311))))

(declare-fun lt!47520 () tuple2!3318)

(declare-fun lt!47512 () (_ BitVec 8))

(assert (=> b!32207 (= res!27524 (and (= (_2!1746 lt!47520) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!47512)) #b00000000000000000000000000000000))) (= (_1!1746 lt!47520) (_2!1734 lt!47509))))))

(declare-datatypes ((tuple2!3320 0))(
  ( (tuple2!3321 (_1!1747 array!1815) (_2!1747 BitStream!1394)) )
))
(declare-fun lt!47511 () tuple2!3320)

(declare-fun lt!47510 () BitStream!1394)

(declare-fun readBits!0 (BitStream!1394 (_ BitVec 64)) tuple2!3320)

(assert (=> b!32207 (= lt!47511 (readBits!0 lt!47510 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32207 (= lt!47520 (readBitPure!0 lt!47510))))

(assert (=> b!32207 (= lt!47510 (readerFrom!0 (_2!1734 lt!47509) (currentBit!2482 thiss!1379) (currentByte!2487 thiss!1379)))))

(declare-fun b!32208 () Bool)

(assert (=> b!32208 (= e!21310 (= (bitIndex!0 (size!798 (buf!1126 (_1!1746 lt!47518))) (currentByte!2487 (_1!1746 lt!47518)) (currentBit!2482 (_1!1746 lt!47518))) (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47516))) (currentByte!2487 (_2!1734 lt!47516)) (currentBit!2482 (_2!1734 lt!47516)))))))

(declare-fun b!32209 () Bool)

(assert (=> b!32209 (= e!21311 (= (bitIndex!0 (size!798 (buf!1126 (_1!1746 lt!47520))) (currentByte!2487 (_1!1746 lt!47520)) (currentBit!2482 (_1!1746 lt!47520))) (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47509))) (currentByte!2487 (_2!1734 lt!47509)) (currentBit!2482 (_2!1734 lt!47509)))))))

(declare-fun d!9456 () Bool)

(assert (=> d!9456 e!21312))

(declare-fun res!27521 () Bool)

(assert (=> d!9456 (=> (not res!27521) (not e!21312))))

(assert (=> d!9456 (= res!27521 (= (size!798 (buf!1126 (_2!1734 lt!47509))) (size!798 (buf!1126 thiss!1379))))))

(declare-fun lt!47515 () array!1815)

(assert (=> d!9456 (= lt!47512 (select (arr!1270 lt!47515) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9456 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!798 lt!47515)))))

(assert (=> d!9456 (= lt!47515 (array!1816 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!47513 () tuple2!3294)

(assert (=> d!9456 (= lt!47509 (tuple2!3295 (_1!1734 lt!47513) (_2!1734 lt!47513)))))

(assert (=> d!9456 (= lt!47513 lt!47516)))

(assert (=> d!9456 e!21313))

(declare-fun res!27522 () Bool)

(assert (=> d!9456 (=> (not res!27522) (not e!21313))))

(assert (=> d!9456 (= res!27522 (= (size!798 (buf!1126 thiss!1379)) (size!798 (buf!1126 (_2!1734 lt!47516)))))))

(declare-fun appendBit!0 (BitStream!1394 Bool) tuple2!3294)

(assert (=> d!9456 (= lt!47516 (appendBit!0 thiss!1379 lt!47519))))

(assert (=> d!9456 (= lt!47519 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9456 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9456 (= (appendBitFromByte!0 thiss!1379 (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!47509)))

(declare-fun b!32210 () Bool)

(declare-fun res!27526 () Bool)

(assert (=> b!32210 (=> (not res!27526) (not e!21313))))

(assert (=> b!32210 (= res!27526 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47516))) (currentByte!2487 (_2!1734 lt!47516)) (currentBit!2482 (_2!1734 lt!47516))) (bvadd (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32211 () Bool)

(declare-fun res!27525 () Bool)

(assert (=> b!32211 (=> (not res!27525) (not e!21312))))

(assert (=> b!32211 (= res!27525 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47509)))))

(assert (= (and d!9456 res!27522) b!32210))

(assert (= (and b!32210 res!27526) b!32205))

(assert (= (and b!32205 res!27523) b!32204))

(assert (= (and b!32204 res!27520) b!32208))

(assert (= (and d!9456 res!27521) b!32206))

(assert (= (and b!32206 res!27519) b!32211))

(assert (= (and b!32211 res!27525) b!32207))

(assert (= (and b!32207 res!27524) b!32209))

(declare-fun m!47527 () Bool)

(assert (=> b!32211 m!47527))

(declare-fun m!47529 () Bool)

(assert (=> b!32205 m!47529))

(declare-fun m!47531 () Bool)

(assert (=> b!32209 m!47531))

(declare-fun m!47533 () Bool)

(assert (=> b!32209 m!47533))

(declare-fun m!47535 () Bool)

(assert (=> b!32207 m!47535))

(declare-fun m!47537 () Bool)

(assert (=> b!32207 m!47537))

(declare-fun m!47539 () Bool)

(assert (=> b!32207 m!47539))

(declare-fun m!47541 () Bool)

(assert (=> b!32210 m!47541))

(assert (=> b!32210 m!47127))

(declare-fun m!47543 () Bool)

(assert (=> b!32204 m!47543))

(assert (=> b!32204 m!47543))

(declare-fun m!47545 () Bool)

(assert (=> b!32204 m!47545))

(declare-fun m!47547 () Bool)

(assert (=> b!32208 m!47547))

(assert (=> b!32208 m!47541))

(declare-fun m!47549 () Bool)

(assert (=> d!9456 m!47549))

(declare-fun m!47551 () Bool)

(assert (=> d!9456 m!47551))

(assert (=> d!9456 m!47419))

(assert (=> b!32206 m!47533))

(assert (=> b!32206 m!47127))

(assert (=> b!31956 d!9456))

(declare-fun d!9458 () Bool)

(assert (=> d!9458 (= (head!235 (byteArrayBitContentToList!0 (_2!1734 lt!47038) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!513 (byteArrayBitContentToList!0 (_2!1734 lt!47038) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31962 d!9458))

(declare-fun d!9460 () Bool)

(declare-fun c!2201 () Bool)

(assert (=> d!9460 (= c!2201 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21314 () List!398)

(assert (=> d!9460 (= (byteArrayBitContentToList!0 (_2!1734 lt!47038) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!21314)))

(declare-fun b!32212 () Bool)

(assert (=> b!32212 (= e!21314 Nil!395)))

(declare-fun b!32213 () Bool)

(assert (=> b!32213 (= e!21314 (Cons!394 (not (= (bvand ((_ sign_extend 24) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1734 lt!47038) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9460 c!2201) b!32212))

(assert (= (and d!9460 (not c!2201)) b!32213))

(assert (=> b!32213 m!47147))

(assert (=> b!32213 m!47419))

(declare-fun m!47553 () Bool)

(assert (=> b!32213 m!47553))

(assert (=> b!31962 d!9460))

(declare-fun d!9462 () Bool)

(assert (=> d!9462 (= (head!235 (bitStreamReadBitsIntoList!0 (_2!1734 lt!47038) (_1!1735 lt!47031) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!513 (bitStreamReadBitsIntoList!0 (_2!1734 lt!47038) (_1!1735 lt!47031) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31962 d!9462))

(declare-fun b!32216 () Bool)

(declare-fun e!21316 () Bool)

(declare-fun lt!47522 () List!398)

(assert (=> b!32216 (= e!21316 (isEmpty!89 lt!47522))))

(declare-fun b!32217 () Bool)

(assert (=> b!32217 (= e!21316 (> (length!124 lt!47522) 0))))

(declare-fun d!9464 () Bool)

(assert (=> d!9464 e!21316))

(declare-fun c!2202 () Bool)

(assert (=> d!9464 (= c!2202 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21315 () tuple2!3314)

(assert (=> d!9464 (= lt!47522 (_1!1744 e!21315))))

(declare-fun c!2203 () Bool)

(assert (=> d!9464 (= c!2203 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9464 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9464 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!47038) (_1!1735 lt!47031) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47522)))

(declare-fun b!32215 () Bool)

(declare-fun lt!47523 () tuple2!3316)

(declare-fun lt!47521 () (_ BitVec 64))

(assert (=> b!32215 (= e!21315 (tuple2!3315 (Cons!394 (_1!1745 lt!47523) (bitStreamReadBitsIntoList!0 (_2!1734 lt!47038) (_2!1745 lt!47523) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!47521))) (_2!1745 lt!47523)))))

(assert (=> b!32215 (= lt!47523 (readBit!0 (_1!1735 lt!47031)))))

(assert (=> b!32215 (= lt!47521 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32214 () Bool)

(assert (=> b!32214 (= e!21315 (tuple2!3315 Nil!395 (_1!1735 lt!47031)))))

(assert (= (and d!9464 c!2203) b!32214))

(assert (= (and d!9464 (not c!2203)) b!32215))

(assert (= (and d!9464 c!2202) b!32216))

(assert (= (and d!9464 (not c!2202)) b!32217))

(declare-fun m!47555 () Bool)

(assert (=> b!32216 m!47555))

(declare-fun m!47557 () Bool)

(assert (=> b!32217 m!47557))

(declare-fun m!47559 () Bool)

(assert (=> b!32215 m!47559))

(declare-fun m!47561 () Bool)

(assert (=> b!32215 m!47561))

(assert (=> b!31962 d!9464))

(declare-fun d!9466 () Bool)

(declare-fun res!27529 () Bool)

(declare-fun e!21318 () Bool)

(assert (=> d!9466 (=> (not res!27529) (not e!21318))))

(assert (=> d!9466 (= res!27529 (= (size!798 (buf!1126 thiss!1379)) (size!798 (buf!1126 (_2!1734 lt!47034)))))))

(assert (=> d!9466 (= (isPrefixOf!0 thiss!1379 (_2!1734 lt!47034)) e!21318)))

(declare-fun b!32218 () Bool)

(declare-fun res!27527 () Bool)

(assert (=> b!32218 (=> (not res!27527) (not e!21318))))

(assert (=> b!32218 (= res!27527 (bvsle (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)) (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034)))))))

(declare-fun b!32219 () Bool)

(declare-fun e!21317 () Bool)

(assert (=> b!32219 (= e!21318 e!21317)))

(declare-fun res!27528 () Bool)

(assert (=> b!32219 (=> res!27528 e!21317)))

(assert (=> b!32219 (= res!27528 (= (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32220 () Bool)

(assert (=> b!32220 (= e!21317 (arrayBitRangesEq!0 (buf!1126 thiss!1379) (buf!1126 (_2!1734 lt!47034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(assert (= (and d!9466 res!27529) b!32218))

(assert (= (and b!32218 res!27527) b!32219))

(assert (= (and b!32219 (not res!27528)) b!32220))

(assert (=> b!32218 m!47127))

(assert (=> b!32218 m!47171))

(assert (=> b!32220 m!47127))

(assert (=> b!32220 m!47127))

(declare-fun m!47563 () Bool)

(assert (=> b!32220 m!47563))

(assert (=> b!31963 d!9466))

(declare-fun d!9468 () Bool)

(declare-fun res!27532 () Bool)

(declare-fun e!21320 () Bool)

(assert (=> d!9468 (=> (not res!27532) (not e!21320))))

(assert (=> d!9468 (= res!27532 (= (size!798 (buf!1126 (_2!1734 lt!47038))) (size!798 (buf!1126 (_2!1734 lt!47034)))))))

(assert (=> d!9468 (= (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47034)) e!21320)))

(declare-fun b!32221 () Bool)

(declare-fun res!27530 () Bool)

(assert (=> b!32221 (=> (not res!27530) (not e!21320))))

(assert (=> b!32221 (= res!27530 (bvsle (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))) (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47034))) (currentByte!2487 (_2!1734 lt!47034)) (currentBit!2482 (_2!1734 lt!47034)))))))

(declare-fun b!32222 () Bool)

(declare-fun e!21319 () Bool)

(assert (=> b!32222 (= e!21320 e!21319)))

(declare-fun res!27531 () Bool)

(assert (=> b!32222 (=> res!27531 e!21319)))

(assert (=> b!32222 (= res!27531 (= (size!798 (buf!1126 (_2!1734 lt!47038))) #b00000000000000000000000000000000))))

(declare-fun b!32223 () Bool)

(assert (=> b!32223 (= e!21319 (arrayBitRangesEq!0 (buf!1126 (_2!1734 lt!47038)) (buf!1126 (_2!1734 lt!47034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038)))))))

(assert (= (and d!9468 res!27532) b!32221))

(assert (= (and b!32221 res!27530) b!32222))

(assert (= (and b!32222 (not res!27531)) b!32223))

(assert (=> b!32221 m!47085))

(assert (=> b!32221 m!47171))

(assert (=> b!32223 m!47085))

(assert (=> b!32223 m!47085))

(declare-fun m!47565 () Bool)

(assert (=> b!32223 m!47565))

(assert (=> b!31963 d!9468))

(declare-fun d!9470 () Bool)

(assert (=> d!9470 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47524 () Unit!2427)

(assert (=> d!9470 (= lt!47524 (choose!9 thiss!1379 (buf!1126 (_2!1734 lt!47038)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1395 (buf!1126 (_2!1734 lt!47038)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379))))))

(assert (=> d!9470 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1126 (_2!1734 lt!47038)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47524)))

(declare-fun bs!2591 () Bool)

(assert (= bs!2591 d!9470))

(assert (=> bs!2591 m!47095))

(declare-fun m!47567 () Bool)

(assert (=> bs!2591 m!47567))

(assert (=> b!31963 d!9470))

(declare-fun b!32224 () Bool)

(declare-fun e!21321 () Unit!2427)

(declare-fun Unit!2451 () Unit!2427)

(assert (=> b!32224 (= e!21321 Unit!2451)))

(declare-fun b!32225 () Bool)

(declare-fun res!27534 () Bool)

(declare-fun e!21322 () Bool)

(assert (=> b!32225 (=> (not res!27534) (not e!21322))))

(declare-fun lt!47536 () tuple2!3296)

(assert (=> b!32225 (= res!27534 (isPrefixOf!0 (_1!1735 lt!47536) thiss!1379))))

(declare-fun lt!47542 () (_ BitVec 64))

(declare-fun lt!47541 () (_ BitVec 64))

(declare-fun b!32226 () Bool)

(assert (=> b!32226 (= e!21322 (= (_1!1735 lt!47536) (withMovedBitIndex!0 (_2!1735 lt!47536) (bvsub lt!47541 lt!47542))))))

(assert (=> b!32226 (or (= (bvand lt!47541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47541 lt!47542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32226 (= lt!47542 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(assert (=> b!32226 (= lt!47541 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(declare-fun b!32227 () Bool)

(declare-fun lt!47527 () Unit!2427)

(assert (=> b!32227 (= e!21321 lt!47527)))

(declare-fun lt!47529 () (_ BitVec 64))

(assert (=> b!32227 (= lt!47529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47543 () (_ BitVec 64))

(assert (=> b!32227 (= lt!47543 (bitIndex!0 (size!798 (buf!1126 thiss!1379)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(assert (=> b!32227 (= lt!47527 (arrayBitRangesEqSymmetric!0 (buf!1126 thiss!1379) (buf!1126 (_2!1734 lt!47038)) lt!47529 lt!47543))))

(assert (=> b!32227 (arrayBitRangesEq!0 (buf!1126 (_2!1734 lt!47038)) (buf!1126 thiss!1379) lt!47529 lt!47543)))

(declare-fun b!32228 () Bool)

(declare-fun res!27535 () Bool)

(assert (=> b!32228 (=> (not res!27535) (not e!21322))))

(assert (=> b!32228 (= res!27535 (isPrefixOf!0 (_2!1735 lt!47536) (_2!1734 lt!47038)))))

(declare-fun d!9472 () Bool)

(assert (=> d!9472 e!21322))

(declare-fun res!27533 () Bool)

(assert (=> d!9472 (=> (not res!27533) (not e!21322))))

(assert (=> d!9472 (= res!27533 (isPrefixOf!0 (_1!1735 lt!47536) (_2!1735 lt!47536)))))

(declare-fun lt!47526 () BitStream!1394)

(assert (=> d!9472 (= lt!47536 (tuple2!3297 lt!47526 (_2!1734 lt!47038)))))

(declare-fun lt!47532 () Unit!2427)

(declare-fun lt!47533 () Unit!2427)

(assert (=> d!9472 (= lt!47532 lt!47533)))

(assert (=> d!9472 (isPrefixOf!0 lt!47526 (_2!1734 lt!47038))))

(assert (=> d!9472 (= lt!47533 (lemmaIsPrefixTransitive!0 lt!47526 (_2!1734 lt!47038) (_2!1734 lt!47038)))))

(declare-fun lt!47535 () Unit!2427)

(declare-fun lt!47539 () Unit!2427)

(assert (=> d!9472 (= lt!47535 lt!47539)))

(assert (=> d!9472 (isPrefixOf!0 lt!47526 (_2!1734 lt!47038))))

(assert (=> d!9472 (= lt!47539 (lemmaIsPrefixTransitive!0 lt!47526 thiss!1379 (_2!1734 lt!47038)))))

(declare-fun lt!47537 () Unit!2427)

(assert (=> d!9472 (= lt!47537 e!21321)))

(declare-fun c!2204 () Bool)

(assert (=> d!9472 (= c!2204 (not (= (size!798 (buf!1126 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47544 () Unit!2427)

(declare-fun lt!47540 () Unit!2427)

(assert (=> d!9472 (= lt!47544 lt!47540)))

(assert (=> d!9472 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47038))))

(assert (=> d!9472 (= lt!47540 (lemmaIsPrefixRefl!0 (_2!1734 lt!47038)))))

(declare-fun lt!47525 () Unit!2427)

(declare-fun lt!47534 () Unit!2427)

(assert (=> d!9472 (= lt!47525 lt!47534)))

(assert (=> d!9472 (= lt!47534 (lemmaIsPrefixRefl!0 (_2!1734 lt!47038)))))

(declare-fun lt!47530 () Unit!2427)

(declare-fun lt!47528 () Unit!2427)

(assert (=> d!9472 (= lt!47530 lt!47528)))

(assert (=> d!9472 (isPrefixOf!0 lt!47526 lt!47526)))

(assert (=> d!9472 (= lt!47528 (lemmaIsPrefixRefl!0 lt!47526))))

(declare-fun lt!47538 () Unit!2427)

(declare-fun lt!47531 () Unit!2427)

(assert (=> d!9472 (= lt!47538 lt!47531)))

(assert (=> d!9472 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9472 (= lt!47531 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9472 (= lt!47526 (BitStream!1395 (buf!1126 (_2!1734 lt!47038)) (currentByte!2487 thiss!1379) (currentBit!2482 thiss!1379)))))

(assert (=> d!9472 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47038))))

(assert (=> d!9472 (= (reader!0 thiss!1379 (_2!1734 lt!47038)) lt!47536)))

(assert (= (and d!9472 c!2204) b!32227))

(assert (= (and d!9472 (not c!2204)) b!32224))

(assert (= (and d!9472 res!27533) b!32225))

(assert (= (and b!32225 res!27534) b!32228))

(assert (= (and b!32228 res!27535) b!32226))

(declare-fun m!47569 () Bool)

(assert (=> b!32228 m!47569))

(declare-fun m!47571 () Bool)

(assert (=> b!32225 m!47571))

(declare-fun m!47573 () Bool)

(assert (=> b!32226 m!47573))

(assert (=> b!32226 m!47085))

(assert (=> b!32226 m!47127))

(assert (=> d!9472 m!47489))

(declare-fun m!47575 () Bool)

(assert (=> d!9472 m!47575))

(declare-fun m!47577 () Bool)

(assert (=> d!9472 m!47577))

(assert (=> d!9472 m!47125))

(assert (=> d!9472 m!47149))

(declare-fun m!47579 () Bool)

(assert (=> d!9472 m!47579))

(declare-fun m!47581 () Bool)

(assert (=> d!9472 m!47581))

(assert (=> d!9472 m!47483))

(assert (=> d!9472 m!47123))

(declare-fun m!47583 () Bool)

(assert (=> d!9472 m!47583))

(declare-fun m!47585 () Bool)

(assert (=> d!9472 m!47585))

(assert (=> b!32227 m!47127))

(declare-fun m!47587 () Bool)

(assert (=> b!32227 m!47587))

(declare-fun m!47589 () Bool)

(assert (=> b!32227 m!47589))

(assert (=> b!31963 d!9472))

(declare-fun b!32373 () Bool)

(declare-fun res!27644 () Bool)

(declare-fun e!21393 () Bool)

(assert (=> b!32373 (=> (not res!27644) (not e!21393))))

(declare-fun lt!48036 () tuple2!3294)

(assert (=> b!32373 (= res!27644 (= (size!798 (buf!1126 (_2!1734 lt!47038))) (size!798 (buf!1126 (_2!1734 lt!48036)))))))

(declare-fun call!418 () tuple2!3296)

(declare-fun c!2223 () Bool)

(declare-fun lt!48039 () tuple2!3294)

(declare-fun bm!415 () Bool)

(assert (=> bm!415 (= call!418 (reader!0 (_2!1734 lt!47038) (ite c!2223 (_2!1734 lt!48039) (_2!1734 lt!47038))))))

(declare-fun b!32374 () Bool)

(declare-fun res!27647 () Bool)

(assert (=> b!32374 (=> (not res!27647) (not e!21393))))

(assert (=> b!32374 (= res!27647 (invariant!0 (currentBit!2482 (_2!1734 lt!48036)) (currentByte!2487 (_2!1734 lt!48036)) (size!798 (buf!1126 (_2!1734 lt!48036)))))))

(declare-fun b!32375 () Bool)

(declare-fun e!21394 () Bool)

(declare-fun lt!48013 () (_ BitVec 64))

(assert (=> b!32375 (= e!21394 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!48013))))

(declare-fun b!32376 () Bool)

(declare-fun e!21392 () tuple2!3294)

(declare-fun lt!48009 () tuple2!3294)

(declare-fun Unit!2452 () Unit!2427)

(assert (=> b!32376 (= e!21392 (tuple2!3295 Unit!2452 (_2!1734 lt!48009)))))

(assert (=> b!32376 (= lt!48039 (appendBitFromByte!0 (_2!1734 lt!47038) (select (arr!1270 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!48021 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48021 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!48000 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48000 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!48008 () Unit!2427)

(assert (=> b!32376 (= lt!48008 (validateOffsetBitsIneqLemma!0 (_2!1734 lt!47038) (_2!1734 lt!48039) lt!48021 lt!48000))))

(assert (=> b!32376 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!48039)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!48039))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!48039))) (bvsub lt!48021 lt!48000))))

(declare-fun lt!48001 () Unit!2427)

(assert (=> b!32376 (= lt!48001 lt!48008)))

(declare-fun lt!48015 () tuple2!3296)

(assert (=> b!32376 (= lt!48015 call!418)))

(declare-fun lt!48027 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!48042 () Unit!2427)

(assert (=> b!32376 (= lt!48042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!48039)) lt!48027))))

(assert (=> b!32376 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!48039)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!48027)))

(declare-fun lt!48003 () Unit!2427)

(assert (=> b!32376 (= lt!48003 lt!48042)))

(assert (=> b!32376 (= (head!235 (byteArrayBitContentToList!0 (_2!1734 lt!48039) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!235 (bitStreamReadBitsIntoList!0 (_2!1734 lt!48039) (_1!1735 lt!48015) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!48026 () Unit!2427)

(declare-fun Unit!2453 () Unit!2427)

(assert (=> b!32376 (= lt!48026 Unit!2453)))

(assert (=> b!32376 (= lt!48009 (appendBitsMSBFirstLoop!0 (_2!1734 lt!48039) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!48034 () Unit!2427)

(assert (=> b!32376 (= lt!48034 (lemmaIsPrefixTransitive!0 (_2!1734 lt!47038) (_2!1734 lt!48039) (_2!1734 lt!48009)))))

(assert (=> b!32376 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!48009))))

(declare-fun lt!48031 () Unit!2427)

(assert (=> b!32376 (= lt!48031 lt!48034)))

(assert (=> b!32376 (= (size!798 (buf!1126 (_2!1734 lt!48009))) (size!798 (buf!1126 (_2!1734 lt!47038))))))

(declare-fun lt!48020 () Unit!2427)

(declare-fun Unit!2454 () Unit!2427)

(assert (=> b!32376 (= lt!48020 Unit!2454)))

(assert (=> b!32376 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!48009))) (currentByte!2487 (_2!1734 lt!48009)) (currentBit!2482 (_2!1734 lt!48009))) (bvsub (bvadd (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!48007 () Unit!2427)

(declare-fun Unit!2455 () Unit!2427)

(assert (=> b!32376 (= lt!48007 Unit!2455)))

(assert (=> b!32376 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!48009))) (currentByte!2487 (_2!1734 lt!48009)) (currentBit!2482 (_2!1734 lt!48009))) (bvsub (bvsub (bvadd (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!48039))) (currentByte!2487 (_2!1734 lt!48039)) (currentBit!2482 (_2!1734 lt!48039))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48032 () Unit!2427)

(declare-fun Unit!2456 () Unit!2427)

(assert (=> b!32376 (= lt!48032 Unit!2456)))

(declare-fun lt!48016 () tuple2!3296)

(assert (=> b!32376 (= lt!48016 (reader!0 (_2!1734 lt!47038) (_2!1734 lt!48009)))))

(declare-fun lt!48011 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48011 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!48025 () Unit!2427)

(assert (=> b!32376 (= lt!48025 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!48009)) lt!48011))))

(assert (=> b!32376 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!48009)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!48011)))

(declare-fun lt!48033 () Unit!2427)

(assert (=> b!32376 (= lt!48033 lt!48025)))

(declare-fun lt!48024 () tuple2!3296)

(assert (=> b!32376 (= lt!48024 (reader!0 (_2!1734 lt!48039) (_2!1734 lt!48009)))))

(declare-fun lt!48030 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48030 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48022 () Unit!2427)

(assert (=> b!32376 (= lt!48022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!48039) (buf!1126 (_2!1734 lt!48009)) lt!48030))))

(assert (=> b!32376 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!48009)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!48039))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!48039))) lt!48030)))

(declare-fun lt!48037 () Unit!2427)

(assert (=> b!32376 (= lt!48037 lt!48022)))

(declare-fun lt!48014 () List!398)

(assert (=> b!32376 (= lt!48014 (byteArrayBitContentToList!0 (_2!1734 lt!48009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!48041 () List!398)

(assert (=> b!32376 (= lt!48041 (byteArrayBitContentToList!0 (_2!1734 lt!48009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!48038 () List!398)

(assert (=> b!32376 (= lt!48038 (bitStreamReadBitsIntoList!0 (_2!1734 lt!48009) (_1!1735 lt!48016) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!48012 () List!398)

(assert (=> b!32376 (= lt!48012 (bitStreamReadBitsIntoList!0 (_2!1734 lt!48009) (_1!1735 lt!48024) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!48004 () (_ BitVec 64))

(assert (=> b!32376 (= lt!48004 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!48002 () Unit!2427)

(assert (=> b!32376 (= lt!48002 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1734 lt!48009) (_2!1734 lt!48009) (_1!1735 lt!48016) (_1!1735 lt!48024) lt!48004 lt!48038))))

(assert (=> b!32376 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!48009) (_1!1735 lt!48024) (bvsub lt!48004 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!115 lt!48038))))

(declare-fun lt!48006 () Unit!2427)

(assert (=> b!32376 (= lt!48006 lt!48002)))

(declare-fun lt!48010 () (_ BitVec 64))

(declare-fun lt!48043 () Unit!2427)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1815 array!1815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2427)

(assert (=> b!32376 (= lt!48043 (arrayBitRangesEqImpliesEq!0 (buf!1126 (_2!1734 lt!48039)) (buf!1126 (_2!1734 lt!48009)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!48010 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!48039))) (currentByte!2487 (_2!1734 lt!48039)) (currentBit!2482 (_2!1734 lt!48039)))))))

(assert (=> b!32376 (= (bitAt!0 (buf!1126 (_2!1734 lt!48039)) lt!48010) (bitAt!0 (buf!1126 (_2!1734 lt!48009)) lt!48010))))

(declare-fun lt!48018 () Unit!2427)

(assert (=> b!32376 (= lt!48018 lt!48043)))

(declare-fun b!32377 () Bool)

(declare-fun res!27645 () Bool)

(assert (=> b!32377 (=> (not res!27645) (not e!21393))))

(assert (=> b!32377 (= res!27645 (= (size!798 (buf!1126 (_2!1734 lt!48036))) (size!798 (buf!1126 (_2!1734 lt!47038)))))))

(declare-fun b!32378 () Bool)

(declare-fun lt!48005 () tuple2!3296)

(assert (=> b!32378 (= e!21393 (= (bitStreamReadBitsIntoList!0 (_2!1734 lt!48036) (_1!1735 lt!48005) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1734 lt!48036) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!32378 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32378 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!48019 () Unit!2427)

(declare-fun lt!48040 () Unit!2427)

(assert (=> b!32378 (= lt!48019 lt!48040)))

(assert (=> b!32378 (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!48036)))) ((_ sign_extend 32) (currentByte!2487 (_2!1734 lt!47038))) ((_ sign_extend 32) (currentBit!2482 (_2!1734 lt!47038))) lt!48013)))

(assert (=> b!32378 (= lt!48040 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1734 lt!47038) (buf!1126 (_2!1734 lt!48036)) lt!48013))))

(assert (=> b!32378 e!21394))

(declare-fun res!27646 () Bool)

(assert (=> b!32378 (=> (not res!27646) (not e!21394))))

(assert (=> b!32378 (= res!27646 (and (= (size!798 (buf!1126 (_2!1734 lt!47038))) (size!798 (buf!1126 (_2!1734 lt!48036)))) (bvsge lt!48013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32378 (= lt!48013 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!32378 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32378 (= lt!48005 (reader!0 (_2!1734 lt!47038) (_2!1734 lt!48036)))))

(declare-fun d!9474 () Bool)

(assert (=> d!9474 e!21393))

(declare-fun res!27648 () Bool)

(assert (=> d!9474 (=> (not res!27648) (not e!21393))))

(declare-fun lt!48029 () (_ BitVec 64))

(assert (=> d!9474 (= res!27648 (= (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!48036))) (currentByte!2487 (_2!1734 lt!48036)) (currentBit!2482 (_2!1734 lt!48036))) (bvsub lt!48029 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9474 (or (= (bvand lt!48029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!48029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!48029 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!48023 () (_ BitVec 64))

(assert (=> d!9474 (= lt!48029 (bvadd lt!48023 to!314))))

(assert (=> d!9474 (or (not (= (bvand lt!48023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!48023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!48023 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9474 (= lt!48023 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(assert (=> d!9474 (= lt!48036 e!21392)))

(assert (=> d!9474 (= c!2223 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!48017 () Unit!2427)

(declare-fun lt!48035 () Unit!2427)

(assert (=> d!9474 (= lt!48017 lt!48035)))

(assert (=> d!9474 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!47038))))

(assert (=> d!9474 (= lt!48035 (lemmaIsPrefixRefl!0 (_2!1734 lt!47038)))))

(assert (=> d!9474 (= lt!48010 (bitIndex!0 (size!798 (buf!1126 (_2!1734 lt!47038))) (currentByte!2487 (_2!1734 lt!47038)) (currentBit!2482 (_2!1734 lt!47038))))))

(assert (=> d!9474 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9474 (= (appendBitsMSBFirstLoop!0 (_2!1734 lt!47038) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!48036)))

(declare-fun b!32379 () Bool)

(declare-fun res!27643 () Bool)

(assert (=> b!32379 (=> (not res!27643) (not e!21393))))

(assert (=> b!32379 (= res!27643 (isPrefixOf!0 (_2!1734 lt!47038) (_2!1734 lt!48036)))))

(declare-fun b!32380 () Bool)

(declare-fun Unit!2457 () Unit!2427)

(assert (=> b!32380 (= e!21392 (tuple2!3295 Unit!2457 (_2!1734 lt!47038)))))

(assert (=> b!32380 (= (size!798 (buf!1126 (_2!1734 lt!47038))) (size!798 (buf!1126 (_2!1734 lt!47038))))))

(declare-fun lt!48028 () Unit!2427)

(declare-fun Unit!2458 () Unit!2427)

(assert (=> b!32380 (= lt!48028 Unit!2458)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1394 array!1815 array!1815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32380 (checkByteArrayBitContent!0 (_2!1734 lt!47038) srcBuffer!2 (_1!1747 (readBits!0 (_1!1735 call!418) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!9474 c!2223) b!32376))

(assert (= (and d!9474 (not c!2223)) b!32380))

(assert (= (or b!32376 b!32380) bm!415))

(assert (= (and d!9474 res!27648) b!32374))

(assert (= (and b!32374 res!27647) b!32373))

(assert (= (and b!32373 res!27644) b!32379))

(assert (= (and b!32379 res!27643) b!32377))

(assert (= (and b!32377 res!27645) b!32378))

(assert (= (and b!32378 res!27646) b!32375))

(declare-fun m!47877 () Bool)

(assert (=> bm!415 m!47877))

(declare-fun m!47879 () Bool)

(assert (=> b!32376 m!47879))

(declare-fun m!47881 () Bool)

(assert (=> b!32376 m!47881))

(declare-fun m!47883 () Bool)

(assert (=> b!32376 m!47883))

(declare-fun m!47885 () Bool)

(assert (=> b!32376 m!47885))

(declare-fun m!47887 () Bool)

(assert (=> b!32376 m!47887))

(declare-fun m!47889 () Bool)

(assert (=> b!32376 m!47889))

(declare-fun m!47891 () Bool)

(assert (=> b!32376 m!47891))

(declare-fun m!47893 () Bool)

(assert (=> b!32376 m!47893))

(assert (=> b!32376 m!47085))

(declare-fun m!47895 () Bool)

(assert (=> b!32376 m!47895))

(declare-fun m!47897 () Bool)

(assert (=> b!32376 m!47897))

(declare-fun m!47899 () Bool)

(assert (=> b!32376 m!47899))

(declare-fun m!47901 () Bool)

(assert (=> b!32376 m!47901))

(declare-fun m!47903 () Bool)

(assert (=> b!32376 m!47903))

(declare-fun m!47905 () Bool)

(assert (=> b!32376 m!47905))

(assert (=> b!32376 m!47893))

(declare-fun m!47907 () Bool)

(assert (=> b!32376 m!47907))

(declare-fun m!47909 () Bool)

(assert (=> b!32376 m!47909))

(declare-fun m!47911 () Bool)

(assert (=> b!32376 m!47911))

(declare-fun m!47913 () Bool)

(assert (=> b!32376 m!47913))

(declare-fun m!47915 () Bool)

(assert (=> b!32376 m!47915))

(declare-fun m!47917 () Bool)

(assert (=> b!32376 m!47917))

(declare-fun m!47919 () Bool)

(assert (=> b!32376 m!47919))

(declare-fun m!47921 () Bool)

(assert (=> b!32376 m!47921))

(assert (=> b!32376 m!47909))

(declare-fun m!47923 () Bool)

(assert (=> b!32376 m!47923))

(assert (=> b!32376 m!47903))

(declare-fun m!47925 () Bool)

(assert (=> b!32376 m!47925))

(declare-fun m!47927 () Bool)

(assert (=> b!32376 m!47927))

(declare-fun m!47929 () Bool)

(assert (=> b!32376 m!47929))

(declare-fun m!47931 () Bool)

(assert (=> b!32376 m!47931))

(declare-fun m!47933 () Bool)

(assert (=> b!32376 m!47933))

(declare-fun m!47935 () Bool)

(assert (=> b!32376 m!47935))

(assert (=> b!32376 m!47883))

(declare-fun m!47937 () Bool)

(assert (=> b!32376 m!47937))

(declare-fun m!47939 () Bool)

(assert (=> b!32376 m!47939))

(declare-fun m!47941 () Bool)

(assert (=> d!9474 m!47941))

(assert (=> d!9474 m!47085))

(assert (=> d!9474 m!47489))

(assert (=> d!9474 m!47483))

(declare-fun m!47943 () Bool)

(assert (=> b!32374 m!47943))

(declare-fun m!47945 () Bool)

(assert (=> b!32375 m!47945))

(declare-fun m!47947 () Bool)

(assert (=> b!32379 m!47947))

(declare-fun m!47949 () Bool)

(assert (=> b!32380 m!47949))

(declare-fun m!47951 () Bool)

(assert (=> b!32380 m!47951))

(declare-fun m!47953 () Bool)

(assert (=> b!32378 m!47953))

(declare-fun m!47955 () Bool)

(assert (=> b!32378 m!47955))

(declare-fun m!47957 () Bool)

(assert (=> b!32378 m!47957))

(declare-fun m!47959 () Bool)

(assert (=> b!32378 m!47959))

(declare-fun m!47961 () Bool)

(assert (=> b!32378 m!47961))

(assert (=> b!31963 d!9474))

(declare-fun d!9566 () Bool)

(assert (=> d!9566 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47034))))

(declare-fun lt!48046 () Unit!2427)

(declare-fun choose!30 (BitStream!1394 BitStream!1394 BitStream!1394) Unit!2427)

(assert (=> d!9566 (= lt!48046 (choose!30 thiss!1379 (_2!1734 lt!47038) (_2!1734 lt!47034)))))

(assert (=> d!9566 (isPrefixOf!0 thiss!1379 (_2!1734 lt!47038))))

(assert (=> d!9566 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1734 lt!47038) (_2!1734 lt!47034)) lt!48046)))

(declare-fun bs!2607 () Bool)

(assert (= bs!2607 d!9566))

(assert (=> bs!2607 m!47091))

(declare-fun m!47963 () Bool)

(assert (=> bs!2607 m!47963))

(assert (=> bs!2607 m!47149))

(assert (=> b!31963 d!9566))

(declare-fun d!9568 () Bool)

(assert (=> d!9568 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!798 (buf!1126 (_2!1734 lt!47038)))) ((_ sign_extend 32) (currentByte!2487 thiss!1379)) ((_ sign_extend 32) (currentBit!2482 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2608 () Bool)

(assert (= bs!2608 d!9568))

(declare-fun m!47965 () Bool)

(assert (=> bs!2608 m!47965))

(assert (=> b!31963 d!9568))

(declare-fun d!9570 () Bool)

(assert (=> d!9570 (= (head!235 lt!47030) (h!513 lt!47030))))

(assert (=> b!31964 d!9570))

(declare-fun d!9572 () Bool)

(assert (=> d!9572 (= (invariant!0 (currentBit!2482 (_2!1734 lt!47038)) (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47034)))) (and (bvsge (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (bvslt (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000001000) (bvsge (currentByte!2487 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47034)))) (and (= (currentBit!2482 (_2!1734 lt!47038)) #b00000000000000000000000000000000) (= (currentByte!2487 (_2!1734 lt!47038)) (size!798 (buf!1126 (_2!1734 lt!47034))))))))))

(assert (=> b!31953 d!9572))

(push 1)

(assert (not b!32160))

(assert (not d!9566))

(assert (not b!32143))

(assert (not d!9454))

(assert (not b!32186))

(assert (not d!9440))

(assert (not b!32140))

(assert (not b!32223))

(assert (not b!32142))

(assert (not b!32379))

(assert (not b!32216))

(assert (not d!9444))

(assert (not d!9416))

(assert (not b!32141))

(assert (not b!32176))

(assert (not b!32208))

(assert (not b!32220))

(assert (not d!9426))

(assert (not b!32228))

(assert (not d!9470))

(assert (not b!32205))

(assert (not b!32181))

(assert (not d!9434))

(assert (not b!32210))

(assert (not b!32375))

(assert (not b!32157))

(assert (not d!9418))

(assert (not d!9396))

(assert (not b!32206))

(assert (not b!32183))

(assert (not b!32158))

(assert (not bm!415))

(assert (not d!9446))

(assert (not b!32163))

(assert (not d!9422))

(assert (not d!9474))

(assert (not d!9436))

(assert (not b!32374))

(assert (not b!32162))

(assert (not b!32378))

(assert (not b!32207))

(assert (not b!32178))

(assert (not d!9414))

(assert (not d!9456))

(assert (not d!9452))

(assert (not b!32164))

(assert (not d!9568))

(assert (not b!32226))

(assert (not b!32153))

(assert (not b!32227))

(assert (not b!32218))

(assert (not d!9428))

(assert (not b!32225))

(assert (not b!32217))

(assert (not b!32376))

(assert (not b!32159))

(assert (not b!32221))

(assert (not b!32169))

(assert (not b!32380))

(assert (not b!32213))

(assert (not d!9406))

(assert (not d!9420))

(assert (not b!32215))

(assert (not b!32122))

(assert (not b!32209))

(assert (not b!32154))

(assert (not d!9472))

(assert (not b!32204))

(assert (not b!32155))

(assert (not b!32211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

