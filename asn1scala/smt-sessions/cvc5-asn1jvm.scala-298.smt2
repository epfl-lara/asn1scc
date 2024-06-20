; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5960 () Bool)

(assert start!5960)

(declare-datatypes ((array!1697 0))(
  ( (array!1698 (arr!1193 (Array (_ BitVec 32) (_ BitVec 8))) (size!731 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1697)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1294 0))(
  ( (BitStream!1295 (buf!1058 array!1697) (currentByte!2383 (_ BitVec 32)) (currentBit!2378 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2165 0))(
  ( (Unit!2166) )
))
(declare-datatypes ((tuple2!2954 0))(
  ( (tuple2!2955 (_1!1564 Unit!2165) (_2!1564 BitStream!1294)) )
))
(declare-fun lt!38321 () tuple2!2954)

(declare-fun b!26688 () Bool)

(declare-datatypes ((tuple2!2956 0))(
  ( (tuple2!2957 (_1!1565 BitStream!1294) (_2!1565 BitStream!1294)) )
))
(declare-fun lt!38313 () tuple2!2956)

(declare-fun e!18097 () Bool)

(declare-datatypes ((List!348 0))(
  ( (Nil!345) (Cons!344 (h!463 Bool) (t!1098 List!348)) )
))
(declare-fun head!185 (List!348) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1294 array!1697 (_ BitVec 64) (_ BitVec 64)) List!348)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1294 BitStream!1294 (_ BitVec 64)) List!348)

