; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5962 () Bool)

(assert start!5962)

(declare-fun b!26748 () Bool)

(declare-fun e!18134 () Bool)

(declare-fun e!18129 () Bool)

(assert (=> b!26748 (= e!18134 e!18129)))

(declare-fun res!23081 () Bool)

(assert (=> b!26748 (=> res!23081 e!18129)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26748 (= res!23081 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!1699 0))(
  ( (array!1700 (arr!1194 (Array (_ BitVec 32) (_ BitVec 8))) (size!732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1296 0))(
  ( (BitStream!1297 (buf!1059 array!1699) (currentByte!2384 (_ BitVec 32)) (currentBit!2379 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2167 0))(
  ( (Unit!2168) )
))
(declare-datatypes ((tuple2!2958 0))(
  ( (tuple2!2959 (_1!1566 Unit!2167) (_2!1566 BitStream!1296)) )
))
(declare-fun lt!38371 () tuple2!2958)

(declare-fun lt!38376 () (_ BitVec 64))

(declare-datatypes ((tuple2!2960 0))(
  ( (tuple2!2961 (_1!1567 BitStream!1296) (_2!1567 BitStream!1296)) )
))
(declare-fun lt!38368 () tuple2!2960)

(declare-datatypes ((List!349 0))(
  ( (Nil!346) (Cons!345 (h!464 Bool) (t!1099 List!349)) )
))
(declare-fun lt!38364 () List!349)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1296 BitStream!1296 (_ BitVec 64)) List!349)

(assert (=> b!26748 (= lt!38364 (bitStreamReadBitsIntoList!0 (_2!1566 lt!38371) (_1!1567 lt!38368) lt!38376))))

(declare-fun lt!38372 () tuple2!2960)

(declare-fun lt!38366 () List!349)

(assert (=> b!26748 (= lt!38366 (bitStreamReadBitsIntoList!0 (_2!1566 lt!38371) (_1!1567 lt!38372) (bvsub to!314 i!635)))))

(declare-fun lt!38363 () tuple2!2958)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26748 (validate_offset_bits!1 ((_ sign_extend 32) (size!732 (buf!1059 (_2!1566 lt!38371)))) ((_ sign_extend 32) (currentByte!2384 (_2!1566 lt!38363))) ((_ sign_extend 32) (currentBit!2379 (_2!1566 lt!38363))) lt!38376)))

(declare-fun lt!38375 () Unit!2167)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1296 array!1699 (_ BitVec 64)) Unit!2167)

(assert (=> b!26748 (= lt!38375 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1566 lt!38363) (buf!1059 (_2!1566 lt!38371)) lt!38376))))

(declare-fun reader!0 (BitStream!1296 BitStream!1296) tuple2!2960)

(assert (=> b!26748 (= lt!38368 (reader!0 (_2!1566 lt!38363) (_2!1566 lt!38371)))))

(declare-fun thiss!1379 () BitStream!1296)

