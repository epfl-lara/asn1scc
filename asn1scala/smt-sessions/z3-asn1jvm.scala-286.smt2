; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5698 () Bool)

(assert start!5698)

(declare-fun b!24294 () Bool)

(declare-fun e!16540 () Bool)

(declare-fun e!16545 () Bool)

(assert (=> b!24294 (= e!16540 e!16545)))

(declare-fun res!20955 () Bool)

(assert (=> b!24294 (=> res!20955 e!16545)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!34783 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!34770 () (_ BitVec 64))

(assert (=> b!24294 (= res!20955 (not (= lt!34770 (bvsub (bvadd lt!34783 to!314) i!635))))))

(declare-datatypes ((array!1621 0))(
  ( (array!1622 (arr!1152 (Array (_ BitVec 32) (_ BitVec 8))) (size!696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1224 0))(
  ( (BitStream!1225 (buf!1017 array!1621) (currentByte!2330 (_ BitVec 32)) (currentBit!2325 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2035 0))(
  ( (Unit!2036) )
))
(declare-datatypes ((tuple2!2766 0))(
  ( (tuple2!2767 (_1!1470 Unit!2035) (_2!1470 BitStream!1224)) )
))
(declare-fun lt!34781 () tuple2!2766)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24294 (= lt!34770 (bitIndex!0 (size!696 (buf!1017 (_2!1470 lt!34781))) (currentByte!2330 (_2!1470 lt!34781)) (currentBit!2325 (_2!1470 lt!34781))))))

(declare-fun lt!34774 () tuple2!2766)

(declare-fun b!24295 () Bool)

(declare-fun e!16541 () Bool)

(assert (=> b!24295 (= e!16541 (= lt!34770 (bvsub (bvsub (bvadd (bitIndex!0 (size!696 (buf!1017 (_2!1470 lt!34774))) (currentByte!2330 (_2!1470 lt!34774)) (currentBit!2325 (_2!1470 lt!34774))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24296 () Bool)

(declare-fun e!16547 () Bool)

(declare-fun e!16543 () Bool)

(assert (=> b!24296 (= e!16547 e!16543)))

(declare-fun res!20959 () Bool)

(assert (=> b!24296 (=> res!20959 e!16543)))

(declare-fun thiss!1379 () BitStream!1224)

(declare-fun isPrefixOf!0 (BitStream!1224 BitStream!1224) Bool)

(assert (=> b!24296 (= res!20959 (not (isPrefixOf!0 thiss!1379 (_2!1470 lt!34774))))))

(declare-fun lt!34777 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24296 (validate_offset_bits!1 ((_ sign_extend 32) (size!696 (buf!1017 (_2!1470 lt!34774)))) ((_ sign_extend 32) (currentByte!2330 (_2!1470 lt!34774))) ((_ sign_extend 32) (currentBit!2325 (_2!1470 lt!34774))) lt!34777)))

(assert (=> b!24296 (= lt!34777 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34773 () Unit!2035)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1224 BitStream!1224 (_ BitVec 64) (_ BitVec 64)) Unit!2035)

(assert (=> b!24296 (= lt!34773 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1470 lt!34774) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1621)

(declare-fun appendBitFromByte!0 (BitStream!1224 (_ BitVec 8) (_ BitVec 32)) tuple2!2766)

(assert (=> b!24296 (= lt!34774 (appendBitFromByte!0 thiss!1379 (select (arr!1152 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!20956 () Bool)

(declare-fun e!16546 () Bool)

(assert (=> start!5698 (=> (not res!20956) (not e!16546))))

(assert (=> start!5698 (= res!20956 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!696 srcBuffer!2))))))))

(assert (=> start!5698 e!16546))

(assert (=> start!5698 true))

(declare-fun array_inv!665 (array!1621) Bool)

(assert (=> start!5698 (array_inv!665 srcBuffer!2)))

(declare-fun e!16548 () Bool)

(declare-fun inv!12 (BitStream!1224) Bool)

(assert (=> start!5698 (and (inv!12 thiss!1379) e!16548)))

(declare-fun b!24297 () Bool)

(declare-fun res!20961 () Bool)

(declare-fun e!16544 () Bool)

(assert (=> b!24297 (=> res!20961 e!16544)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24297 (= res!20961 (not (invariant!0 (currentBit!2325 (_2!1470 lt!34774)) (currentByte!2330 (_2!1470 lt!34774)) (size!696 (buf!1017 (_2!1470 lt!34781))))))))

(declare-fun b!24298 () Bool)

(assert (=> b!24298 (= e!16544 true)))

(assert (=> b!24298 (validate_offset_bits!1 ((_ sign_extend 32) (size!696 (buf!1017 (_2!1470 lt!34781)))) ((_ sign_extend 32) (currentByte!2330 (_2!1470 lt!34774))) ((_ sign_extend 32) (currentBit!2325 (_2!1470 lt!34774))) lt!34777)))

(declare-fun lt!34776 () Unit!2035)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1224 array!1621 (_ BitVec 64)) Unit!2035)

(assert (=> b!24298 (= lt!34776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1470 lt!34774) (buf!1017 (_2!1470 lt!34781)) lt!34777))))

(declare-datatypes ((tuple2!2768 0))(
  ( (tuple2!2769 (_1!1471 BitStream!1224) (_2!1471 BitStream!1224)) )
))
(declare-fun lt!34779 () tuple2!2768)

(declare-fun reader!0 (BitStream!1224 BitStream!1224) tuple2!2768)

(assert (=> b!24298 (= lt!34779 (reader!0 (_2!1470 lt!34774) (_2!1470 lt!34781)))))

(assert (=> b!24298 (validate_offset_bits!1 ((_ sign_extend 32) (size!696 (buf!1017 (_2!1470 lt!34781)))) ((_ sign_extend 32) (currentByte!2330 thiss!1379)) ((_ sign_extend 32) (currentBit!2325 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34782 () Unit!2035)

(assert (=> b!24298 (= lt!34782 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1017 (_2!1470 lt!34781)) (bvsub to!314 i!635)))))

(declare-fun lt!34778 () tuple2!2768)

(assert (=> b!24298 (= lt!34778 (reader!0 thiss!1379 (_2!1470 lt!34781)))))

(declare-fun b!24299 () Bool)

(assert (=> b!24299 (= e!16546 (not e!16547))))

(declare-fun res!20957 () Bool)

(assert (=> b!24299 (=> res!20957 e!16547)))

(assert (=> b!24299 (= res!20957 (bvsge i!635 to!314))))

(assert (=> b!24299 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34771 () Unit!2035)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1224) Unit!2035)

(assert (=> b!24299 (= lt!34771 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24299 (= lt!34783 (bitIndex!0 (size!696 (buf!1017 thiss!1379)) (currentByte!2330 thiss!1379) (currentBit!2325 thiss!1379)))))

(declare-fun b!24300 () Bool)

(declare-fun e!16542 () Bool)

(declare-fun lt!34775 () tuple2!2768)

(declare-datatypes ((List!313 0))(
  ( (Nil!310) (Cons!309 (h!428 Bool) (t!1063 List!313)) )
))
(declare-fun head!150 (List!313) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1224 array!1621 (_ BitVec 64) (_ BitVec 64)) List!313)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1224 BitStream!1224 (_ BitVec 64)) List!313)

(assert (=> b!24300 (= e!16542 (= (head!150 (byteArrayBitContentToList!0 (_2!1470 lt!34774) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!150 (bitStreamReadBitsIntoList!0 (_2!1470 lt!34774) (_1!1471 lt!34775) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24301 () Bool)

(declare-fun res!20958 () Bool)

(assert (=> b!24301 (=> res!20958 e!16545)))

(assert (=> b!24301 (= res!20958 (not (= (size!696 (buf!1017 thiss!1379)) (size!696 (buf!1017 (_2!1470 lt!34781))))))))

(declare-fun b!24302 () Bool)

(declare-fun res!20962 () Bool)

(assert (=> b!24302 (=> res!20962 e!16545)))

(assert (=> b!24302 (= res!20962 (not (invariant!0 (currentBit!2325 (_2!1470 lt!34781)) (currentByte!2330 (_2!1470 lt!34781)) (size!696 (buf!1017 (_2!1470 lt!34781))))))))

(declare-fun b!24303 () Bool)

(assert (=> b!24303 (= e!16545 e!16544)))

(declare-fun res!20960 () Bool)

(assert (=> b!24303 (=> res!20960 e!16544)))

(assert (=> b!24303 (= res!20960 (not (= (size!696 (buf!1017 (_2!1470 lt!34774))) (size!696 (buf!1017 (_2!1470 lt!34781))))))))

(assert (=> b!24303 e!16541))

(declare-fun res!20966 () Bool)

(assert (=> b!24303 (=> (not res!20966) (not e!16541))))

(assert (=> b!24303 (= res!20966 (= (size!696 (buf!1017 (_2!1470 lt!34781))) (size!696 (buf!1017 thiss!1379))))))

(declare-fun b!24304 () Bool)

(declare-fun res!20963 () Bool)

(assert (=> b!24304 (=> (not res!20963) (not e!16546))))

(assert (=> b!24304 (= res!20963 (validate_offset_bits!1 ((_ sign_extend 32) (size!696 (buf!1017 thiss!1379))) ((_ sign_extend 32) (currentByte!2330 thiss!1379)) ((_ sign_extend 32) (currentBit!2325 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24305 () Bool)

(assert (=> b!24305 (= e!16543 e!16540)))

(declare-fun res!20964 () Bool)

(assert (=> b!24305 (=> res!20964 e!16540)))

(assert (=> b!24305 (= res!20964 (not (isPrefixOf!0 (_2!1470 lt!34774) (_2!1470 lt!34781))))))

(assert (=> b!24305 (isPrefixOf!0 thiss!1379 (_2!1470 lt!34781))))

(declare-fun lt!34780 () Unit!2035)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1224 BitStream!1224 BitStream!1224) Unit!2035)

(assert (=> b!24305 (= lt!34780 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1470 lt!34774) (_2!1470 lt!34781)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1224 array!1621 (_ BitVec 64) (_ BitVec 64)) tuple2!2766)

(assert (=> b!24305 (= lt!34781 (appendBitsMSBFirstLoop!0 (_2!1470 lt!34774) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24305 e!16542))

(declare-fun res!20967 () Bool)

(assert (=> b!24305 (=> (not res!20967) (not e!16542))))

(assert (=> b!24305 (= res!20967 (validate_offset_bits!1 ((_ sign_extend 32) (size!696 (buf!1017 (_2!1470 lt!34774)))) ((_ sign_extend 32) (currentByte!2330 thiss!1379)) ((_ sign_extend 32) (currentBit!2325 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34772 () Unit!2035)

(assert (=> b!24305 (= lt!34772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1017 (_2!1470 lt!34774)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24305 (= lt!34775 (reader!0 thiss!1379 (_2!1470 lt!34774)))))

(declare-fun b!24306 () Bool)

(declare-fun res!20965 () Bool)

(assert (=> b!24306 (=> res!20965 e!16544)))

(assert (=> b!24306 (= res!20965 (not (invariant!0 (currentBit!2325 (_2!1470 lt!34774)) (currentByte!2330 (_2!1470 lt!34774)) (size!696 (buf!1017 (_2!1470 lt!34774))))))))

(declare-fun b!24307 () Bool)

(assert (=> b!24307 (= e!16548 (array_inv!665 (buf!1017 thiss!1379)))))

(assert (= (and start!5698 res!20956) b!24304))

(assert (= (and b!24304 res!20963) b!24299))

(assert (= (and b!24299 (not res!20957)) b!24296))

(assert (= (and b!24296 (not res!20959)) b!24305))

(assert (= (and b!24305 res!20967) b!24300))

(assert (= (and b!24305 (not res!20964)) b!24294))

(assert (= (and b!24294 (not res!20955)) b!24302))

(assert (= (and b!24302 (not res!20962)) b!24301))

(assert (= (and b!24301 (not res!20958)) b!24303))

(assert (= (and b!24303 res!20966) b!24295))

(assert (= (and b!24303 (not res!20960)) b!24306))

(assert (= (and b!24306 (not res!20965)) b!24297))

(assert (= (and b!24297 (not res!20961)) b!24298))

(assert (= start!5698 b!24307))

(declare-fun m!34277 () Bool)

(assert (=> b!24295 m!34277))

(declare-fun m!34279 () Bool)

(assert (=> b!24299 m!34279))

(declare-fun m!34281 () Bool)

(assert (=> b!24299 m!34281))

(declare-fun m!34283 () Bool)

(assert (=> b!24299 m!34283))

(declare-fun m!34285 () Bool)

(assert (=> b!24296 m!34285))

(declare-fun m!34287 () Bool)

(assert (=> b!24296 m!34287))

(assert (=> b!24296 m!34287))

(declare-fun m!34289 () Bool)

(assert (=> b!24296 m!34289))

(declare-fun m!34291 () Bool)

(assert (=> b!24296 m!34291))

(declare-fun m!34293 () Bool)

(assert (=> b!24296 m!34293))

(declare-fun m!34295 () Bool)

(assert (=> b!24307 m!34295))

(declare-fun m!34297 () Bool)

(assert (=> b!24305 m!34297))

(declare-fun m!34299 () Bool)

(assert (=> b!24305 m!34299))

(declare-fun m!34301 () Bool)

(assert (=> b!24305 m!34301))

(declare-fun m!34303 () Bool)

(assert (=> b!24305 m!34303))

(declare-fun m!34305 () Bool)

(assert (=> b!24305 m!34305))

(declare-fun m!34307 () Bool)

(assert (=> b!24305 m!34307))

(declare-fun m!34309 () Bool)

(assert (=> b!24305 m!34309))

(declare-fun m!34311 () Bool)

(assert (=> start!5698 m!34311))

(declare-fun m!34313 () Bool)

(assert (=> start!5698 m!34313))

(declare-fun m!34315 () Bool)

(assert (=> b!24300 m!34315))

(assert (=> b!24300 m!34315))

(declare-fun m!34317 () Bool)

(assert (=> b!24300 m!34317))

(declare-fun m!34319 () Bool)

(assert (=> b!24300 m!34319))

(assert (=> b!24300 m!34319))

(declare-fun m!34321 () Bool)

(assert (=> b!24300 m!34321))

(declare-fun m!34323 () Bool)

(assert (=> b!24306 m!34323))

(declare-fun m!34325 () Bool)

(assert (=> b!24304 m!34325))

(declare-fun m!34327 () Bool)

(assert (=> b!24302 m!34327))

(declare-fun m!34329 () Bool)

(assert (=> b!24298 m!34329))

(declare-fun m!34331 () Bool)

(assert (=> b!24298 m!34331))

(declare-fun m!34333 () Bool)

(assert (=> b!24298 m!34333))

(declare-fun m!34335 () Bool)

(assert (=> b!24298 m!34335))

(declare-fun m!34337 () Bool)

(assert (=> b!24298 m!34337))

(declare-fun m!34339 () Bool)

(assert (=> b!24298 m!34339))

(declare-fun m!34341 () Bool)

(assert (=> b!24294 m!34341))

(declare-fun m!34343 () Bool)

(assert (=> b!24297 m!34343))

(check-sat (not b!24298) (not b!24306) (not b!24299) (not b!24295) (not b!24296) (not b!24307) (not b!24294) (not b!24305) (not b!24302) (not b!24300) (not b!24304) (not b!24297) (not start!5698))