(assert (=> b!26688 (= e!18097 (= (head!185 (byteArrayBitContentToList!0 (_2!1564 lt!38321) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!185 (bitStreamReadBitsIntoList!0 (_2!1564 lt!38321) (_1!1565 lt!38313) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26689 () Bool)

(declare-fun e!18092 () Bool)

(assert (=> b!26689 (= e!18092 true)))

(declare-fun lt!38326 () (_ BitVec 64))

(declare-fun lt!38310 () tuple2!2956)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26689 (= lt!38326 (bitIndex!0 (size!731 (buf!1058 (_1!1565 lt!38310))) (currentByte!2383 (_1!1565 lt!38310)) (currentBit!2378 (_1!1565 lt!38310))))))

(declare-fun lt!38315 () (_ BitVec 64))

(declare-fun lt!38322 () tuple2!2956)

(assert (=> b!26689 (= lt!38315 (bitIndex!0 (size!731 (buf!1058 (_1!1565 lt!38322))) (currentByte!2383 (_1!1565 lt!38322)) (currentBit!2378 (_1!1565 lt!38322))))))

(declare-fun b!26690 () Bool)

(declare-fun res!23029 () Bool)

(declare-fun e!18091 () Bool)

(assert (=> b!26690 (=> res!23029 e!18091)))

(declare-fun lt!38312 () tuple2!2954)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26690 (= res!23029 (not (invariant!0 (currentBit!2378 (_2!1564 lt!38312)) (currentByte!2383 (_2!1564 lt!38312)) (size!731 (buf!1058 (_2!1564 lt!38312))))))))

(declare-fun b!26691 () Bool)

(declare-fun res!23024 () Bool)

(assert (=> b!26691 (=> res!23024 e!18092)))

(declare-fun isPrefixOf!0 (BitStream!1294 BitStream!1294) Bool)

(assert (=> b!26691 (= res!23024 (not (isPrefixOf!0 (_1!1565 lt!38322) (_1!1565 lt!38310))))))

(declare-fun b!26692 () Bool)

(declare-fun e!18098 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!38314 () (_ BitVec 64))

(assert (=> b!26692 (= e!18098 (= lt!38314 (bvsub (bvsub (bvadd (bitIndex!0 (size!731 (buf!1058 (_2!1564 lt!38321))) (currentByte!2383 (_2!1564 lt!38321)) (currentBit!2378 (_2!1564 lt!38321))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26693 () Bool)

(declare-fun res!23040 () Bool)

(assert (=> b!26693 (=> res!23040 e!18092)))

(assert (=> b!26693 (= res!23040 (or (not (= (buf!1058 (_1!1565 lt!38322)) (buf!1058 (_1!1565 lt!38310)))) (not (= (buf!1058 (_1!1565 lt!38322)) (buf!1058 (_2!1564 lt!38312)))) (bvsge lt!38314 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26694 () Bool)

(declare-fun e!18095 () Bool)

(assert (=> b!26694 (= e!18095 e!18091)))

(declare-fun res!23028 () Bool)

(assert (=> b!26694 (=> res!23028 e!18091)))

(declare-fun lt!38319 () (_ BitVec 64))

(assert (=> b!26694 (= res!23028 (not (= lt!38314 (bvsub (bvadd lt!38319 to!314) i!635))))))

(assert (=> b!26694 (= lt!38314 (bitIndex!0 (size!731 (buf!1058 (_2!1564 lt!38312))) (currentByte!2383 (_2!1564 lt!38312)) (currentBit!2378 (_2!1564 lt!38312))))))

(declare-fun b!26695 () Bool)

(declare-fun res!23023 () Bool)

(declare-fun e!18090 () Bool)

(assert (=> b!26695 (=> (not res!23023) (not e!18090))))

(declare-fun thiss!1379 () BitStream!1294)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26695 (= res!23023 (validate_offset_bits!1 ((_ sign_extend 32) (size!731 (buf!1058 thiss!1379))) ((_ sign_extend 32) (currentByte!2383 thiss!1379)) ((_ sign_extend 32) (currentBit!2378 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26696 () Bool)

(declare-fun res!23032 () Bool)

(assert (=> b!26696 (=> res!23032 e!18092)))

(assert (=> b!26696 (= res!23032 (not (isPrefixOf!0 (_1!1565 lt!38310) (_2!1564 lt!38312))))))

(declare-fun b!26697 () Bool)

(declare-fun e!18093 () Bool)

(declare-fun array_inv!700 (array!1697) Bool)

(assert (=> b!26697 (= e!18093 (array_inv!700 (buf!1058 thiss!1379)))))

(declare-fun b!26698 () Bool)

(declare-fun res!23038 () Bool)

(assert (=> b!26698 (=> res!23038 e!18091)))

(assert (=> b!26698 (= res!23038 (not (= (size!731 (buf!1058 thiss!1379)) (size!731 (buf!1058 (_2!1564 lt!38312))))))))

(declare-fun b!26699 () Bool)

(declare-fun e!18089 () Bool)

(declare-fun e!18094 () Bool)

(assert (=> b!26699 (= e!18089 e!18094)))

(declare-fun res!23039 () Bool)

(assert (=> b!26699 (=> res!23039 e!18094)))

(assert (=> b!26699 (= res!23039 (not (isPrefixOf!0 thiss!1379 (_2!1564 lt!38321))))))

(declare-fun lt!38317 () (_ BitVec 64))

(assert (=> b!26699 (validate_offset_bits!1 ((_ sign_extend 32) (size!731 (buf!1058 (_2!1564 lt!38321)))) ((_ sign_extend 32) (currentByte!2383 (_2!1564 lt!38321))) ((_ sign_extend 32) (currentBit!2378 (_2!1564 lt!38321))) lt!38317)))

(assert (=> b!26699 (= lt!38317 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38323 () Unit!2165)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1294 BitStream!1294 (_ BitVec 64) (_ BitVec 64)) Unit!2165)

(assert (=> b!26699 (= lt!38323 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1564 lt!38321) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1294 (_ BitVec 8) (_ BitVec 32)) tuple2!2954)

(assert (=> b!26699 (= lt!38321 (appendBitFromByte!0 thiss!1379 (select (arr!1193 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26700 () Bool)

(declare-fun res!23025 () Bool)

(declare-fun e!18096 () Bool)

(assert (=> b!26700 (=> res!23025 e!18096)))

(assert (=> b!26700 (= res!23025 (not (invariant!0 (currentBit!2378 (_2!1564 lt!38321)) (currentByte!2383 (_2!1564 lt!38321)) (size!731 (buf!1058 (_2!1564 lt!38312))))))))

(declare-fun b!26701 () Bool)

(assert (=> b!26701 (= e!18090 (not e!18089))))

(declare-fun res!23027 () Bool)

(assert (=> b!26701 (=> res!23027 e!18089)))

(assert (=> b!26701 (= res!23027 (bvsge i!635 to!314))))

(assert (=> b!26701 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38325 () Unit!2165)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1294) Unit!2165)

(assert (=> b!26701 (= lt!38325 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26701 (= lt!38319 (bitIndex!0 (size!731 (buf!1058 thiss!1379)) (currentByte!2383 thiss!1379) (currentBit!2378 thiss!1379)))))

(declare-fun b!26702 () Bool)

(declare-fun res!23022 () Bool)

(assert (=> b!26702 (=> res!23022 e!18096)))

(assert (=> b!26702 (= res!23022 (not (invariant!0 (currentBit!2378 (_2!1564 lt!38321)) (currentByte!2383 (_2!1564 lt!38321)) (size!731 (buf!1058 (_2!1564 lt!38321))))))))

(declare-fun b!26703 () Bool)

(declare-fun res!23026 () Bool)

(assert (=> b!26703 (=> res!23026 e!18092)))

(declare-fun lt!38318 () List!348)

(declare-fun length!74 (List!348) Int)

(assert (=> b!26703 (= res!23026 (<= (length!74 lt!38318) 0))))

(declare-fun b!26704 () Bool)

(assert (=> b!26704 (= e!18094 e!18095)))

(declare-fun res!23033 () Bool)

(assert (=> b!26704 (=> res!23033 e!18095)))

(assert (=> b!26704 (= res!23033 (not (isPrefixOf!0 (_2!1564 lt!38321) (_2!1564 lt!38312))))))

(assert (=> b!26704 (isPrefixOf!0 thiss!1379 (_2!1564 lt!38312))))

(declare-fun lt!38311 () Unit!2165)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1294 BitStream!1294 BitStream!1294) Unit!2165)

(assert (=> b!26704 (= lt!38311 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1564 lt!38321) (_2!1564 lt!38312)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1294 array!1697 (_ BitVec 64) (_ BitVec 64)) tuple2!2954)

(assert (=> b!26704 (= lt!38312 (appendBitsMSBFirstLoop!0 (_2!1564 lt!38321) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26704 e!18097))

(declare-fun res!23037 () Bool)

(assert (=> b!26704 (=> (not res!23037) (not e!18097))))

(assert (=> b!26704 (= res!23037 (validate_offset_bits!1 ((_ sign_extend 32) (size!731 (buf!1058 (_2!1564 lt!38321)))) ((_ sign_extend 32) (currentByte!2383 thiss!1379)) ((_ sign_extend 32) (currentBit!2378 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38309 () Unit!2165)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1294 array!1697 (_ BitVec 64)) Unit!2165)

(assert (=> b!26704 (= lt!38309 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1058 (_2!1564 lt!38321)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1294 BitStream!1294) tuple2!2956)

(assert (=> b!26704 (= lt!38313 (reader!0 thiss!1379 (_2!1564 lt!38321)))))

(declare-fun b!26705 () Bool)

(assert (=> b!26705 (= e!18096 e!18092)))

(declare-fun res!23030 () Bool)

(assert (=> b!26705 (=> res!23030 e!18092)))

(assert (=> b!26705 (= res!23030 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38320 () List!348)

(assert (=> b!26705 (= lt!38320 (bitStreamReadBitsIntoList!0 (_2!1564 lt!38312) (_1!1565 lt!38310) lt!38317))))

(assert (=> b!26705 (= lt!38318 (bitStreamReadBitsIntoList!0 (_2!1564 lt!38312) (_1!1565 lt!38322) (bvsub to!314 i!635)))))

(assert (=> b!26705 (validate_offset_bits!1 ((_ sign_extend 32) (size!731 (buf!1058 (_2!1564 lt!38312)))) ((_ sign_extend 32) (currentByte!2383 (_2!1564 lt!38321))) ((_ sign_extend 32) (currentBit!2378 (_2!1564 lt!38321))) lt!38317)))

(declare-fun lt!38316 () Unit!2165)

(assert (=> b!26705 (= lt!38316 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1564 lt!38321) (buf!1058 (_2!1564 lt!38312)) lt!38317))))

(assert (=> b!26705 (= lt!38310 (reader!0 (_2!1564 lt!38321) (_2!1564 lt!38312)))))

(assert (=> b!26705 (validate_offset_bits!1 ((_ sign_extend 32) (size!731 (buf!1058 (_2!1564 lt!38312)))) ((_ sign_extend 32) (currentByte!2383 thiss!1379)) ((_ sign_extend 32) (currentBit!2378 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38324 () Unit!2165)

(assert (=> b!26705 (= lt!38324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1058 (_2!1564 lt!38312)) (bvsub to!314 i!635)))))

(assert (=> b!26705 (= lt!38322 (reader!0 thiss!1379 (_2!1564 lt!38312)))))

(declare-fun b!26706 () Bool)

(assert (=> b!26706 (= e!18091 e!18096)))

(declare-fun res!23031 () Bool)

(assert (=> b!26706 (=> res!23031 e!18096)))

(assert (=> b!26706 (= res!23031 (not (= (size!731 (buf!1058 (_2!1564 lt!38321))) (size!731 (buf!1058 (_2!1564 lt!38312))))))))

(assert (=> b!26706 e!18098))

(declare-fun res!23034 () Bool)

(assert (=> b!26706 (=> (not res!23034) (not e!18098))))

(assert (=> b!26706 (= res!23034 (= (size!731 (buf!1058 (_2!1564 lt!38312))) (size!731 (buf!1058 thiss!1379))))))

(declare-fun res!23035 () Bool)

(assert (=> start!5960 (=> (not res!23035) (not e!18090))))

(assert (=> start!5960 (= res!23035 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!731 srcBuffer!2))))))))

(assert (=> start!5960 e!18090))

(assert (=> start!5960 true))

(assert (=> start!5960 (array_inv!700 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1294) Bool)

(assert (=> start!5960 (and (inv!12 thiss!1379) e!18093)))

(declare-fun b!26707 () Bool)

(declare-fun res!23036 () Bool)

(assert (=> b!26707 (=> res!23036 e!18092)))

(assert (=> b!26707 (= res!23036 (not (isPrefixOf!0 (_1!1565 lt!38322) (_2!1564 lt!38312))))))

(assert (= (and start!5960 res!23035) b!26695))

(assert (= (and b!26695 res!23023) b!26701))

(assert (= (and b!26701 (not res!23027)) b!26699))

(assert (= (and b!26699 (not res!23039)) b!26704))

(assert (= (and b!26704 res!23037) b!26688))

(assert (= (and b!26704 (not res!23033)) b!26694))

(assert (= (and b!26694 (not res!23028)) b!26690))

(assert (= (and b!26690 (not res!23029)) b!26698))

(assert (= (and b!26698 (not res!23038)) b!26706))

(assert (= (and b!26706 res!23034) b!26692))

(assert (= (and b!26706 (not res!23031)) b!26702))

(assert (= (and b!26702 (not res!23022)) b!26700))

(assert (= (and b!26700 (not res!23025)) b!26705))

(assert (= (and b!26705 (not res!23030)) b!26703))

(assert (= (and b!26703 (not res!23026)) b!26707))

(assert (= (and b!26707 (not res!23036)) b!26696))

(assert (= (and b!26696 (not res!23032)) b!26691))

(assert (= (and b!26691 (not res!23024)) b!26693))

(assert (= (and b!26693 (not res!23040)) b!26689))

(assert (= start!5960 b!26697))

(declare-fun m!38265 () Bool)

(assert (=> b!26704 m!38265))

(declare-fun m!38267 () Bool)

(assert (=> b!26704 m!38267))

(declare-fun m!38269 () Bool)

(assert (=> b!26704 m!38269))

(declare-fun m!38271 () Bool)

(assert (=> b!26704 m!38271))

(declare-fun m!38273 () Bool)

(assert (=> b!26704 m!38273))

(declare-fun m!38275 () Bool)

(assert (=> b!26704 m!38275))

(declare-fun m!38277 () Bool)

(assert (=> b!26704 m!38277))

(declare-fun m!38279 () Bool)

(assert (=> start!5960 m!38279))

(declare-fun m!38281 () Bool)

(assert (=> start!5960 m!38281))

(declare-fun m!38283 () Bool)

(assert (=> b!26702 m!38283))

(declare-fun m!38285 () Bool)

(assert (=> b!26688 m!38285))

(assert (=> b!26688 m!38285))

(declare-fun m!38287 () Bool)

(assert (=> b!26688 m!38287))

(declare-fun m!38289 () Bool)

(assert (=> b!26688 m!38289))

(assert (=> b!26688 m!38289))

(declare-fun m!38291 () Bool)

(assert (=> b!26688 m!38291))

(declare-fun m!38293 () Bool)

(assert (=> b!26701 m!38293))

(declare-fun m!38295 () Bool)

(assert (=> b!26701 m!38295))

(declare-fun m!38297 () Bool)

(assert (=> b!26701 m!38297))

(declare-fun m!38299 () Bool)

(assert (=> b!26689 m!38299))

(declare-fun m!38301 () Bool)

(assert (=> b!26689 m!38301))

(declare-fun m!38303 () Bool)

(assert (=> b!26700 m!38303))

(declare-fun m!38305 () Bool)

(assert (=> b!26692 m!38305))

(declare-fun m!38307 () Bool)

(assert (=> b!26707 m!38307))

(declare-fun m!38309 () Bool)

(assert (=> b!26699 m!38309))

(declare-fun m!38311 () Bool)

(assert (=> b!26699 m!38311))

(declare-fun m!38313 () Bool)

(assert (=> b!26699 m!38313))

(declare-fun m!38315 () Bool)

(assert (=> b!26699 m!38315))

(assert (=> b!26699 m!38311))

(declare-fun m!38317 () Bool)

(assert (=> b!26699 m!38317))

(declare-fun m!38319 () Bool)

(assert (=> b!26690 m!38319))

(declare-fun m!38321 () Bool)

(assert (=> b!26696 m!38321))

(declare-fun m!38323 () Bool)

(assert (=> b!26694 m!38323))

(declare-fun m!38325 () Bool)

(assert (=> b!26695 m!38325))

(declare-fun m!38327 () Bool)

(assert (=> b!26697 m!38327))

(declare-fun m!38329 () Bool)

(assert (=> b!26691 m!38329))

(declare-fun m!38331 () Bool)

(assert (=> b!26703 m!38331))

(declare-fun m!38333 () Bool)

(assert (=> b!26705 m!38333))

(declare-fun m!38335 () Bool)

(assert (=> b!26705 m!38335))

(declare-fun m!38337 () Bool)

(assert (=> b!26705 m!38337))

(declare-fun m!38339 () Bool)

(assert (=> b!26705 m!38339))

(declare-fun m!38341 () Bool)

(assert (=> b!26705 m!38341))

(declare-fun m!38343 () Bool)

(assert (=> b!26705 m!38343))

(declare-fun m!38345 () Bool)

(assert (=> b!26705 m!38345))

(declare-fun m!38347 () Bool)

(assert (=> b!26705 m!38347))

(push 1)