(assert (=> b!26748 (validate_offset_bits!1 ((_ sign_extend 32) (size!732 (buf!1059 (_2!1566 lt!38371)))) ((_ sign_extend 32) (currentByte!2384 thiss!1379)) ((_ sign_extend 32) (currentBit!2379 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38367 () Unit!2167)

(assert (=> b!26748 (= lt!38367 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1059 (_2!1566 lt!38371)) (bvsub to!314 i!635)))))

(assert (=> b!26748 (= lt!38372 (reader!0 thiss!1379 (_2!1566 lt!38371)))))

(declare-fun b!26749 () Bool)

(declare-fun res!23096 () Bool)

(assert (=> b!26749 (=> res!23096 e!18129)))

(declare-fun isPrefixOf!0 (BitStream!1296 BitStream!1296) Bool)

(assert (=> b!26749 (= res!23096 (not (isPrefixOf!0 (_1!1567 lt!38368) (_2!1566 lt!38371))))))

(declare-fun b!26750 () Bool)

(declare-fun e!18128 () Bool)

(declare-fun e!18133 () Bool)

(assert (=> b!26750 (= e!18128 e!18133)))

(declare-fun res!23089 () Bool)

(assert (=> b!26750 (=> res!23089 e!18133)))

(declare-fun lt!38377 () (_ BitVec 64))

(declare-fun lt!38378 () (_ BitVec 64))

(assert (=> b!26750 (= res!23089 (not (= lt!38377 (bvsub (bvadd lt!38378 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26750 (= lt!38377 (bitIndex!0 (size!732 (buf!1059 (_2!1566 lt!38371))) (currentByte!2384 (_2!1566 lt!38371)) (currentBit!2379 (_2!1566 lt!38371))))))

(declare-fun srcBuffer!2 () array!1699)

(declare-fun e!18125 () Bool)

(declare-fun b!26751 () Bool)

(declare-fun lt!38365 () tuple2!2960)

(declare-fun head!186 (List!349) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1296 array!1699 (_ BitVec 64) (_ BitVec 64)) List!349)

(assert (=> b!26751 (= e!18125 (= (head!186 (byteArrayBitContentToList!0 (_2!1566 lt!38363) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!186 (bitStreamReadBitsIntoList!0 (_2!1566 lt!38363) (_1!1567 lt!38365) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26752 () Bool)

(declare-fun res!23082 () Bool)

(assert (=> b!26752 (=> res!23082 e!18134)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26752 (= res!23082 (not (invariant!0 (currentBit!2379 (_2!1566 lt!38363)) (currentByte!2384 (_2!1566 lt!38363)) (size!732 (buf!1059 (_2!1566 lt!38363))))))))

(declare-fun b!26753 () Bool)

(assert (=> b!26753 (= e!18129 true)))

(declare-fun lt!38369 () (_ BitVec 64))

(assert (=> b!26753 (= lt!38369 (bitIndex!0 (size!732 (buf!1059 (_1!1567 lt!38368))) (currentByte!2384 (_1!1567 lt!38368)) (currentBit!2379 (_1!1567 lt!38368))))))

(declare-fun lt!38373 () (_ BitVec 64))

(assert (=> b!26753 (= lt!38373 (bitIndex!0 (size!732 (buf!1059 (_1!1567 lt!38372))) (currentByte!2384 (_1!1567 lt!38372)) (currentBit!2379 (_1!1567 lt!38372))))))

(declare-fun b!26754 () Bool)

(declare-fun res!23084 () Bool)

(assert (=> b!26754 (=> res!23084 e!18134)))

(assert (=> b!26754 (= res!23084 (not (invariant!0 (currentBit!2379 (_2!1566 lt!38363)) (currentByte!2384 (_2!1566 lt!38363)) (size!732 (buf!1059 (_2!1566 lt!38371))))))))

(declare-fun b!26755 () Bool)

(declare-fun res!23091 () Bool)

(assert (=> b!26755 (=> res!23091 e!18133)))

(assert (=> b!26755 (= res!23091 (not (invariant!0 (currentBit!2379 (_2!1566 lt!38371)) (currentByte!2384 (_2!1566 lt!38371)) (size!732 (buf!1059 (_2!1566 lt!38371))))))))

(declare-fun b!26756 () Bool)

(assert (=> b!26756 (= e!18133 e!18134)))

(declare-fun res!23095 () Bool)

(assert (=> b!26756 (=> res!23095 e!18134)))

(assert (=> b!26756 (= res!23095 (not (= (size!732 (buf!1059 (_2!1566 lt!38363))) (size!732 (buf!1059 (_2!1566 lt!38371))))))))

(declare-fun e!18127 () Bool)

(assert (=> b!26756 e!18127))

(declare-fun res!23079 () Bool)

(assert (=> b!26756 (=> (not res!23079) (not e!18127))))

(assert (=> b!26756 (= res!23079 (= (size!732 (buf!1059 (_2!1566 lt!38371))) (size!732 (buf!1059 thiss!1379))))))

(declare-fun b!26757 () Bool)

(declare-fun res!23097 () Bool)

(assert (=> b!26757 (=> res!23097 e!18133)))

(assert (=> b!26757 (= res!23097 (not (= (size!732 (buf!1059 thiss!1379)) (size!732 (buf!1059 (_2!1566 lt!38371))))))))

(declare-fun b!26758 () Bool)

(declare-fun e!18136 () Bool)

(declare-fun e!18135 () Bool)

(assert (=> b!26758 (= e!18136 (not e!18135))))

(declare-fun res!23092 () Bool)

(assert (=> b!26758 (=> res!23092 e!18135)))

(assert (=> b!26758 (= res!23092 (bvsge i!635 to!314))))

(assert (=> b!26758 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38374 () Unit!2167)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1296) Unit!2167)

(assert (=> b!26758 (= lt!38374 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26758 (= lt!38378 (bitIndex!0 (size!732 (buf!1059 thiss!1379)) (currentByte!2384 thiss!1379) (currentBit!2379 thiss!1379)))))

(declare-fun b!26759 () Bool)

(declare-fun res!23090 () Bool)

(assert (=> b!26759 (=> (not res!23090) (not e!18136))))

(assert (=> b!26759 (= res!23090 (validate_offset_bits!1 ((_ sign_extend 32) (size!732 (buf!1059 thiss!1379))) ((_ sign_extend 32) (currentByte!2384 thiss!1379)) ((_ sign_extend 32) (currentBit!2379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26760 () Bool)

(declare-fun e!18126 () Bool)

(assert (=> b!26760 (= e!18135 e!18126)))

(declare-fun res!23087 () Bool)

(assert (=> b!26760 (=> res!23087 e!18126)))

(assert (=> b!26760 (= res!23087 (not (isPrefixOf!0 thiss!1379 (_2!1566 lt!38363))))))

(assert (=> b!26760 (validate_offset_bits!1 ((_ sign_extend 32) (size!732 (buf!1059 (_2!1566 lt!38363)))) ((_ sign_extend 32) (currentByte!2384 (_2!1566 lt!38363))) ((_ sign_extend 32) (currentBit!2379 (_2!1566 lt!38363))) lt!38376)))

(assert (=> b!26760 (= lt!38376 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38379 () Unit!2167)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1296 BitStream!1296 (_ BitVec 64) (_ BitVec 64)) Unit!2167)

(assert (=> b!26760 (= lt!38379 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1566 lt!38363) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1296 (_ BitVec 8) (_ BitVec 32)) tuple2!2958)

(assert (=> b!26760 (= lt!38363 (appendBitFromByte!0 thiss!1379 (select (arr!1194 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26761 () Bool)

(declare-fun res!23093 () Bool)

(assert (=> b!26761 (=> res!23093 e!18129)))

(declare-fun length!75 (List!349) Int)

(assert (=> b!26761 (= res!23093 (<= (length!75 lt!38366) 0))))

(declare-fun res!23088 () Bool)

(assert (=> start!5962 (=> (not res!23088) (not e!18136))))

(assert (=> start!5962 (= res!23088 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!732 srcBuffer!2))))))))

(assert (=> start!5962 e!18136))

(assert (=> start!5962 true))

(declare-fun array_inv!701 (array!1699) Bool)

(assert (=> start!5962 (array_inv!701 srcBuffer!2)))

(declare-fun e!18130 () Bool)

(declare-fun inv!12 (BitStream!1296) Bool)

(assert (=> start!5962 (and (inv!12 thiss!1379) e!18130)))

(declare-fun b!26762 () Bool)

(assert (=> b!26762 (= e!18127 (= lt!38377 (bvsub (bvsub (bvadd (bitIndex!0 (size!732 (buf!1059 (_2!1566 lt!38363))) (currentByte!2384 (_2!1566 lt!38363)) (currentBit!2379 (_2!1566 lt!38363))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26763 () Bool)

(declare-fun res!23086 () Bool)

(assert (=> b!26763 (=> res!23086 e!18129)))

(assert (=> b!26763 (= res!23086 (not (isPrefixOf!0 (_1!1567 lt!38372) (_1!1567 lt!38368))))))

(declare-fun b!26764 () Bool)

(declare-fun res!23083 () Bool)

(assert (=> b!26764 (=> res!23083 e!18129)))

(assert (=> b!26764 (= res!23083 (not (isPrefixOf!0 (_1!1567 lt!38372) (_2!1566 lt!38371))))))

(declare-fun b!26765 () Bool)

(assert (=> b!26765 (= e!18130 (array_inv!701 (buf!1059 thiss!1379)))))

(declare-fun b!26766 () Bool)

(declare-fun res!23080 () Bool)

(assert (=> b!26766 (=> res!23080 e!18129)))

(assert (=> b!26766 (= res!23080 (or (not (= (buf!1059 (_1!1567 lt!38372)) (buf!1059 (_1!1567 lt!38368)))) (not (= (buf!1059 (_1!1567 lt!38372)) (buf!1059 (_2!1566 lt!38371)))) (bvsge lt!38377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26767 () Bool)

(assert (=> b!26767 (= e!18126 e!18128)))

(declare-fun res!23094 () Bool)

(assert (=> b!26767 (=> res!23094 e!18128)))

(assert (=> b!26767 (= res!23094 (not (isPrefixOf!0 (_2!1566 lt!38363) (_2!1566 lt!38371))))))

(assert (=> b!26767 (isPrefixOf!0 thiss!1379 (_2!1566 lt!38371))))

(declare-fun lt!38380 () Unit!2167)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1296 BitStream!1296 BitStream!1296) Unit!2167)

(assert (=> b!26767 (= lt!38380 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1566 lt!38363) (_2!1566 lt!38371)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1296 array!1699 (_ BitVec 64) (_ BitVec 64)) tuple2!2958)

(assert (=> b!26767 (= lt!38371 (appendBitsMSBFirstLoop!0 (_2!1566 lt!38363) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26767 e!18125))

(declare-fun res!23085 () Bool)

(assert (=> b!26767 (=> (not res!23085) (not e!18125))))

(assert (=> b!26767 (= res!23085 (validate_offset_bits!1 ((_ sign_extend 32) (size!732 (buf!1059 (_2!1566 lt!38363)))) ((_ sign_extend 32) (currentByte!2384 thiss!1379)) ((_ sign_extend 32) (currentBit!2379 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38370 () Unit!2167)

(assert (=> b!26767 (= lt!38370 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1059 (_2!1566 lt!38363)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26767 (= lt!38365 (reader!0 thiss!1379 (_2!1566 lt!38363)))))

(assert (= (and start!5962 res!23088) b!26759))

(assert (= (and b!26759 res!23090) b!26758))

(assert (= (and b!26758 (not res!23092)) b!26760))

(assert (= (and b!26760 (not res!23087)) b!26767))

(assert (= (and b!26767 res!23085) b!26751))

(assert (= (and b!26767 (not res!23094)) b!26750))

(assert (= (and b!26750 (not res!23089)) b!26755))

(assert (= (and b!26755 (not res!23091)) b!26757))

(assert (= (and b!26757 (not res!23097)) b!26756))

(assert (= (and b!26756 res!23079) b!26762))

(assert (= (and b!26756 (not res!23095)) b!26752))

(assert (= (and b!26752 (not res!23082)) b!26754))

(assert (= (and b!26754 (not res!23084)) b!26748))

(assert (= (and b!26748 (not res!23081)) b!26761))

(assert (= (and b!26761 (not res!23093)) b!26764))

(assert (= (and b!26764 (not res!23083)) b!26749))

(assert (= (and b!26749 (not res!23096)) b!26763))

(assert (= (and b!26763 (not res!23086)) b!26766))

(assert (= (and b!26766 (not res!23080)) b!26753))

(assert (= start!5962 b!26765))

(declare-fun m!38349 () Bool)

(assert (=> b!26751 m!38349))

(assert (=> b!26751 m!38349))

(declare-fun m!38351 () Bool)

(assert (=> b!26751 m!38351))

(declare-fun m!38353 () Bool)

(assert (=> b!26751 m!38353))

(assert (=> b!26751 m!38353))

(declare-fun m!38355 () Bool)

(assert (=> b!26751 m!38355))

(declare-fun m!38357 () Bool)

(assert (=> b!26748 m!38357))

(declare-fun m!38359 () Bool)

(assert (=> b!26748 m!38359))

(declare-fun m!38361 () Bool)

(assert (=> b!26748 m!38361))

(declare-fun m!38363 () Bool)

(assert (=> b!26748 m!38363))

(declare-fun m!38365 () Bool)

(assert (=> b!26748 m!38365))

(declare-fun m!38367 () Bool)

(assert (=> b!26748 m!38367))

(declare-fun m!38369 () Bool)

(assert (=> b!26748 m!38369))

(declare-fun m!38371 () Bool)

(assert (=> b!26748 m!38371))

(declare-fun m!38373 () Bool)

(assert (=> b!26759 m!38373))

(declare-fun m!38375 () Bool)

(assert (=> b!26767 m!38375))

(declare-fun m!38377 () Bool)

(assert (=> b!26767 m!38377))

(declare-fun m!38379 () Bool)

(assert (=> b!26767 m!38379))

(declare-fun m!38381 () Bool)

(assert (=> b!26767 m!38381))

(declare-fun m!38383 () Bool)

(assert (=> b!26767 m!38383))

(declare-fun m!38385 () Bool)

(assert (=> b!26767 m!38385))

(declare-fun m!38387 () Bool)

(assert (=> b!26767 m!38387))

(declare-fun m!38389 () Bool)

(assert (=> b!26764 m!38389))

(declare-fun m!38391 () Bool)

(assert (=> b!26763 m!38391))

(declare-fun m!38393 () Bool)

(assert (=> b!26758 m!38393))

(declare-fun m!38395 () Bool)

(assert (=> b!26758 m!38395))

(declare-fun m!38397 () Bool)

(assert (=> b!26758 m!38397))

(declare-fun m!38399 () Bool)

(assert (=> b!26755 m!38399))

(declare-fun m!38401 () Bool)

(assert (=> b!26752 m!38401))

(declare-fun m!38403 () Bool)

(assert (=> start!5962 m!38403))

(declare-fun m!38405 () Bool)

(assert (=> start!5962 m!38405))

(declare-fun m!38407 () Bool)

(assert (=> b!26753 m!38407))

(declare-fun m!38409 () Bool)

(assert (=> b!26753 m!38409))

(declare-fun m!38411 () Bool)

(assert (=> b!26761 m!38411))

(declare-fun m!38413 () Bool)

(assert (=> b!26762 m!38413))

(declare-fun m!38415 () Bool)

(assert (=> b!26754 m!38415))

(declare-fun m!38417 () Bool)

(assert (=> b!26749 m!38417))

(declare-fun m!38419 () Bool)

(assert (=> b!26750 m!38419))

(declare-fun m!38421 () Bool)

(assert (=> b!26765 m!38421))

(declare-fun m!38423 () Bool)

(assert (=> b!26760 m!38423))

(declare-fun m!38425 () Bool)

(assert (=> b!26760 m!38425))

(assert (=> b!26760 m!38423))

(declare-fun m!38427 () Bool)

(assert (=> b!26760 m!38427))

(declare-fun m!38429 () Bool)

(assert (=> b!26760 m!38429))

(declare-fun m!38431 () Bool)

(assert (=> b!26760 m!38431))

(check-sat (not b!26750) (not b!26749) (not b!26758) (not b!26764) (not b!26763) (not b!26767) (not b!26753) (not b!26748) (not b!26755) (not b!26761) (not b!26752) (not b!26759) (not b!26754) (not b!26760) (not b!26765) (not b!26751) (not b!26762) (not start!5962))
