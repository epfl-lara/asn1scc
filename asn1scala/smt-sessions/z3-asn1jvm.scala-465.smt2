; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13262 () Bool)

(assert start!13262)

(declare-fun res!56230 () Bool)

(declare-fun e!44483 () Bool)

(assert (=> start!13262 (=> (not res!56230) (not e!44483))))

(declare-datatypes ((array!2877 0))(
  ( (array!2878 (arr!1905 (Array (_ BitVec 32) (_ BitVec 8))) (size!1332 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2877)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13262 (= res!56230 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1332 srcBuffer!2))))))))

(assert (=> start!13262 e!44483))

(assert (=> start!13262 true))

(declare-fun array_inv!1199 (array!2877) Bool)

(assert (=> start!13262 (array_inv!1199 srcBuffer!2)))

(declare-datatypes ((BitStream!2280 0))(
  ( (BitStream!2281 (buf!1713 array!2877) (currentByte!3403 (_ BitVec 32)) (currentBit!3398 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2280)

(declare-fun e!44494 () Bool)

(declare-fun inv!12 (BitStream!2280) Bool)

(assert (=> start!13262 (and (inv!12 thiss!1379) e!44494)))

(declare-fun b!67968 () Bool)

(declare-fun res!56231 () Bool)

(declare-fun e!44485 () Bool)

(assert (=> b!67968 (=> res!56231 e!44485)))

(declare-fun lt!108604 () (_ BitVec 64))

(declare-datatypes ((Unit!4573 0))(
  ( (Unit!4574) )
))
(declare-datatypes ((tuple2!5968 0))(
  ( (tuple2!5969 (_1!3095 Unit!4573) (_2!3095 BitStream!2280)) )
))
(declare-fun lt!108607 () tuple2!5968)

(declare-fun lt!108600 () Bool)

(declare-fun bitAt!0 (array!2877 (_ BitVec 64)) Bool)

(assert (=> b!67968 (= res!56231 (not (= (bitAt!0 (buf!1713 (_2!3095 lt!108607)) lt!108604) lt!108600)))))

(declare-fun b!67969 () Bool)

(declare-fun res!56243 () Bool)

(assert (=> b!67969 (=> (not res!56243) (not e!44483))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67969 (= res!56243 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!67970 () Bool)

(declare-fun e!44484 () Bool)

(declare-fun e!44493 () Bool)

(assert (=> b!67970 (= e!44484 e!44493)))

(declare-fun res!56226 () Bool)

(assert (=> b!67970 (=> res!56226 e!44493)))

(declare-datatypes ((List!715 0))(
  ( (Nil!712) (Cons!711 (h!830 Bool) (t!1465 List!715)) )
))
(declare-fun lt!108608 () List!715)

(declare-fun lt!108609 () List!715)

(assert (=> b!67970 (= res!56226 (not (= lt!108608 lt!108609)))))

(assert (=> b!67970 (= lt!108609 lt!108608)))

(declare-fun lt!108618 () List!715)

(declare-fun tail!319 (List!715) List!715)

(assert (=> b!67970 (= lt!108608 (tail!319 lt!108618))))

(declare-fun lt!108603 () Unit!4573)

(declare-datatypes ((tuple2!5970 0))(
  ( (tuple2!5971 (_1!3096 BitStream!2280) (_2!3096 BitStream!2280)) )
))
(declare-fun lt!108602 () tuple2!5970)

(declare-fun lt!108606 () tuple2!5970)

(declare-fun lt!108613 () tuple2!5968)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2280 BitStream!2280 BitStream!2280 BitStream!2280 (_ BitVec 64) List!715) Unit!4573)

(assert (=> b!67970 (= lt!108603 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3095 lt!108613) (_2!3095 lt!108613) (_1!3096 lt!108606) (_1!3096 lt!108602) (bvsub to!314 i!635) lt!108618))))

(declare-fun b!67971 () Bool)

(declare-fun res!56242 () Bool)

(declare-fun e!44488 () Bool)

(assert (=> b!67971 (=> res!56242 e!44488)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!67971 (= res!56242 (not (invariant!0 (currentBit!3398 (_2!3095 lt!108607)) (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108607))))))))

(declare-fun b!67972 () Bool)

(declare-fun res!56234 () Bool)

(assert (=> b!67972 (=> res!56234 e!44488)))

(assert (=> b!67972 (= res!56234 (not (invariant!0 (currentBit!3398 (_2!3095 lt!108607)) (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))

(declare-fun b!67973 () Bool)

(declare-fun e!44486 () Bool)

(assert (=> b!67973 (= e!44486 e!44485)))

(declare-fun res!56241 () Bool)

(assert (=> b!67973 (=> res!56241 e!44485)))

(declare-fun head!534 (List!715) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2280 array!2877 (_ BitVec 64) (_ BitVec 64)) List!715)

(assert (=> b!67973 (= res!56241 (not (= (head!534 (byteArrayBitContentToList!0 (_2!3095 lt!108613) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!108600)))))

(assert (=> b!67973 (= lt!108600 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!67974 () Bool)

(declare-fun e!44489 () Bool)

(declare-fun e!44487 () Bool)

(assert (=> b!67974 (= e!44489 e!44487)))

(declare-fun res!56238 () Bool)

(assert (=> b!67974 (=> res!56238 e!44487)))

(declare-fun isPrefixOf!0 (BitStream!2280 BitStream!2280) Bool)

(assert (=> b!67974 (= res!56238 (not (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108613))))))

(assert (=> b!67974 (isPrefixOf!0 thiss!1379 (_2!3095 lt!108613))))

(declare-fun lt!108605 () Unit!4573)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2280 BitStream!2280 BitStream!2280) Unit!4573)

(assert (=> b!67974 (= lt!108605 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3095 lt!108607) (_2!3095 lt!108613)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2280 array!2877 (_ BitVec 64) (_ BitVec 64)) tuple2!5968)

(assert (=> b!67974 (= lt!108613 (appendBitsMSBFirstLoop!0 (_2!3095 lt!108607) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44491 () Bool)

(assert (=> b!67974 e!44491))

(declare-fun res!56227 () Bool)

(assert (=> b!67974 (=> (not res!56227) (not e!44491))))

(assert (=> b!67974 (= res!56227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108610 () Unit!4573)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2280 array!2877 (_ BitVec 64)) Unit!4573)

(assert (=> b!67974 (= lt!108610 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1713 (_2!3095 lt!108607)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108612 () tuple2!5970)

(declare-fun reader!0 (BitStream!2280 BitStream!2280) tuple2!5970)

(assert (=> b!67974 (= lt!108612 (reader!0 thiss!1379 (_2!3095 lt!108607)))))

(declare-fun b!67975 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2280 BitStream!2280 (_ BitVec 64)) List!715)

(assert (=> b!67975 (= e!44491 (= (head!534 (byteArrayBitContentToList!0 (_2!3095 lt!108607) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!534 (bitStreamReadBitsIntoList!0 (_2!3095 lt!108607) (_1!3096 lt!108612) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!67976 () Bool)

(declare-fun lt!108614 () (_ BitVec 64))

(assert (=> b!67976 (= e!44485 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108614))))

(declare-fun b!67977 () Bool)

(declare-fun e!44482 () Bool)

(assert (=> b!67977 (= e!44482 e!44489)))

(declare-fun res!56236 () Bool)

(assert (=> b!67977 (=> res!56236 e!44489)))

(assert (=> b!67977 (= res!56236 (not (isPrefixOf!0 thiss!1379 (_2!3095 lt!108607))))))

(declare-fun lt!108619 () (_ BitVec 64))

(assert (=> b!67977 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!108619)))

(assert (=> b!67977 (= lt!108619 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108611 () Unit!4573)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2280 BitStream!2280 (_ BitVec 64) (_ BitVec 64)) Unit!4573)

(assert (=> b!67977 (= lt!108611 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3095 lt!108607) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2280 (_ BitVec 8) (_ BitVec 32)) tuple2!5968)

(assert (=> b!67977 (= lt!108607 (appendBitFromByte!0 thiss!1379 (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!67978 () Bool)

(declare-fun e!44492 () Bool)

(assert (=> b!67978 (= e!44487 e!44492)))

(declare-fun res!56233 () Bool)

(assert (=> b!67978 (=> res!56233 e!44492)))

(declare-fun lt!108601 () (_ BitVec 64))

(assert (=> b!67978 (= res!56233 (not (= lt!108601 (bvsub (bvadd lt!108604 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!67978 (= lt!108601 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613))))))

(declare-fun b!67979 () Bool)

(declare-fun res!56232 () Bool)

(assert (=> b!67979 (=> res!56232 e!44486)))

(declare-fun lt!108616 () Bool)

(assert (=> b!67979 (= res!56232 (not (= (head!534 lt!108618) lt!108616)))))

(declare-fun b!67980 () Bool)

(assert (=> b!67980 (= e!44492 e!44488)))

(declare-fun res!56237 () Bool)

(assert (=> b!67980 (=> res!56237 e!44488)))

(assert (=> b!67980 (= res!56237 (not (= (size!1332 (buf!1713 (_2!3095 lt!108607))) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))

(assert (=> b!67980 (= lt!108601 (bvsub (bvsub (bvadd lt!108614 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67980 (= lt!108614 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(assert (=> b!67980 (= (size!1332 (buf!1713 (_2!3095 lt!108613))) (size!1332 (buf!1713 thiss!1379)))))

(declare-fun b!67981 () Bool)

(declare-fun res!56228 () Bool)

(assert (=> b!67981 (=> res!56228 e!44492)))

(assert (=> b!67981 (= res!56228 (not (= (size!1332 (buf!1713 thiss!1379)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))

(declare-fun b!67982 () Bool)

(assert (=> b!67982 (= e!44488 e!44484)))

(declare-fun res!56240 () Bool)

(assert (=> b!67982 (=> res!56240 e!44484)))

(assert (=> b!67982 (= res!56240 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!67982 (= lt!108609 (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_1!3096 lt!108602) lt!108619))))

(assert (=> b!67982 (= lt!108618 (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_1!3096 lt!108606) (bvsub to!314 i!635)))))

(assert (=> b!67982 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!108619)))

(declare-fun lt!108615 () Unit!4573)

(assert (=> b!67982 (= lt!108615 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!108613)) lt!108619))))

(assert (=> b!67982 (= lt!108602 (reader!0 (_2!3095 lt!108607) (_2!3095 lt!108613)))))

(assert (=> b!67982 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!108617 () Unit!4573)

(assert (=> b!67982 (= lt!108617 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1713 (_2!3095 lt!108613)) (bvsub to!314 i!635)))))

(assert (=> b!67982 (= lt!108606 (reader!0 thiss!1379 (_2!3095 lt!108613)))))

(declare-fun b!67983 () Bool)

(assert (=> b!67983 (= e!44493 e!44486)))

(declare-fun res!56235 () Bool)

(assert (=> b!67983 (=> res!56235 e!44486)))

(assert (=> b!67983 (= res!56235 (not (= lt!108616 (bitAt!0 (buf!1713 (_1!3096 lt!108602)) lt!108604))))))

(assert (=> b!67983 (= lt!108616 (bitAt!0 (buf!1713 (_1!3096 lt!108606)) lt!108604))))

(declare-fun b!67984 () Bool)

(declare-fun res!56239 () Bool)

(assert (=> b!67984 (=> res!56239 e!44484)))

(declare-fun length!343 (List!715) Int)

(assert (=> b!67984 (= res!56239 (<= (length!343 lt!108618) 0))))

(declare-fun b!67985 () Bool)

(assert (=> b!67985 (= e!44483 (not e!44482))))

(declare-fun res!56244 () Bool)

(assert (=> b!67985 (=> res!56244 e!44482)))

(assert (=> b!67985 (= res!56244 (bvsge i!635 to!314))))

(assert (=> b!67985 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!108599 () Unit!4573)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2280) Unit!4573)

(assert (=> b!67985 (= lt!108599 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!67985 (= lt!108604 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(declare-fun b!67986 () Bool)

(assert (=> b!67986 (= e!44494 (array_inv!1199 (buf!1713 thiss!1379)))))

(declare-fun b!67987 () Bool)

(declare-fun res!56229 () Bool)

(assert (=> b!67987 (=> res!56229 e!44492)))

(assert (=> b!67987 (= res!56229 (not (invariant!0 (currentBit!3398 (_2!3095 lt!108613)) (currentByte!3403 (_2!3095 lt!108613)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))

(assert (= (and start!13262 res!56230) b!67969))

(assert (= (and b!67969 res!56243) b!67985))

(assert (= (and b!67985 (not res!56244)) b!67977))

(assert (= (and b!67977 (not res!56236)) b!67974))

(assert (= (and b!67974 res!56227) b!67975))

(assert (= (and b!67974 (not res!56238)) b!67978))

(assert (= (and b!67978 (not res!56233)) b!67987))

(assert (= (and b!67987 (not res!56229)) b!67981))

(assert (= (and b!67981 (not res!56228)) b!67980))

(assert (= (and b!67980 (not res!56237)) b!67971))

(assert (= (and b!67971 (not res!56242)) b!67972))

(assert (= (and b!67972 (not res!56234)) b!67982))

(assert (= (and b!67982 (not res!56240)) b!67984))

(assert (= (and b!67984 (not res!56239)) b!67970))

(assert (= (and b!67970 (not res!56226)) b!67983))

(assert (= (and b!67983 (not res!56235)) b!67979))

(assert (= (and b!67979 (not res!56232)) b!67973))

(assert (= (and b!67973 (not res!56241)) b!67968))

(assert (= (and b!67968 (not res!56231)) b!67976))

(assert (= start!13262 b!67986))

(declare-fun m!108387 () Bool)

(assert (=> b!67986 m!108387))

(declare-fun m!108389 () Bool)

(assert (=> b!67985 m!108389))

(declare-fun m!108391 () Bool)

(assert (=> b!67985 m!108391))

(declare-fun m!108393 () Bool)

(assert (=> b!67985 m!108393))

(declare-fun m!108395 () Bool)

(assert (=> b!67984 m!108395))

(declare-fun m!108397 () Bool)

(assert (=> b!67980 m!108397))

(declare-fun m!108399 () Bool)

(assert (=> b!67974 m!108399))

(declare-fun m!108401 () Bool)

(assert (=> b!67974 m!108401))

(declare-fun m!108403 () Bool)

(assert (=> b!67974 m!108403))

(declare-fun m!108405 () Bool)

(assert (=> b!67974 m!108405))

(declare-fun m!108407 () Bool)

(assert (=> b!67974 m!108407))

(declare-fun m!108409 () Bool)

(assert (=> b!67974 m!108409))

(declare-fun m!108411 () Bool)

(assert (=> b!67974 m!108411))

(declare-fun m!108413 () Bool)

(assert (=> b!67982 m!108413))

(declare-fun m!108415 () Bool)

(assert (=> b!67982 m!108415))

(declare-fun m!108417 () Bool)

(assert (=> b!67982 m!108417))

(declare-fun m!108419 () Bool)

(assert (=> b!67982 m!108419))

(declare-fun m!108421 () Bool)

(assert (=> b!67982 m!108421))

(declare-fun m!108423 () Bool)

(assert (=> b!67982 m!108423))

(declare-fun m!108425 () Bool)

(assert (=> b!67982 m!108425))

(declare-fun m!108427 () Bool)

(assert (=> b!67982 m!108427))

(declare-fun m!108429 () Bool)

(assert (=> b!67972 m!108429))

(declare-fun m!108431 () Bool)

(assert (=> b!67973 m!108431))

(assert (=> b!67973 m!108431))

(declare-fun m!108433 () Bool)

(assert (=> b!67973 m!108433))

(declare-fun m!108435 () Bool)

(assert (=> b!67973 m!108435))

(declare-fun m!108437 () Bool)

(assert (=> b!67983 m!108437))

(declare-fun m!108439 () Bool)

(assert (=> b!67983 m!108439))

(declare-fun m!108441 () Bool)

(assert (=> b!67975 m!108441))

(assert (=> b!67975 m!108441))

(declare-fun m!108443 () Bool)

(assert (=> b!67975 m!108443))

(declare-fun m!108445 () Bool)

(assert (=> b!67975 m!108445))

(assert (=> b!67975 m!108445))

(declare-fun m!108447 () Bool)

(assert (=> b!67975 m!108447))

(declare-fun m!108449 () Bool)

(assert (=> b!67971 m!108449))

(declare-fun m!108451 () Bool)

(assert (=> b!67968 m!108451))

(declare-fun m!108453 () Bool)

(assert (=> b!67969 m!108453))

(declare-fun m!108455 () Bool)

(assert (=> b!67979 m!108455))

(declare-fun m!108457 () Bool)

(assert (=> b!67978 m!108457))

(declare-fun m!108459 () Bool)

(assert (=> start!13262 m!108459))

(declare-fun m!108461 () Bool)

(assert (=> start!13262 m!108461))

(declare-fun m!108463 () Bool)

(assert (=> b!67977 m!108463))

(declare-fun m!108465 () Bool)

(assert (=> b!67977 m!108465))

(declare-fun m!108467 () Bool)

(assert (=> b!67977 m!108467))

(declare-fun m!108469 () Bool)

(assert (=> b!67977 m!108469))

(assert (=> b!67977 m!108467))

(declare-fun m!108471 () Bool)

(assert (=> b!67977 m!108471))

(declare-fun m!108473 () Bool)

(assert (=> b!67970 m!108473))

(declare-fun m!108475 () Bool)

(assert (=> b!67970 m!108475))

(declare-fun m!108477 () Bool)

(assert (=> b!67987 m!108477))

(check-sat (not b!67982) (not b!67979) (not b!67974) (not b!67973) (not b!67969) (not b!67983) (not b!67972) (not b!67986) (not b!67977) (not b!67975) (not start!13262) (not b!67984) (not b!67985) (not b!67970) (not b!67980) (not b!67968) (not b!67971) (not b!67987) (not b!67978))
(check-sat)
(get-model)

(declare-fun d!21600 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5222 () Bool)

(assert (= bs!5222 d!21600))

(declare-fun m!108615 () Bool)

(assert (=> bs!5222 m!108615))

(assert (=> b!67969 d!21600))

(declare-fun d!21602 () Bool)

(declare-fun e!44560 () Bool)

(assert (=> d!21602 e!44560))

(declare-fun res!56337 () Bool)

(assert (=> d!21602 (=> (not res!56337) (not e!44560))))

(declare-fun lt!108762 () (_ BitVec 64))

(declare-fun lt!108763 () (_ BitVec 64))

(declare-fun lt!108766 () (_ BitVec 64))

(assert (=> d!21602 (= res!56337 (= lt!108766 (bvsub lt!108762 lt!108763)))))

(assert (=> d!21602 (or (= (bvand lt!108762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108762 lt!108763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21602 (= lt!108763 (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607)))))))

(declare-fun lt!108761 () (_ BitVec 64))

(declare-fun lt!108764 () (_ BitVec 64))

(assert (=> d!21602 (= lt!108762 (bvmul lt!108761 lt!108764))))

(assert (=> d!21602 (or (= lt!108761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!108764 (bvsdiv (bvmul lt!108761 lt!108764) lt!108761)))))

(assert (=> d!21602 (= lt!108764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21602 (= lt!108761 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))))))

(assert (=> d!21602 (= lt!108766 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607)))))))

(assert (=> d!21602 (invariant!0 (currentBit!3398 (_2!3095 lt!108607)) (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108607))))))

(assert (=> d!21602 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))) lt!108766)))

(declare-fun b!68088 () Bool)

(declare-fun res!56336 () Bool)

(assert (=> b!68088 (=> (not res!56336) (not e!44560))))

(assert (=> b!68088 (= res!56336 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108766))))

(declare-fun b!68089 () Bool)

(declare-fun lt!108765 () (_ BitVec 64))

(assert (=> b!68089 (= e!44560 (bvsle lt!108766 (bvmul lt!108765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68089 (or (= lt!108765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!108765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!108765)))))

(assert (=> b!68089 (= lt!108765 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))))))

(assert (= (and d!21602 res!56337) b!68088))

(assert (= (and b!68088 res!56336) b!68089))

(declare-fun m!108617 () Bool)

(assert (=> d!21602 m!108617))

(assert (=> d!21602 m!108449))

(assert (=> b!67980 d!21602))

(declare-fun d!21604 () Bool)

(declare-fun e!44561 () Bool)

(assert (=> d!21604 e!44561))

(declare-fun res!56339 () Bool)

(assert (=> d!21604 (=> (not res!56339) (not e!44561))))

(declare-fun lt!108772 () (_ BitVec 64))

(declare-fun lt!108768 () (_ BitVec 64))

(declare-fun lt!108769 () (_ BitVec 64))

(assert (=> d!21604 (= res!56339 (= lt!108772 (bvsub lt!108768 lt!108769)))))

(assert (=> d!21604 (or (= (bvand lt!108768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108769 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108768 lt!108769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21604 (= lt!108769 (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108613))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108613)))))))

(declare-fun lt!108767 () (_ BitVec 64))

(declare-fun lt!108770 () (_ BitVec 64))

(assert (=> d!21604 (= lt!108768 (bvmul lt!108767 lt!108770))))

(assert (=> d!21604 (or (= lt!108767 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!108770 (bvsdiv (bvmul lt!108767 lt!108770) lt!108767)))))

(assert (=> d!21604 (= lt!108770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21604 (= lt!108767 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))))))

(assert (=> d!21604 (= lt!108772 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108613))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108613)))))))

(assert (=> d!21604 (invariant!0 (currentBit!3398 (_2!3095 lt!108613)) (currentByte!3403 (_2!3095 lt!108613)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))

(assert (=> d!21604 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613))) lt!108772)))

(declare-fun b!68090 () Bool)

(declare-fun res!56338 () Bool)

(assert (=> b!68090 (=> (not res!56338) (not e!44561))))

(assert (=> b!68090 (= res!56338 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108772))))

(declare-fun b!68091 () Bool)

(declare-fun lt!108771 () (_ BitVec 64))

(assert (=> b!68091 (= e!44561 (bvsle lt!108772 (bvmul lt!108771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68091 (or (= lt!108771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!108771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!108771)))))

(assert (=> b!68091 (= lt!108771 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))))))

(assert (= (and d!21604 res!56339) b!68090))

(assert (= (and b!68090 res!56338) b!68091))

(declare-fun m!108619 () Bool)

(assert (=> d!21604 m!108619))

(assert (=> d!21604 m!108477))

(assert (=> b!67978 d!21604))

(declare-fun d!21606 () Bool)

(assert (=> d!21606 (= (array_inv!1199 srcBuffer!2) (bvsge (size!1332 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13262 d!21606))

(declare-fun d!21608 () Bool)

(assert (=> d!21608 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3398 thiss!1379) (currentByte!3403 thiss!1379) (size!1332 (buf!1713 thiss!1379))))))

(declare-fun bs!5223 () Bool)

(assert (= bs!5223 d!21608))

(declare-fun m!108621 () Bool)

(assert (=> bs!5223 m!108621))

(assert (=> start!13262 d!21608))

(declare-fun d!21610 () Bool)

(assert (=> d!21610 (= (bitAt!0 (buf!1713 (_2!3095 lt!108607)) lt!108604) (not (= (bvand ((_ sign_extend 24) (select (arr!1905 (buf!1713 (_2!3095 lt!108607))) ((_ extract 31 0) (bvsdiv lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5224 () Bool)

(assert (= bs!5224 d!21610))

(declare-fun m!108623 () Bool)

(assert (=> bs!5224 m!108623))

(declare-fun m!108625 () Bool)

(assert (=> bs!5224 m!108625))

(assert (=> b!67968 d!21610))

(declare-fun d!21612 () Bool)

(assert (=> d!21612 (= (head!534 lt!108618) (h!830 lt!108618))))

(assert (=> b!67979 d!21612))

(declare-fun d!21614 () Bool)

(declare-fun e!44567 () Bool)

(assert (=> d!21614 e!44567))

(declare-fun c!5000 () Bool)

(assert (=> d!21614 (= c!5000 (= lt!108619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108780 () List!715)

(declare-datatypes ((tuple2!5992 0))(
  ( (tuple2!5993 (_1!3107 List!715) (_2!3107 BitStream!2280)) )
))
(declare-fun e!44566 () tuple2!5992)

(assert (=> d!21614 (= lt!108780 (_1!3107 e!44566))))

(declare-fun c!5001 () Bool)

(assert (=> d!21614 (= c!5001 (= lt!108619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21614 (bvsge lt!108619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21614 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_1!3096 lt!108602) lt!108619) lt!108780)))

(declare-fun lt!108779 () (_ BitVec 64))

(declare-datatypes ((tuple2!5994 0))(
  ( (tuple2!5995 (_1!3108 Bool) (_2!3108 BitStream!2280)) )
))
(declare-fun lt!108781 () tuple2!5994)

(declare-fun b!68101 () Bool)

(assert (=> b!68101 (= e!44566 (tuple2!5993 (Cons!711 (_1!3108 lt!108781) (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_2!3108 lt!108781) (bvsub lt!108619 lt!108779))) (_2!3108 lt!108781)))))

(declare-fun readBit!0 (BitStream!2280) tuple2!5994)

(assert (=> b!68101 (= lt!108781 (readBit!0 (_1!3096 lt!108602)))))

(assert (=> b!68101 (= lt!108779 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68100 () Bool)

(assert (=> b!68100 (= e!44566 (tuple2!5993 Nil!712 (_1!3096 lt!108602)))))

(declare-fun b!68102 () Bool)

(declare-fun isEmpty!218 (List!715) Bool)

(assert (=> b!68102 (= e!44567 (isEmpty!218 lt!108780))))

(declare-fun b!68103 () Bool)

(assert (=> b!68103 (= e!44567 (> (length!343 lt!108780) 0))))

(assert (= (and d!21614 c!5001) b!68100))

(assert (= (and d!21614 (not c!5001)) b!68101))

(assert (= (and d!21614 c!5000) b!68102))

(assert (= (and d!21614 (not c!5000)) b!68103))

(declare-fun m!108627 () Bool)

(assert (=> b!68101 m!108627))

(declare-fun m!108629 () Bool)

(assert (=> b!68101 m!108629))

(declare-fun m!108631 () Bool)

(assert (=> b!68102 m!108631))

(declare-fun m!108633 () Bool)

(assert (=> b!68103 m!108633))

(assert (=> b!67982 d!21614))

(declare-fun d!21616 () Bool)

(declare-fun e!44569 () Bool)

(assert (=> d!21616 e!44569))

(declare-fun c!5002 () Bool)

(assert (=> d!21616 (= c!5002 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108783 () List!715)

(declare-fun e!44568 () tuple2!5992)

(assert (=> d!21616 (= lt!108783 (_1!3107 e!44568))))

(declare-fun c!5003 () Bool)

(assert (=> d!21616 (= c!5003 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21616 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21616 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_1!3096 lt!108606) (bvsub to!314 i!635)) lt!108783)))

(declare-fun b!68105 () Bool)

(declare-fun lt!108784 () tuple2!5994)

(declare-fun lt!108782 () (_ BitVec 64))

(assert (=> b!68105 (= e!44568 (tuple2!5993 (Cons!711 (_1!3108 lt!108784) (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_2!3108 lt!108784) (bvsub (bvsub to!314 i!635) lt!108782))) (_2!3108 lt!108784)))))

(assert (=> b!68105 (= lt!108784 (readBit!0 (_1!3096 lt!108606)))))

(assert (=> b!68105 (= lt!108782 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68104 () Bool)

(assert (=> b!68104 (= e!44568 (tuple2!5993 Nil!712 (_1!3096 lt!108606)))))

(declare-fun b!68106 () Bool)

(assert (=> b!68106 (= e!44569 (isEmpty!218 lt!108783))))

(declare-fun b!68107 () Bool)

(assert (=> b!68107 (= e!44569 (> (length!343 lt!108783) 0))))

(assert (= (and d!21616 c!5003) b!68104))

(assert (= (and d!21616 (not c!5003)) b!68105))

(assert (= (and d!21616 c!5002) b!68106))

(assert (= (and d!21616 (not c!5002)) b!68107))

(declare-fun m!108635 () Bool)

(assert (=> b!68105 m!108635))

(declare-fun m!108637 () Bool)

(assert (=> b!68105 m!108637))

(declare-fun m!108639 () Bool)

(assert (=> b!68106 m!108639))

(declare-fun m!108641 () Bool)

(assert (=> b!68107 m!108641))

(assert (=> b!67982 d!21616))

(declare-fun d!21618 () Bool)

(assert (=> d!21618 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5225 () Bool)

(assert (= bs!5225 d!21618))

(declare-fun m!108643 () Bool)

(assert (=> bs!5225 m!108643))

(assert (=> b!67982 d!21618))

(declare-fun lt!108825 () (_ BitVec 64))

(declare-fun lt!108826 () tuple2!5970)

(declare-fun b!68118 () Bool)

(declare-fun lt!108842 () (_ BitVec 64))

(declare-fun e!44574 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2280 (_ BitVec 64)) BitStream!2280)

(assert (=> b!68118 (= e!44574 (= (_1!3096 lt!108826) (withMovedBitIndex!0 (_2!3096 lt!108826) (bvsub lt!108825 lt!108842))))))

(assert (=> b!68118 (or (= (bvand lt!108825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108842 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108825 lt!108842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68118 (= lt!108842 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613))))))

(assert (=> b!68118 (= lt!108825 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(declare-fun b!68119 () Bool)

(declare-fun e!44575 () Unit!4573)

(declare-fun Unit!4596 () Unit!4573)

(assert (=> b!68119 (= e!44575 Unit!4596)))

(declare-fun b!68120 () Bool)

(declare-fun res!56348 () Bool)

(assert (=> b!68120 (=> (not res!56348) (not e!44574))))

(assert (=> b!68120 (= res!56348 (isPrefixOf!0 (_1!3096 lt!108826) (_2!3095 lt!108607)))))

(declare-fun d!21620 () Bool)

(assert (=> d!21620 e!44574))

(declare-fun res!56347 () Bool)

(assert (=> d!21620 (=> (not res!56347) (not e!44574))))

(assert (=> d!21620 (= res!56347 (isPrefixOf!0 (_1!3096 lt!108826) (_2!3096 lt!108826)))))

(declare-fun lt!108843 () BitStream!2280)

(assert (=> d!21620 (= lt!108826 (tuple2!5971 lt!108843 (_2!3095 lt!108613)))))

(declare-fun lt!108834 () Unit!4573)

(declare-fun lt!108827 () Unit!4573)

(assert (=> d!21620 (= lt!108834 lt!108827)))

(assert (=> d!21620 (isPrefixOf!0 lt!108843 (_2!3095 lt!108613))))

(assert (=> d!21620 (= lt!108827 (lemmaIsPrefixTransitive!0 lt!108843 (_2!3095 lt!108613) (_2!3095 lt!108613)))))

(declare-fun lt!108840 () Unit!4573)

(declare-fun lt!108828 () Unit!4573)

(assert (=> d!21620 (= lt!108840 lt!108828)))

(assert (=> d!21620 (isPrefixOf!0 lt!108843 (_2!3095 lt!108613))))

(assert (=> d!21620 (= lt!108828 (lemmaIsPrefixTransitive!0 lt!108843 (_2!3095 lt!108607) (_2!3095 lt!108613)))))

(declare-fun lt!108839 () Unit!4573)

(assert (=> d!21620 (= lt!108839 e!44575)))

(declare-fun c!5006 () Bool)

(assert (=> d!21620 (= c!5006 (not (= (size!1332 (buf!1713 (_2!3095 lt!108607))) #b00000000000000000000000000000000)))))

(declare-fun lt!108829 () Unit!4573)

(declare-fun lt!108837 () Unit!4573)

(assert (=> d!21620 (= lt!108829 lt!108837)))

(assert (=> d!21620 (isPrefixOf!0 (_2!3095 lt!108613) (_2!3095 lt!108613))))

(assert (=> d!21620 (= lt!108837 (lemmaIsPrefixRefl!0 (_2!3095 lt!108613)))))

(declare-fun lt!108836 () Unit!4573)

(declare-fun lt!108844 () Unit!4573)

(assert (=> d!21620 (= lt!108836 lt!108844)))

(assert (=> d!21620 (= lt!108844 (lemmaIsPrefixRefl!0 (_2!3095 lt!108613)))))

(declare-fun lt!108833 () Unit!4573)

(declare-fun lt!108831 () Unit!4573)

(assert (=> d!21620 (= lt!108833 lt!108831)))

(assert (=> d!21620 (isPrefixOf!0 lt!108843 lt!108843)))

(assert (=> d!21620 (= lt!108831 (lemmaIsPrefixRefl!0 lt!108843))))

(declare-fun lt!108841 () Unit!4573)

(declare-fun lt!108830 () Unit!4573)

(assert (=> d!21620 (= lt!108841 lt!108830)))

(assert (=> d!21620 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108607))))

(assert (=> d!21620 (= lt!108830 (lemmaIsPrefixRefl!0 (_2!3095 lt!108607)))))

(assert (=> d!21620 (= lt!108843 (BitStream!2281 (buf!1713 (_2!3095 lt!108613)) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(assert (=> d!21620 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108613))))

(assert (=> d!21620 (= (reader!0 (_2!3095 lt!108607) (_2!3095 lt!108613)) lt!108826)))

(declare-fun b!68121 () Bool)

(declare-fun res!56346 () Bool)

(assert (=> b!68121 (=> (not res!56346) (not e!44574))))

(assert (=> b!68121 (= res!56346 (isPrefixOf!0 (_2!3096 lt!108826) (_2!3095 lt!108613)))))

(declare-fun b!68122 () Bool)

(declare-fun lt!108835 () Unit!4573)

(assert (=> b!68122 (= e!44575 lt!108835)))

(declare-fun lt!108832 () (_ BitVec 64))

(assert (=> b!68122 (= lt!108832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108838 () (_ BitVec 64))

(assert (=> b!68122 (= lt!108838 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2877 array!2877 (_ BitVec 64) (_ BitVec 64)) Unit!4573)

(assert (=> b!68122 (= lt!108835 (arrayBitRangesEqSymmetric!0 (buf!1713 (_2!3095 lt!108607)) (buf!1713 (_2!3095 lt!108613)) lt!108832 lt!108838))))

(declare-fun arrayBitRangesEq!0 (array!2877 array!2877 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68122 (arrayBitRangesEq!0 (buf!1713 (_2!3095 lt!108613)) (buf!1713 (_2!3095 lt!108607)) lt!108832 lt!108838)))

(assert (= (and d!21620 c!5006) b!68122))

(assert (= (and d!21620 (not c!5006)) b!68119))

(assert (= (and d!21620 res!56347) b!68120))

(assert (= (and b!68120 res!56348) b!68121))

(assert (= (and b!68121 res!56346) b!68118))

(declare-fun m!108645 () Bool)

(assert (=> b!68120 m!108645))

(assert (=> b!68122 m!108397))

(declare-fun m!108647 () Bool)

(assert (=> b!68122 m!108647))

(declare-fun m!108649 () Bool)

(assert (=> b!68122 m!108649))

(declare-fun m!108651 () Bool)

(assert (=> b!68118 m!108651))

(assert (=> b!68118 m!108457))

(assert (=> b!68118 m!108397))

(declare-fun m!108653 () Bool)

(assert (=> d!21620 m!108653))

(declare-fun m!108655 () Bool)

(assert (=> d!21620 m!108655))

(declare-fun m!108657 () Bool)

(assert (=> d!21620 m!108657))

(declare-fun m!108659 () Bool)

(assert (=> d!21620 m!108659))

(declare-fun m!108661 () Bool)

(assert (=> d!21620 m!108661))

(declare-fun m!108663 () Bool)

(assert (=> d!21620 m!108663))

(declare-fun m!108665 () Bool)

(assert (=> d!21620 m!108665))

(declare-fun m!108667 () Bool)

(assert (=> d!21620 m!108667))

(assert (=> d!21620 m!108403))

(declare-fun m!108669 () Bool)

(assert (=> d!21620 m!108669))

(declare-fun m!108671 () Bool)

(assert (=> d!21620 m!108671))

(declare-fun m!108673 () Bool)

(assert (=> b!68121 m!108673))

(assert (=> b!67982 d!21620))

(declare-fun d!21622 () Bool)

(assert (=> d!21622 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!108619)))

(declare-fun lt!108847 () Unit!4573)

(declare-fun choose!9 (BitStream!2280 array!2877 (_ BitVec 64) BitStream!2280) Unit!4573)

(assert (=> d!21622 (= lt!108847 (choose!9 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!108613)) lt!108619 (BitStream!2281 (buf!1713 (_2!3095 lt!108613)) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607)))))))

(assert (=> d!21622 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!108613)) lt!108619) lt!108847)))

(declare-fun bs!5226 () Bool)

(assert (= bs!5226 d!21622))

(assert (=> bs!5226 m!108419))

(declare-fun m!108675 () Bool)

(assert (=> bs!5226 m!108675))

(assert (=> b!67982 d!21622))

(declare-fun b!68123 () Bool)

(declare-fun e!44576 () Bool)

(declare-fun lt!108849 () tuple2!5970)

(declare-fun lt!108848 () (_ BitVec 64))

(declare-fun lt!108865 () (_ BitVec 64))

(assert (=> b!68123 (= e!44576 (= (_1!3096 lt!108849) (withMovedBitIndex!0 (_2!3096 lt!108849) (bvsub lt!108848 lt!108865))))))

(assert (=> b!68123 (or (= (bvand lt!108848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108848 lt!108865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68123 (= lt!108865 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613))))))

(assert (=> b!68123 (= lt!108848 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(declare-fun b!68124 () Bool)

(declare-fun e!44577 () Unit!4573)

(declare-fun Unit!4597 () Unit!4573)

(assert (=> b!68124 (= e!44577 Unit!4597)))

(declare-fun b!68125 () Bool)

(declare-fun res!56351 () Bool)

(assert (=> b!68125 (=> (not res!56351) (not e!44576))))

(assert (=> b!68125 (= res!56351 (isPrefixOf!0 (_1!3096 lt!108849) thiss!1379))))

(declare-fun d!21624 () Bool)

(assert (=> d!21624 e!44576))

(declare-fun res!56350 () Bool)

(assert (=> d!21624 (=> (not res!56350) (not e!44576))))

(assert (=> d!21624 (= res!56350 (isPrefixOf!0 (_1!3096 lt!108849) (_2!3096 lt!108849)))))

(declare-fun lt!108866 () BitStream!2280)

(assert (=> d!21624 (= lt!108849 (tuple2!5971 lt!108866 (_2!3095 lt!108613)))))

(declare-fun lt!108857 () Unit!4573)

(declare-fun lt!108850 () Unit!4573)

(assert (=> d!21624 (= lt!108857 lt!108850)))

(assert (=> d!21624 (isPrefixOf!0 lt!108866 (_2!3095 lt!108613))))

(assert (=> d!21624 (= lt!108850 (lemmaIsPrefixTransitive!0 lt!108866 (_2!3095 lt!108613) (_2!3095 lt!108613)))))

(declare-fun lt!108863 () Unit!4573)

(declare-fun lt!108851 () Unit!4573)

(assert (=> d!21624 (= lt!108863 lt!108851)))

(assert (=> d!21624 (isPrefixOf!0 lt!108866 (_2!3095 lt!108613))))

(assert (=> d!21624 (= lt!108851 (lemmaIsPrefixTransitive!0 lt!108866 thiss!1379 (_2!3095 lt!108613)))))

(declare-fun lt!108862 () Unit!4573)

(assert (=> d!21624 (= lt!108862 e!44577)))

(declare-fun c!5007 () Bool)

(assert (=> d!21624 (= c!5007 (not (= (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!108852 () Unit!4573)

(declare-fun lt!108860 () Unit!4573)

(assert (=> d!21624 (= lt!108852 lt!108860)))

(assert (=> d!21624 (isPrefixOf!0 (_2!3095 lt!108613) (_2!3095 lt!108613))))

(assert (=> d!21624 (= lt!108860 (lemmaIsPrefixRefl!0 (_2!3095 lt!108613)))))

(declare-fun lt!108859 () Unit!4573)

(declare-fun lt!108867 () Unit!4573)

(assert (=> d!21624 (= lt!108859 lt!108867)))

(assert (=> d!21624 (= lt!108867 (lemmaIsPrefixRefl!0 (_2!3095 lt!108613)))))

(declare-fun lt!108856 () Unit!4573)

(declare-fun lt!108854 () Unit!4573)

(assert (=> d!21624 (= lt!108856 lt!108854)))

(assert (=> d!21624 (isPrefixOf!0 lt!108866 lt!108866)))

(assert (=> d!21624 (= lt!108854 (lemmaIsPrefixRefl!0 lt!108866))))

(declare-fun lt!108864 () Unit!4573)

(declare-fun lt!108853 () Unit!4573)

(assert (=> d!21624 (= lt!108864 lt!108853)))

(assert (=> d!21624 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21624 (= lt!108853 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21624 (= lt!108866 (BitStream!2281 (buf!1713 (_2!3095 lt!108613)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(assert (=> d!21624 (isPrefixOf!0 thiss!1379 (_2!3095 lt!108613))))

(assert (=> d!21624 (= (reader!0 thiss!1379 (_2!3095 lt!108613)) lt!108849)))

(declare-fun b!68126 () Bool)

(declare-fun res!56349 () Bool)

(assert (=> b!68126 (=> (not res!56349) (not e!44576))))

(assert (=> b!68126 (= res!56349 (isPrefixOf!0 (_2!3096 lt!108849) (_2!3095 lt!108613)))))

(declare-fun b!68127 () Bool)

(declare-fun lt!108858 () Unit!4573)

(assert (=> b!68127 (= e!44577 lt!108858)))

(declare-fun lt!108855 () (_ BitVec 64))

(assert (=> b!68127 (= lt!108855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108861 () (_ BitVec 64))

(assert (=> b!68127 (= lt!108861 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(assert (=> b!68127 (= lt!108858 (arrayBitRangesEqSymmetric!0 (buf!1713 thiss!1379) (buf!1713 (_2!3095 lt!108613)) lt!108855 lt!108861))))

(assert (=> b!68127 (arrayBitRangesEq!0 (buf!1713 (_2!3095 lt!108613)) (buf!1713 thiss!1379) lt!108855 lt!108861)))

(assert (= (and d!21624 c!5007) b!68127))

(assert (= (and d!21624 (not c!5007)) b!68124))

(assert (= (and d!21624 res!56350) b!68125))

(assert (= (and b!68125 res!56351) b!68126))

(assert (= (and b!68126 res!56349) b!68123))

(declare-fun m!108677 () Bool)

(assert (=> b!68125 m!108677))

(assert (=> b!68127 m!108393))

(declare-fun m!108679 () Bool)

(assert (=> b!68127 m!108679))

(declare-fun m!108681 () Bool)

(assert (=> b!68127 m!108681))

(declare-fun m!108683 () Bool)

(assert (=> b!68123 m!108683))

(assert (=> b!68123 m!108457))

(assert (=> b!68123 m!108393))

(declare-fun m!108685 () Bool)

(assert (=> d!21624 m!108685))

(declare-fun m!108687 () Bool)

(assert (=> d!21624 m!108687))

(assert (=> d!21624 m!108657))

(assert (=> d!21624 m!108391))

(declare-fun m!108689 () Bool)

(assert (=> d!21624 m!108689))

(declare-fun m!108691 () Bool)

(assert (=> d!21624 m!108691))

(declare-fun m!108693 () Bool)

(assert (=> d!21624 m!108693))

(declare-fun m!108695 () Bool)

(assert (=> d!21624 m!108695))

(assert (=> d!21624 m!108405))

(assert (=> d!21624 m!108669))

(assert (=> d!21624 m!108389))

(declare-fun m!108697 () Bool)

(assert (=> b!68126 m!108697))

(assert (=> b!67982 d!21624))

(declare-fun d!21626 () Bool)

(assert (=> d!21626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!108868 () Unit!4573)

(assert (=> d!21626 (= lt!108868 (choose!9 thiss!1379 (buf!1713 (_2!3095 lt!108613)) (bvsub to!314 i!635) (BitStream!2281 (buf!1713 (_2!3095 lt!108613)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(assert (=> d!21626 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1713 (_2!3095 lt!108613)) (bvsub to!314 i!635)) lt!108868)))

(declare-fun bs!5227 () Bool)

(assert (= bs!5227 d!21626))

(assert (=> bs!5227 m!108415))

(declare-fun m!108699 () Bool)

(assert (=> bs!5227 m!108699))

(assert (=> b!67982 d!21626))

(declare-fun d!21628 () Bool)

(assert (=> d!21628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!108619) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108613)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607)))) lt!108619))))

(declare-fun bs!5228 () Bool)

(assert (= bs!5228 d!21628))

(declare-fun m!108701 () Bool)

(assert (=> bs!5228 m!108701))

(assert (=> b!67982 d!21628))

(declare-fun d!21630 () Bool)

(assert (=> d!21630 (= (invariant!0 (currentBit!3398 (_2!3095 lt!108607)) (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108613)))) (and (bvsge (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (bvslt (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000001000) (bvsge (currentByte!3403 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108613)))) (and (= (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (= (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))))

(assert (=> b!67972 d!21630))

(declare-fun d!21632 () Bool)

(assert (=> d!21632 (= (bitAt!0 (buf!1713 (_1!3096 lt!108602)) lt!108604) (not (= (bvand ((_ sign_extend 24) (select (arr!1905 (buf!1713 (_1!3096 lt!108602))) ((_ extract 31 0) (bvsdiv lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5229 () Bool)

(assert (= bs!5229 d!21632))

(declare-fun m!108703 () Bool)

(assert (=> bs!5229 m!108703))

(assert (=> bs!5229 m!108625))

(assert (=> b!67983 d!21632))

(declare-fun d!21634 () Bool)

(assert (=> d!21634 (= (bitAt!0 (buf!1713 (_1!3096 lt!108606)) lt!108604) (not (= (bvand ((_ sign_extend 24) (select (arr!1905 (buf!1713 (_1!3096 lt!108606))) ((_ extract 31 0) (bvsdiv lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108604 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5230 () Bool)

(assert (= bs!5230 d!21634))

(declare-fun m!108705 () Bool)

(assert (=> bs!5230 m!108705))

(assert (=> bs!5230 m!108625))

(assert (=> b!67983 d!21634))

(declare-fun d!21636 () Bool)

(assert (=> d!21636 (= (tail!319 lt!108618) (t!1465 lt!108618))))

(assert (=> b!67970 d!21636))

(declare-fun d!21638 () Bool)

(declare-fun e!44580 () Bool)

(assert (=> d!21638 e!44580))

(declare-fun res!56354 () Bool)

(assert (=> d!21638 (=> (not res!56354) (not e!44580))))

(declare-fun lt!108874 () (_ BitVec 64))

(assert (=> d!21638 (= res!56354 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!108874) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21638 (= lt!108874 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108873 () Unit!4573)

(declare-fun choose!42 (BitStream!2280 BitStream!2280 BitStream!2280 BitStream!2280 (_ BitVec 64) List!715) Unit!4573)

(assert (=> d!21638 (= lt!108873 (choose!42 (_2!3095 lt!108613) (_2!3095 lt!108613) (_1!3096 lt!108606) (_1!3096 lt!108602) (bvsub to!314 i!635) lt!108618))))

(assert (=> d!21638 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21638 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3095 lt!108613) (_2!3095 lt!108613) (_1!3096 lt!108606) (_1!3096 lt!108602) (bvsub to!314 i!635) lt!108618) lt!108873)))

(declare-fun b!68130 () Bool)

(assert (=> b!68130 (= e!44580 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!108613) (_1!3096 lt!108602) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!319 lt!108618)))))

(assert (= (and d!21638 res!56354) b!68130))

(declare-fun m!108707 () Bool)

(assert (=> d!21638 m!108707))

(declare-fun m!108709 () Bool)

(assert (=> b!68130 m!108709))

(assert (=> b!68130 m!108473))

(assert (=> b!67970 d!21638))

(declare-fun d!21640 () Bool)

(assert (=> d!21640 (= (invariant!0 (currentBit!3398 (_2!3095 lt!108607)) (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108607)))) (and (bvsge (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (bvslt (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000001000) (bvsge (currentByte!3403 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108607)))) (and (= (currentBit!3398 (_2!3095 lt!108607)) #b00000000000000000000000000000000) (= (currentByte!3403 (_2!3095 lt!108607)) (size!1332 (buf!1713 (_2!3095 lt!108607))))))))))

(assert (=> b!67971 d!21640))

(declare-fun d!21642 () Bool)

(assert (=> d!21642 (isPrefixOf!0 thiss!1379 (_2!3095 lt!108613))))

(declare-fun lt!108877 () Unit!4573)

(declare-fun choose!30 (BitStream!2280 BitStream!2280 BitStream!2280) Unit!4573)

(assert (=> d!21642 (= lt!108877 (choose!30 thiss!1379 (_2!3095 lt!108607) (_2!3095 lt!108613)))))

(assert (=> d!21642 (isPrefixOf!0 thiss!1379 (_2!3095 lt!108607))))

(assert (=> d!21642 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3095 lt!108607) (_2!3095 lt!108613)) lt!108877)))

(declare-fun bs!5231 () Bool)

(assert (= bs!5231 d!21642))

(assert (=> bs!5231 m!108405))

(declare-fun m!108711 () Bool)

(assert (=> bs!5231 m!108711))

(assert (=> bs!5231 m!108469))

(assert (=> b!67974 d!21642))

(declare-fun d!21644 () Bool)

(declare-fun res!56363 () Bool)

(declare-fun e!44586 () Bool)

(assert (=> d!21644 (=> (not res!56363) (not e!44586))))

(assert (=> d!21644 (= res!56363 (= (size!1332 (buf!1713 (_2!3095 lt!108607))) (size!1332 (buf!1713 (_2!3095 lt!108613)))))))

(assert (=> d!21644 (= (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108613)) e!44586)))

(declare-fun b!68137 () Bool)

(declare-fun res!56361 () Bool)

(assert (=> b!68137 (=> (not res!56361) (not e!44586))))

(assert (=> b!68137 (= res!56361 (bvsle (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))) (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613)))))))

(declare-fun b!68138 () Bool)

(declare-fun e!44585 () Bool)

(assert (=> b!68138 (= e!44586 e!44585)))

(declare-fun res!56362 () Bool)

(assert (=> b!68138 (=> res!56362 e!44585)))

(assert (=> b!68138 (= res!56362 (= (size!1332 (buf!1713 (_2!3095 lt!108607))) #b00000000000000000000000000000000))))

(declare-fun b!68139 () Bool)

(assert (=> b!68139 (= e!44585 (arrayBitRangesEq!0 (buf!1713 (_2!3095 lt!108607)) (buf!1713 (_2!3095 lt!108613)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607)))))))

(assert (= (and d!21644 res!56363) b!68137))

(assert (= (and b!68137 res!56361) b!68138))

(assert (= (and b!68138 (not res!56362)) b!68139))

(assert (=> b!68137 m!108397))

(assert (=> b!68137 m!108457))

(assert (=> b!68139 m!108397))

(assert (=> b!68139 m!108397))

(declare-fun m!108713 () Bool)

(assert (=> b!68139 m!108713))

(assert (=> b!67974 d!21644))

(declare-fun d!21646 () Bool)

(declare-fun res!56366 () Bool)

(declare-fun e!44588 () Bool)

(assert (=> d!21646 (=> (not res!56366) (not e!44588))))

(assert (=> d!21646 (= res!56366 (= (size!1332 (buf!1713 thiss!1379)) (size!1332 (buf!1713 (_2!3095 lt!108613)))))))

(assert (=> d!21646 (= (isPrefixOf!0 thiss!1379 (_2!3095 lt!108613)) e!44588)))

(declare-fun b!68140 () Bool)

(declare-fun res!56364 () Bool)

(assert (=> b!68140 (=> (not res!56364) (not e!44588))))

(assert (=> b!68140 (= res!56364 (bvsle (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)) (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108613))) (currentByte!3403 (_2!3095 lt!108613)) (currentBit!3398 (_2!3095 lt!108613)))))))

(declare-fun b!68141 () Bool)

(declare-fun e!44587 () Bool)

(assert (=> b!68141 (= e!44588 e!44587)))

(declare-fun res!56365 () Bool)

(assert (=> b!68141 (=> res!56365 e!44587)))

(assert (=> b!68141 (= res!56365 (= (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68142 () Bool)

(assert (=> b!68142 (= e!44587 (arrayBitRangesEq!0 (buf!1713 thiss!1379) (buf!1713 (_2!3095 lt!108613)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(assert (= (and d!21646 res!56366) b!68140))

(assert (= (and b!68140 res!56364) b!68141))

(assert (= (and b!68141 (not res!56365)) b!68142))

(assert (=> b!68140 m!108393))

(assert (=> b!68140 m!108457))

(assert (=> b!68142 m!108393))

(assert (=> b!68142 m!108393))

(declare-fun m!108715 () Bool)

(assert (=> b!68142 m!108715))

(assert (=> b!67974 d!21646))

(declare-fun b!68395 () Bool)

(declare-fun res!56533 () Bool)

(declare-fun e!44712 () Bool)

(assert (=> b!68395 (=> (not res!56533) (not e!44712))))

(declare-fun lt!109577 () tuple2!5968)

(assert (=> b!68395 (= res!56533 (= (size!1332 (buf!1713 (_2!3095 lt!108607))) (size!1332 (buf!1713 (_2!3095 lt!109577)))))))

(declare-fun b!68396 () Bool)

(declare-fun res!56536 () Bool)

(assert (=> b!68396 (=> (not res!56536) (not e!44712))))

(assert (=> b!68396 (= res!56536 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!109577)))))

(declare-fun b!68397 () Bool)

(declare-fun res!56532 () Bool)

(assert (=> b!68397 (=> (not res!56532) (not e!44712))))

(assert (=> b!68397 (= res!56532 (= (size!1332 (buf!1713 (_2!3095 lt!109577))) (size!1332 (buf!1713 (_2!3095 lt!108607)))))))

(declare-fun d!21648 () Bool)

(assert (=> d!21648 e!44712))

(declare-fun res!56531 () Bool)

(assert (=> d!21648 (=> (not res!56531) (not e!44712))))

(declare-fun lt!109589 () (_ BitVec 64))

(assert (=> d!21648 (= res!56531 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109577))) (currentByte!3403 (_2!3095 lt!109577)) (currentBit!3398 (_2!3095 lt!109577))) (bvsub lt!109589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21648 (or (= (bvand lt!109589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109604 () (_ BitVec 64))

(assert (=> d!21648 (= lt!109589 (bvadd lt!109604 to!314))))

(assert (=> d!21648 (or (not (= (bvand lt!109604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109604 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21648 (= lt!109604 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(declare-fun e!44713 () tuple2!5968)

(assert (=> d!21648 (= lt!109577 e!44713)))

(declare-fun c!5051 () Bool)

(assert (=> d!21648 (= c!5051 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!109583 () Unit!4573)

(declare-fun lt!109582 () Unit!4573)

(assert (=> d!21648 (= lt!109583 lt!109582)))

(assert (=> d!21648 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108607))))

(assert (=> d!21648 (= lt!109582 (lemmaIsPrefixRefl!0 (_2!3095 lt!108607)))))

(declare-fun lt!109607 () (_ BitVec 64))

(assert (=> d!21648 (= lt!109607 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(assert (=> d!21648 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21648 (= (appendBitsMSBFirstLoop!0 (_2!3095 lt!108607) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!109577)))

(declare-fun b!68398 () Bool)

(declare-fun res!56535 () Bool)

(assert (=> b!68398 (=> (not res!56535) (not e!44712))))

(assert (=> b!68398 (= res!56535 (invariant!0 (currentBit!3398 (_2!3095 lt!109577)) (currentByte!3403 (_2!3095 lt!109577)) (size!1332 (buf!1713 (_2!3095 lt!109577)))))))

(declare-fun b!68399 () Bool)

(declare-fun lt!109599 () tuple2!5970)

(assert (=> b!68399 (= e!44712 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!109577) (_1!3096 lt!109599) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3095 lt!109577) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!68399 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68399 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109572 () Unit!4573)

(declare-fun lt!109585 () Unit!4573)

(assert (=> b!68399 (= lt!109572 lt!109585)))

(declare-fun lt!109609 () (_ BitVec 64))

(assert (=> b!68399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!109577)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!109609)))

(assert (=> b!68399 (= lt!109585 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!109577)) lt!109609))))

(declare-fun e!44711 () Bool)

(assert (=> b!68399 e!44711))

(declare-fun res!56534 () Bool)

(assert (=> b!68399 (=> (not res!56534) (not e!44711))))

(assert (=> b!68399 (= res!56534 (and (= (size!1332 (buf!1713 (_2!3095 lt!108607))) (size!1332 (buf!1713 (_2!3095 lt!109577)))) (bvsge lt!109609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68399 (= lt!109609 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!68399 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68399 (= lt!109599 (reader!0 (_2!3095 lt!108607) (_2!3095 lt!109577)))))

(declare-fun bm!877 () Bool)

(declare-fun lt!109566 () tuple2!5968)

(declare-fun call!880 () tuple2!5970)

(declare-fun lt!109574 () tuple2!5968)

(assert (=> bm!877 (= call!880 (reader!0 (ite c!5051 (_2!3095 lt!109566) (_2!3095 lt!108607)) (ite c!5051 (_2!3095 lt!109574) (_2!3095 lt!108607))))))

(declare-fun b!68400 () Bool)

(declare-fun Unit!4599 () Unit!4573)

(assert (=> b!68400 (= e!44713 (tuple2!5969 Unit!4599 (_2!3095 lt!108607)))))

(assert (=> b!68400 (= (size!1332 (buf!1713 (_2!3095 lt!108607))) (size!1332 (buf!1713 (_2!3095 lt!108607))))))

(declare-fun lt!109596 () Unit!4573)

(declare-fun Unit!4600 () Unit!4573)

(assert (=> b!68400 (= lt!109596 Unit!4600)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2280 array!2877 array!2877 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5996 0))(
  ( (tuple2!5997 (_1!3109 array!2877) (_2!3109 BitStream!2280)) )
))
(declare-fun readBits!0 (BitStream!2280 (_ BitVec 64)) tuple2!5996)

(assert (=> b!68400 (checkByteArrayBitContent!0 (_2!3095 lt!108607) srcBuffer!2 (_1!3109 (readBits!0 (_1!3096 call!880) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!68401 () Bool)

(declare-fun Unit!4601 () Unit!4573)

(assert (=> b!68401 (= e!44713 (tuple2!5969 Unit!4601 (_2!3095 lt!109574)))))

(assert (=> b!68401 (= lt!109566 (appendBitFromByte!0 (_2!3095 lt!108607) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!109586 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109586 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109575 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109575 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109598 () Unit!4573)

(assert (=> b!68401 (= lt!109598 (validateOffsetBitsIneqLemma!0 (_2!3095 lt!108607) (_2!3095 lt!109566) lt!109586 lt!109575))))

(assert (=> b!68401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!109566)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!109566))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!109566))) (bvsub lt!109586 lt!109575))))

(declare-fun lt!109606 () Unit!4573)

(assert (=> b!68401 (= lt!109606 lt!109598)))

(declare-fun lt!109569 () tuple2!5970)

(assert (=> b!68401 (= lt!109569 (reader!0 (_2!3095 lt!108607) (_2!3095 lt!109566)))))

(declare-fun lt!109600 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109600 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109602 () Unit!4573)

(assert (=> b!68401 (= lt!109602 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!109566)) lt!109600))))

(assert (=> b!68401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!109566)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!109600)))

(declare-fun lt!109601 () Unit!4573)

(assert (=> b!68401 (= lt!109601 lt!109602)))

(assert (=> b!68401 (= (head!534 (byteArrayBitContentToList!0 (_2!3095 lt!109566) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!534 (bitStreamReadBitsIntoList!0 (_2!3095 lt!109566) (_1!3096 lt!109569) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109608 () Unit!4573)

(declare-fun Unit!4602 () Unit!4573)

(assert (=> b!68401 (= lt!109608 Unit!4602)))

(assert (=> b!68401 (= lt!109574 (appendBitsMSBFirstLoop!0 (_2!3095 lt!109566) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!109571 () Unit!4573)

(assert (=> b!68401 (= lt!109571 (lemmaIsPrefixTransitive!0 (_2!3095 lt!108607) (_2!3095 lt!109566) (_2!3095 lt!109574)))))

(assert (=> b!68401 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!109574))))

(declare-fun lt!109580 () Unit!4573)

(assert (=> b!68401 (= lt!109580 lt!109571)))

(assert (=> b!68401 (= (size!1332 (buf!1713 (_2!3095 lt!109574))) (size!1332 (buf!1713 (_2!3095 lt!108607))))))

(declare-fun lt!109573 () Unit!4573)

(declare-fun Unit!4603 () Unit!4573)

(assert (=> b!68401 (= lt!109573 Unit!4603)))

(assert (=> b!68401 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109574))) (currentByte!3403 (_2!3095 lt!109574)) (currentBit!3398 (_2!3095 lt!109574))) (bvsub (bvadd (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109597 () Unit!4573)

(declare-fun Unit!4604 () Unit!4573)

(assert (=> b!68401 (= lt!109597 Unit!4604)))

(assert (=> b!68401 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109574))) (currentByte!3403 (_2!3095 lt!109574)) (currentBit!3398 (_2!3095 lt!109574))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109566))) (currentByte!3403 (_2!3095 lt!109566)) (currentBit!3398 (_2!3095 lt!109566))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109579 () Unit!4573)

(declare-fun Unit!4605 () Unit!4573)

(assert (=> b!68401 (= lt!109579 Unit!4605)))

(declare-fun lt!109591 () tuple2!5970)

(assert (=> b!68401 (= lt!109591 (reader!0 (_2!3095 lt!108607) (_2!3095 lt!109574)))))

(declare-fun lt!109581 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109581 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109590 () Unit!4573)

(assert (=> b!68401 (= lt!109590 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!108607) (buf!1713 (_2!3095 lt!109574)) lt!109581))))

(assert (=> b!68401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!109574)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!109581)))

(declare-fun lt!109578 () Unit!4573)

(assert (=> b!68401 (= lt!109578 lt!109590)))

(declare-fun lt!109594 () tuple2!5970)

(assert (=> b!68401 (= lt!109594 call!880)))

(declare-fun lt!109593 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109593 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109605 () Unit!4573)

(assert (=> b!68401 (= lt!109605 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3095 lt!109566) (buf!1713 (_2!3095 lt!109574)) lt!109593))))

(assert (=> b!68401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!109574)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!109566))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!109566))) lt!109593)))

(declare-fun lt!109570 () Unit!4573)

(assert (=> b!68401 (= lt!109570 lt!109605)))

(declare-fun lt!109584 () List!715)

(assert (=> b!68401 (= lt!109584 (byteArrayBitContentToList!0 (_2!3095 lt!109574) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109603 () List!715)

(assert (=> b!68401 (= lt!109603 (byteArrayBitContentToList!0 (_2!3095 lt!109574) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109587 () List!715)

(assert (=> b!68401 (= lt!109587 (bitStreamReadBitsIntoList!0 (_2!3095 lt!109574) (_1!3096 lt!109591) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109592 () List!715)

(assert (=> b!68401 (= lt!109592 (bitStreamReadBitsIntoList!0 (_2!3095 lt!109574) (_1!3096 lt!109594) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109568 () (_ BitVec 64))

(assert (=> b!68401 (= lt!109568 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109595 () Unit!4573)

(assert (=> b!68401 (= lt!109595 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3095 lt!109574) (_2!3095 lt!109574) (_1!3096 lt!109591) (_1!3096 lt!109594) lt!109568 lt!109587))))

(assert (=> b!68401 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!109574) (_1!3096 lt!109594) (bvsub lt!109568 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!319 lt!109587))))

(declare-fun lt!109576 () Unit!4573)

(assert (=> b!68401 (= lt!109576 lt!109595)))

(declare-fun lt!109567 () Unit!4573)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2877 array!2877 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4573)

(assert (=> b!68401 (= lt!109567 (arrayBitRangesEqImpliesEq!0 (buf!1713 (_2!3095 lt!109566)) (buf!1713 (_2!3095 lt!109574)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!109607 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109566))) (currentByte!3403 (_2!3095 lt!109566)) (currentBit!3398 (_2!3095 lt!109566)))))))

(assert (=> b!68401 (= (bitAt!0 (buf!1713 (_2!3095 lt!109566)) lt!109607) (bitAt!0 (buf!1713 (_2!3095 lt!109574)) lt!109607))))

(declare-fun lt!109588 () Unit!4573)

(assert (=> b!68401 (= lt!109588 lt!109567)))

(declare-fun b!68402 () Bool)

(assert (=> b!68402 (= e!44711 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!109609))))

(assert (= (and d!21648 c!5051) b!68401))

(assert (= (and d!21648 (not c!5051)) b!68400))

(assert (= (or b!68401 b!68400) bm!877))

(assert (= (and d!21648 res!56531) b!68398))

(assert (= (and b!68398 res!56535) b!68395))

(assert (= (and b!68395 res!56533) b!68396))

(assert (= (and b!68396 res!56536) b!68397))

(assert (= (and b!68397 res!56532) b!68399))

(assert (= (and b!68399 res!56534) b!68402))

(declare-fun m!109205 () Bool)

(assert (=> b!68401 m!109205))

(declare-fun m!109207 () Bool)

(assert (=> b!68401 m!109207))

(declare-fun m!109209 () Bool)

(assert (=> b!68401 m!109209))

(declare-fun m!109211 () Bool)

(assert (=> b!68401 m!109211))

(declare-fun m!109213 () Bool)

(assert (=> b!68401 m!109213))

(declare-fun m!109215 () Bool)

(assert (=> b!68401 m!109215))

(declare-fun m!109217 () Bool)

(assert (=> b!68401 m!109217))

(declare-fun m!109219 () Bool)

(assert (=> b!68401 m!109219))

(declare-fun m!109221 () Bool)

(assert (=> b!68401 m!109221))

(declare-fun m!109223 () Bool)

(assert (=> b!68401 m!109223))

(declare-fun m!109225 () Bool)

(assert (=> b!68401 m!109225))

(declare-fun m!109227 () Bool)

(assert (=> b!68401 m!109227))

(assert (=> b!68401 m!108397))

(declare-fun m!109229 () Bool)

(assert (=> b!68401 m!109229))

(declare-fun m!109231 () Bool)

(assert (=> b!68401 m!109231))

(declare-fun m!109233 () Bool)

(assert (=> b!68401 m!109233))

(declare-fun m!109235 () Bool)

(assert (=> b!68401 m!109235))

(declare-fun m!109237 () Bool)

(assert (=> b!68401 m!109237))

(declare-fun m!109239 () Bool)

(assert (=> b!68401 m!109239))

(declare-fun m!109241 () Bool)

(assert (=> b!68401 m!109241))

(declare-fun m!109243 () Bool)

(assert (=> b!68401 m!109243))

(declare-fun m!109245 () Bool)

(assert (=> b!68401 m!109245))

(assert (=> b!68401 m!109239))

(declare-fun m!109247 () Bool)

(assert (=> b!68401 m!109247))

(assert (=> b!68401 m!109205))

(declare-fun m!109249 () Bool)

(assert (=> b!68401 m!109249))

(declare-fun m!109251 () Bool)

(assert (=> b!68401 m!109251))

(declare-fun m!109253 () Bool)

(assert (=> b!68401 m!109253))

(declare-fun m!109255 () Bool)

(assert (=> b!68401 m!109255))

(declare-fun m!109257 () Bool)

(assert (=> b!68401 m!109257))

(declare-fun m!109259 () Bool)

(assert (=> b!68401 m!109259))

(declare-fun m!109261 () Bool)

(assert (=> b!68401 m!109261))

(assert (=> b!68401 m!109259))

(declare-fun m!109263 () Bool)

(assert (=> b!68401 m!109263))

(assert (=> b!68401 m!109233))

(declare-fun m!109265 () Bool)

(assert (=> b!68401 m!109265))

(declare-fun m!109267 () Bool)

(assert (=> d!21648 m!109267))

(assert (=> d!21648 m!108397))

(assert (=> d!21648 m!108671))

(assert (=> d!21648 m!108659))

(declare-fun m!109269 () Bool)

(assert (=> b!68402 m!109269))

(declare-fun m!109271 () Bool)

(assert (=> b!68399 m!109271))

(declare-fun m!109273 () Bool)

(assert (=> b!68399 m!109273))

(declare-fun m!109275 () Bool)

(assert (=> b!68399 m!109275))

(declare-fun m!109277 () Bool)

(assert (=> b!68399 m!109277))

(declare-fun m!109279 () Bool)

(assert (=> b!68399 m!109279))

(declare-fun m!109281 () Bool)

(assert (=> b!68396 m!109281))

(declare-fun m!109283 () Bool)

(assert (=> b!68400 m!109283))

(declare-fun m!109285 () Bool)

(assert (=> b!68400 m!109285))

(declare-fun m!109287 () Bool)

(assert (=> b!68398 m!109287))

(declare-fun m!109289 () Bool)

(assert (=> bm!877 m!109289))

(assert (=> b!67974 d!21648))

(declare-fun d!21800 () Bool)

(assert (=> d!21800 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109610 () Unit!4573)

(assert (=> d!21800 (= lt!109610 (choose!9 thiss!1379 (buf!1713 (_2!3095 lt!108607)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2281 (buf!1713 (_2!3095 lt!108607)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(assert (=> d!21800 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1713 (_2!3095 lt!108607)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109610)))

(declare-fun bs!5261 () Bool)

(assert (= bs!5261 d!21800))

(assert (=> bs!5261 m!108407))

(declare-fun m!109291 () Bool)

(assert (=> bs!5261 m!109291))

(assert (=> b!67974 d!21800))

(declare-fun d!21802 () Bool)

(assert (=> d!21802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5262 () Bool)

(assert (= bs!5262 d!21802))

(declare-fun m!109293 () Bool)

(assert (=> bs!5262 m!109293))

(assert (=> b!67974 d!21802))

(declare-fun lt!109611 () (_ BitVec 64))

(declare-fun b!68403 () Bool)

(declare-fun lt!109612 () tuple2!5970)

(declare-fun e!44714 () Bool)

(declare-fun lt!109628 () (_ BitVec 64))

(assert (=> b!68403 (= e!44714 (= (_1!3096 lt!109612) (withMovedBitIndex!0 (_2!3096 lt!109612) (bvsub lt!109611 lt!109628))))))

(assert (=> b!68403 (or (= (bvand lt!109611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109611 lt!109628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68403 (= lt!109628 (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607))))))

(assert (=> b!68403 (= lt!109611 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(declare-fun b!68404 () Bool)

(declare-fun e!44715 () Unit!4573)

(declare-fun Unit!4606 () Unit!4573)

(assert (=> b!68404 (= e!44715 Unit!4606)))

(declare-fun b!68405 () Bool)

(declare-fun res!56539 () Bool)

(assert (=> b!68405 (=> (not res!56539) (not e!44714))))

(assert (=> b!68405 (= res!56539 (isPrefixOf!0 (_1!3096 lt!109612) thiss!1379))))

(declare-fun d!21804 () Bool)

(assert (=> d!21804 e!44714))

(declare-fun res!56538 () Bool)

(assert (=> d!21804 (=> (not res!56538) (not e!44714))))

(assert (=> d!21804 (= res!56538 (isPrefixOf!0 (_1!3096 lt!109612) (_2!3096 lt!109612)))))

(declare-fun lt!109629 () BitStream!2280)

(assert (=> d!21804 (= lt!109612 (tuple2!5971 lt!109629 (_2!3095 lt!108607)))))

(declare-fun lt!109620 () Unit!4573)

(declare-fun lt!109613 () Unit!4573)

(assert (=> d!21804 (= lt!109620 lt!109613)))

(assert (=> d!21804 (isPrefixOf!0 lt!109629 (_2!3095 lt!108607))))

(assert (=> d!21804 (= lt!109613 (lemmaIsPrefixTransitive!0 lt!109629 (_2!3095 lt!108607) (_2!3095 lt!108607)))))

(declare-fun lt!109626 () Unit!4573)

(declare-fun lt!109614 () Unit!4573)

(assert (=> d!21804 (= lt!109626 lt!109614)))

(assert (=> d!21804 (isPrefixOf!0 lt!109629 (_2!3095 lt!108607))))

(assert (=> d!21804 (= lt!109614 (lemmaIsPrefixTransitive!0 lt!109629 thiss!1379 (_2!3095 lt!108607)))))

(declare-fun lt!109625 () Unit!4573)

(assert (=> d!21804 (= lt!109625 e!44715)))

(declare-fun c!5052 () Bool)

(assert (=> d!21804 (= c!5052 (not (= (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!109615 () Unit!4573)

(declare-fun lt!109623 () Unit!4573)

(assert (=> d!21804 (= lt!109615 lt!109623)))

(assert (=> d!21804 (isPrefixOf!0 (_2!3095 lt!108607) (_2!3095 lt!108607))))

(assert (=> d!21804 (= lt!109623 (lemmaIsPrefixRefl!0 (_2!3095 lt!108607)))))

(declare-fun lt!109622 () Unit!4573)

(declare-fun lt!109630 () Unit!4573)

(assert (=> d!21804 (= lt!109622 lt!109630)))

(assert (=> d!21804 (= lt!109630 (lemmaIsPrefixRefl!0 (_2!3095 lt!108607)))))

(declare-fun lt!109619 () Unit!4573)

(declare-fun lt!109617 () Unit!4573)

(assert (=> d!21804 (= lt!109619 lt!109617)))

(assert (=> d!21804 (isPrefixOf!0 lt!109629 lt!109629)))

(assert (=> d!21804 (= lt!109617 (lemmaIsPrefixRefl!0 lt!109629))))

(declare-fun lt!109627 () Unit!4573)

(declare-fun lt!109616 () Unit!4573)

(assert (=> d!21804 (= lt!109627 lt!109616)))

(assert (=> d!21804 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21804 (= lt!109616 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21804 (= lt!109629 (BitStream!2281 (buf!1713 (_2!3095 lt!108607)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(assert (=> d!21804 (isPrefixOf!0 thiss!1379 (_2!3095 lt!108607))))

(assert (=> d!21804 (= (reader!0 thiss!1379 (_2!3095 lt!108607)) lt!109612)))

(declare-fun b!68406 () Bool)

(declare-fun res!56537 () Bool)

(assert (=> b!68406 (=> (not res!56537) (not e!44714))))

(assert (=> b!68406 (= res!56537 (isPrefixOf!0 (_2!3096 lt!109612) (_2!3095 lt!108607)))))

(declare-fun b!68407 () Bool)

(declare-fun lt!109621 () Unit!4573)

(assert (=> b!68407 (= e!44715 lt!109621)))

(declare-fun lt!109618 () (_ BitVec 64))

(assert (=> b!68407 (= lt!109618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109624 () (_ BitVec 64))

(assert (=> b!68407 (= lt!109624 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(assert (=> b!68407 (= lt!109621 (arrayBitRangesEqSymmetric!0 (buf!1713 thiss!1379) (buf!1713 (_2!3095 lt!108607)) lt!109618 lt!109624))))

(assert (=> b!68407 (arrayBitRangesEq!0 (buf!1713 (_2!3095 lt!108607)) (buf!1713 thiss!1379) lt!109618 lt!109624)))

(assert (= (and d!21804 c!5052) b!68407))

(assert (= (and d!21804 (not c!5052)) b!68404))

(assert (= (and d!21804 res!56538) b!68405))

(assert (= (and b!68405 res!56539) b!68406))

(assert (= (and b!68406 res!56537) b!68403))

(declare-fun m!109295 () Bool)

(assert (=> b!68405 m!109295))

(assert (=> b!68407 m!108393))

(declare-fun m!109297 () Bool)

(assert (=> b!68407 m!109297))

(declare-fun m!109299 () Bool)

(assert (=> b!68407 m!109299))

(declare-fun m!109301 () Bool)

(assert (=> b!68403 m!109301))

(assert (=> b!68403 m!108397))

(assert (=> b!68403 m!108393))

(declare-fun m!109303 () Bool)

(assert (=> d!21804 m!109303))

(declare-fun m!109305 () Bool)

(assert (=> d!21804 m!109305))

(assert (=> d!21804 m!108671))

(assert (=> d!21804 m!108391))

(declare-fun m!109307 () Bool)

(assert (=> d!21804 m!109307))

(declare-fun m!109309 () Bool)

(assert (=> d!21804 m!109309))

(declare-fun m!109311 () Bool)

(assert (=> d!21804 m!109311))

(declare-fun m!109313 () Bool)

(assert (=> d!21804 m!109313))

(assert (=> d!21804 m!108469))

(assert (=> d!21804 m!108659))

(assert (=> d!21804 m!108389))

(declare-fun m!109315 () Bool)

(assert (=> b!68406 m!109315))

(assert (=> b!67974 d!21804))

(declare-fun d!21806 () Bool)

(declare-fun res!56542 () Bool)

(declare-fun e!44717 () Bool)

(assert (=> d!21806 (=> (not res!56542) (not e!44717))))

(assert (=> d!21806 (= res!56542 (= (size!1332 (buf!1713 thiss!1379)) (size!1332 (buf!1713 thiss!1379))))))

(assert (=> d!21806 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44717)))

(declare-fun b!68408 () Bool)

(declare-fun res!56540 () Bool)

(assert (=> b!68408 (=> (not res!56540) (not e!44717))))

(assert (=> b!68408 (= res!56540 (bvsle (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)) (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(declare-fun b!68409 () Bool)

(declare-fun e!44716 () Bool)

(assert (=> b!68409 (= e!44717 e!44716)))

(declare-fun res!56541 () Bool)

(assert (=> b!68409 (=> res!56541 e!44716)))

(assert (=> b!68409 (= res!56541 (= (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68410 () Bool)

(assert (=> b!68410 (= e!44716 (arrayBitRangesEq!0 (buf!1713 thiss!1379) (buf!1713 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(assert (= (and d!21806 res!56542) b!68408))

(assert (= (and b!68408 res!56540) b!68409))

(assert (= (and b!68409 (not res!56541)) b!68410))

(assert (=> b!68408 m!108393))

(assert (=> b!68408 m!108393))

(assert (=> b!68410 m!108393))

(assert (=> b!68410 m!108393))

(declare-fun m!109317 () Bool)

(assert (=> b!68410 m!109317))

(assert (=> b!67985 d!21806))

(declare-fun d!21808 () Bool)

(assert (=> d!21808 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109633 () Unit!4573)

(declare-fun choose!11 (BitStream!2280) Unit!4573)

(assert (=> d!21808 (= lt!109633 (choose!11 thiss!1379))))

(assert (=> d!21808 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!109633)))

(declare-fun bs!5264 () Bool)

(assert (= bs!5264 d!21808))

(assert (=> bs!5264 m!108389))

(declare-fun m!109319 () Bool)

(assert (=> bs!5264 m!109319))

(assert (=> b!67985 d!21808))

(declare-fun d!21810 () Bool)

(declare-fun e!44718 () Bool)

(assert (=> d!21810 e!44718))

(declare-fun res!56544 () Bool)

(assert (=> d!21810 (=> (not res!56544) (not e!44718))))

(declare-fun lt!109636 () (_ BitVec 64))

(declare-fun lt!109635 () (_ BitVec 64))

(declare-fun lt!109639 () (_ BitVec 64))

(assert (=> d!21810 (= res!56544 (= lt!109639 (bvsub lt!109635 lt!109636)))))

(assert (=> d!21810 (or (= (bvand lt!109635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109635 lt!109636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21810 (= lt!109636 (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))) ((_ sign_extend 32) (currentByte!3403 thiss!1379)) ((_ sign_extend 32) (currentBit!3398 thiss!1379))))))

(declare-fun lt!109634 () (_ BitVec 64))

(declare-fun lt!109637 () (_ BitVec 64))

(assert (=> d!21810 (= lt!109635 (bvmul lt!109634 lt!109637))))

(assert (=> d!21810 (or (= lt!109634 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109637 (bvsdiv (bvmul lt!109634 lt!109637) lt!109634)))))

(assert (=> d!21810 (= lt!109637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21810 (= lt!109634 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))))))

(assert (=> d!21810 (= lt!109639 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3403 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3398 thiss!1379))))))

(assert (=> d!21810 (invariant!0 (currentBit!3398 thiss!1379) (currentByte!3403 thiss!1379) (size!1332 (buf!1713 thiss!1379)))))

(assert (=> d!21810 (= (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)) lt!109639)))

(declare-fun b!68411 () Bool)

(declare-fun res!56543 () Bool)

(assert (=> b!68411 (=> (not res!56543) (not e!44718))))

(assert (=> b!68411 (= res!56543 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109639))))

(declare-fun b!68412 () Bool)

(declare-fun lt!109638 () (_ BitVec 64))

(assert (=> b!68412 (= e!44718 (bvsle lt!109639 (bvmul lt!109638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68412 (or (= lt!109638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109638)))))

(assert (=> b!68412 (= lt!109638 ((_ sign_extend 32) (size!1332 (buf!1713 thiss!1379))))))

(assert (= (and d!21810 res!56544) b!68411))

(assert (= (and b!68411 res!56543) b!68412))

(assert (=> d!21810 m!108615))

(assert (=> d!21810 m!108621))

(assert (=> b!67985 d!21810))

(declare-fun d!21812 () Bool)

(assert (=> d!21812 (= (head!534 (byteArrayBitContentToList!0 (_2!3095 lt!108607) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!830 (byteArrayBitContentToList!0 (_2!3095 lt!108607) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67975 d!21812))

(declare-fun d!21814 () Bool)

(declare-fun c!5055 () Bool)

(assert (=> d!21814 (= c!5055 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44721 () List!715)

(assert (=> d!21814 (= (byteArrayBitContentToList!0 (_2!3095 lt!108607) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44721)))

(declare-fun b!68417 () Bool)

(assert (=> b!68417 (= e!44721 Nil!712)))

(declare-fun b!68418 () Bool)

(assert (=> b!68418 (= e!44721 (Cons!711 (not (= (bvand ((_ sign_extend 24) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3095 lt!108607) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21814 c!5055) b!68417))

(assert (= (and d!21814 (not c!5055)) b!68418))

(assert (=> b!68418 m!108467))

(declare-fun m!109321 () Bool)

(assert (=> b!68418 m!109321))

(declare-fun m!109323 () Bool)

(assert (=> b!68418 m!109323))

(assert (=> b!67975 d!21814))

(declare-fun d!21816 () Bool)

(assert (=> d!21816 (= (head!534 (bitStreamReadBitsIntoList!0 (_2!3095 lt!108607) (_1!3096 lt!108612) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!830 (bitStreamReadBitsIntoList!0 (_2!3095 lt!108607) (_1!3096 lt!108612) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67975 d!21816))

(declare-fun d!21818 () Bool)

(declare-fun e!44723 () Bool)

(assert (=> d!21818 e!44723))

(declare-fun c!5056 () Bool)

(assert (=> d!21818 (= c!5056 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109641 () List!715)

(declare-fun e!44722 () tuple2!5992)

(assert (=> d!21818 (= lt!109641 (_1!3107 e!44722))))

(declare-fun c!5057 () Bool)

(assert (=> d!21818 (= c!5057 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21818 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21818 (= (bitStreamReadBitsIntoList!0 (_2!3095 lt!108607) (_1!3096 lt!108612) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109641)))

(declare-fun lt!109642 () tuple2!5994)

(declare-fun b!68420 () Bool)

(declare-fun lt!109640 () (_ BitVec 64))

(assert (=> b!68420 (= e!44722 (tuple2!5993 (Cons!711 (_1!3108 lt!109642) (bitStreamReadBitsIntoList!0 (_2!3095 lt!108607) (_2!3108 lt!109642) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!109640))) (_2!3108 lt!109642)))))

(assert (=> b!68420 (= lt!109642 (readBit!0 (_1!3096 lt!108612)))))

(assert (=> b!68420 (= lt!109640 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68419 () Bool)

(assert (=> b!68419 (= e!44722 (tuple2!5993 Nil!712 (_1!3096 lt!108612)))))

(declare-fun b!68421 () Bool)

(assert (=> b!68421 (= e!44723 (isEmpty!218 lt!109641))))

(declare-fun b!68422 () Bool)

(assert (=> b!68422 (= e!44723 (> (length!343 lt!109641) 0))))

(assert (= (and d!21818 c!5057) b!68419))

(assert (= (and d!21818 (not c!5057)) b!68420))

(assert (= (and d!21818 c!5056) b!68421))

(assert (= (and d!21818 (not c!5056)) b!68422))

(declare-fun m!109325 () Bool)

(assert (=> b!68420 m!109325))

(declare-fun m!109327 () Bool)

(assert (=> b!68420 m!109327))

(declare-fun m!109329 () Bool)

(assert (=> b!68421 m!109329))

(declare-fun m!109331 () Bool)

(assert (=> b!68422 m!109331))

(assert (=> b!67975 d!21818))

(declare-fun d!21820 () Bool)

(assert (=> d!21820 (= (head!534 (byteArrayBitContentToList!0 (_2!3095 lt!108613) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!830 (byteArrayBitContentToList!0 (_2!3095 lt!108613) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!67973 d!21820))

(declare-fun d!21822 () Bool)

(declare-fun c!5058 () Bool)

(assert (=> d!21822 (= c!5058 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44724 () List!715)

(assert (=> d!21822 (= (byteArrayBitContentToList!0 (_2!3095 lt!108613) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44724)))

(declare-fun b!68423 () Bool)

(assert (=> b!68423 (= e!44724 Nil!712)))

(declare-fun b!68424 () Bool)

(assert (=> b!68424 (= e!44724 (Cons!711 (not (= (bvand ((_ sign_extend 24) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3095 lt!108613) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21822 c!5058) b!68423))

(assert (= (and d!21822 (not c!5058)) b!68424))

(assert (=> b!68424 m!108467))

(assert (=> b!68424 m!109321))

(declare-fun m!109333 () Bool)

(assert (=> b!68424 m!109333))

(assert (=> b!67973 d!21822))

(declare-fun d!21824 () Bool)

(assert (=> d!21824 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5265 () Bool)

(assert (= bs!5265 d!21824))

(assert (=> bs!5265 m!108467))

(assert (=> bs!5265 m!109321))

(assert (=> b!67973 d!21824))

(declare-fun d!21826 () Bool)

(declare-fun size!1336 (List!715) Int)

(assert (=> d!21826 (= (length!343 lt!108618) (size!1336 lt!108618))))

(declare-fun bs!5266 () Bool)

(assert (= bs!5266 d!21826))

(declare-fun m!109335 () Bool)

(assert (=> bs!5266 m!109335))

(assert (=> b!67984 d!21826))

(declare-fun d!21828 () Bool)

(declare-fun res!56547 () Bool)

(declare-fun e!44726 () Bool)

(assert (=> d!21828 (=> (not res!56547) (not e!44726))))

(assert (=> d!21828 (= res!56547 (= (size!1332 (buf!1713 thiss!1379)) (size!1332 (buf!1713 (_2!3095 lt!108607)))))))

(assert (=> d!21828 (= (isPrefixOf!0 thiss!1379 (_2!3095 lt!108607)) e!44726)))

(declare-fun b!68425 () Bool)

(declare-fun res!56545 () Bool)

(assert (=> b!68425 (=> (not res!56545) (not e!44726))))

(assert (=> b!68425 (= res!56545 (bvsle (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)) (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!108607))) (currentByte!3403 (_2!3095 lt!108607)) (currentBit!3398 (_2!3095 lt!108607)))))))

(declare-fun b!68426 () Bool)

(declare-fun e!44725 () Bool)

(assert (=> b!68426 (= e!44726 e!44725)))

(declare-fun res!56546 () Bool)

(assert (=> b!68426 (=> res!56546 e!44725)))

(assert (=> b!68426 (= res!56546 (= (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68427 () Bool)

(assert (=> b!68427 (= e!44725 (arrayBitRangesEq!0 (buf!1713 thiss!1379) (buf!1713 (_2!3095 lt!108607)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379))))))

(assert (= (and d!21828 res!56547) b!68425))

(assert (= (and b!68425 res!56545) b!68426))

(assert (= (and b!68426 (not res!56546)) b!68427))

(assert (=> b!68425 m!108393))

(assert (=> b!68425 m!108397))

(assert (=> b!68427 m!108393))

(assert (=> b!68427 m!108393))

(declare-fun m!109337 () Bool)

(assert (=> b!68427 m!109337))

(assert (=> b!67977 d!21828))

(declare-fun d!21830 () Bool)

(assert (=> d!21830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) lt!108619) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607)))) lt!108619))))

(declare-fun bs!5267 () Bool)

(assert (= bs!5267 d!21830))

(assert (=> bs!5267 m!108617))

(assert (=> b!67977 d!21830))

(declare-fun d!21832 () Bool)

(declare-fun e!44729 () Bool)

(assert (=> d!21832 e!44729))

(declare-fun res!56550 () Bool)

(assert (=> d!21832 (=> (not res!56550) (not e!44729))))

(assert (=> d!21832 (= res!56550 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!109645 () Unit!4573)

(declare-fun choose!27 (BitStream!2280 BitStream!2280 (_ BitVec 64) (_ BitVec 64)) Unit!4573)

(assert (=> d!21832 (= lt!109645 (choose!27 thiss!1379 (_2!3095 lt!108607) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21832 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3095 lt!108607) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109645)))

(declare-fun b!68430 () Bool)

(assert (=> b!68430 (= e!44729 (validate_offset_bits!1 ((_ sign_extend 32) (size!1332 (buf!1713 (_2!3095 lt!108607)))) ((_ sign_extend 32) (currentByte!3403 (_2!3095 lt!108607))) ((_ sign_extend 32) (currentBit!3398 (_2!3095 lt!108607))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21832 res!56550) b!68430))

(declare-fun m!109339 () Bool)

(assert (=> d!21832 m!109339))

(declare-fun m!109341 () Bool)

(assert (=> b!68430 m!109341))

(assert (=> b!67977 d!21832))

(declare-fun b!68448 () Bool)

(declare-fun e!44740 () Bool)

(declare-fun e!44741 () Bool)

(assert (=> b!68448 (= e!44740 e!44741)))

(declare-fun res!56573 () Bool)

(assert (=> b!68448 (=> (not res!56573) (not e!44741))))

(declare-datatypes ((tuple2!5998 0))(
  ( (tuple2!5999 (_1!3110 BitStream!2280) (_2!3110 Bool)) )
))
(declare-fun lt!109674 () tuple2!5998)

(declare-fun lt!109680 () tuple2!5968)

(declare-fun lt!109678 () Bool)

(assert (=> b!68448 (= res!56573 (and (= (_2!3110 lt!109674) lt!109678) (= (_1!3110 lt!109674) (_2!3095 lt!109680))))))

(declare-fun readBitPure!0 (BitStream!2280) tuple2!5998)

(declare-fun readerFrom!0 (BitStream!2280 (_ BitVec 32) (_ BitVec 32)) BitStream!2280)

(assert (=> b!68448 (= lt!109674 (readBitPure!0 (readerFrom!0 (_2!3095 lt!109680) (currentBit!3398 thiss!1379) (currentByte!3403 thiss!1379))))))

(declare-fun b!68449 () Bool)

(declare-fun res!56574 () Bool)

(assert (=> b!68449 (=> (not res!56574) (not e!44740))))

(assert (=> b!68449 (= res!56574 (isPrefixOf!0 thiss!1379 (_2!3095 lt!109680)))))

(declare-fun b!68450 () Bool)

(declare-fun e!44738 () Bool)

(declare-fun lt!109676 () tuple2!5998)

(declare-fun lt!109679 () tuple2!5968)

(assert (=> b!68450 (= e!44738 (= (bitIndex!0 (size!1332 (buf!1713 (_1!3110 lt!109676))) (currentByte!3403 (_1!3110 lt!109676)) (currentBit!3398 (_1!3110 lt!109676))) (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109679))) (currentByte!3403 (_2!3095 lt!109679)) (currentBit!3398 (_2!3095 lt!109679)))))))

(declare-fun b!68451 () Bool)

(declare-fun e!44739 () Bool)

(assert (=> b!68451 (= e!44739 e!44738)))

(declare-fun res!56569 () Bool)

(assert (=> b!68451 (=> (not res!56569) (not e!44738))))

(declare-fun lt!109675 () (_ BitVec 8))

(assert (=> b!68451 (= res!56569 (and (= (_2!3110 lt!109676) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!109675)) #b00000000000000000000000000000000))) (= (_1!3110 lt!109676) (_2!3095 lt!109679))))))

(declare-fun lt!109673 () tuple2!5996)

(declare-fun lt!109677 () BitStream!2280)

(assert (=> b!68451 (= lt!109673 (readBits!0 lt!109677 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68451 (= lt!109676 (readBitPure!0 lt!109677))))

(assert (=> b!68451 (= lt!109677 (readerFrom!0 (_2!3095 lt!109679) (currentBit!3398 thiss!1379) (currentByte!3403 thiss!1379)))))

(declare-fun b!68453 () Bool)

(declare-fun res!56567 () Bool)

(assert (=> b!68453 (=> (not res!56567) (not e!44739))))

(declare-fun lt!109681 () (_ BitVec 64))

(declare-fun lt!109670 () (_ BitVec 64))

(assert (=> b!68453 (= res!56567 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109679))) (currentByte!3403 (_2!3095 lt!109679)) (currentBit!3398 (_2!3095 lt!109679))) (bvadd lt!109670 lt!109681)))))

(assert (=> b!68453 (or (not (= (bvand lt!109670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109681 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109670 lt!109681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68453 (= lt!109681 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!68453 (= lt!109670 (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)))))

(declare-fun b!68454 () Bool)

(assert (=> b!68454 (= e!44741 (= (bitIndex!0 (size!1332 (buf!1713 (_1!3110 lt!109674))) (currentByte!3403 (_1!3110 lt!109674)) (currentBit!3398 (_1!3110 lt!109674))) (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109680))) (currentByte!3403 (_2!3095 lt!109680)) (currentBit!3398 (_2!3095 lt!109680)))))))

(declare-fun b!68455 () Bool)

(declare-fun res!56571 () Bool)

(assert (=> b!68455 (=> (not res!56571) (not e!44740))))

(assert (=> b!68455 (= res!56571 (= (bitIndex!0 (size!1332 (buf!1713 (_2!3095 lt!109680))) (currentByte!3403 (_2!3095 lt!109680)) (currentBit!3398 (_2!3095 lt!109680))) (bvadd (bitIndex!0 (size!1332 (buf!1713 thiss!1379)) (currentByte!3403 thiss!1379) (currentBit!3398 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!21834 () Bool)

(assert (=> d!21834 e!44739))

(declare-fun res!56570 () Bool)

(assert (=> d!21834 (=> (not res!56570) (not e!44739))))

(assert (=> d!21834 (= res!56570 (= (size!1332 (buf!1713 (_2!3095 lt!109679))) (size!1332 (buf!1713 thiss!1379))))))

(declare-fun lt!109672 () array!2877)

(assert (=> d!21834 (= lt!109675 (select (arr!1905 lt!109672) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21834 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1332 lt!109672)))))

(assert (=> d!21834 (= lt!109672 (array!2878 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!109671 () tuple2!5968)

(assert (=> d!21834 (= lt!109679 (tuple2!5969 (_1!3095 lt!109671) (_2!3095 lt!109671)))))

(assert (=> d!21834 (= lt!109671 lt!109680)))

(assert (=> d!21834 e!44740))

(declare-fun res!56572 () Bool)

(assert (=> d!21834 (=> (not res!56572) (not e!44740))))

(assert (=> d!21834 (= res!56572 (= (size!1332 (buf!1713 thiss!1379)) (size!1332 (buf!1713 (_2!3095 lt!109680)))))))

(declare-fun appendBit!0 (BitStream!2280 Bool) tuple2!5968)

(assert (=> d!21834 (= lt!109680 (appendBit!0 thiss!1379 lt!109678))))

(assert (=> d!21834 (= lt!109678 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21834 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21834 (= (appendBitFromByte!0 thiss!1379 (select (arr!1905 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!109679)))

(declare-fun b!68452 () Bool)

(declare-fun res!56568 () Bool)

(assert (=> b!68452 (=> (not res!56568) (not e!44739))))

(assert (=> b!68452 (= res!56568 (isPrefixOf!0 thiss!1379 (_2!3095 lt!109679)))))

(assert (= (and d!21834 res!56572) b!68455))

(assert (= (and b!68455 res!56571) b!68449))

(assert (= (and b!68449 res!56574) b!68448))

(assert (= (and b!68448 res!56573) b!68454))

(assert (= (and d!21834 res!56570) b!68453))

(assert (= (and b!68453 res!56567) b!68452))

(assert (= (and b!68452 res!56568) b!68451))

(assert (= (and b!68451 res!56569) b!68450))

(declare-fun m!109343 () Bool)

(assert (=> b!68453 m!109343))

(assert (=> b!68453 m!108393))

(declare-fun m!109345 () Bool)

(assert (=> b!68449 m!109345))

(declare-fun m!109347 () Bool)

(assert (=> b!68451 m!109347))

(declare-fun m!109349 () Bool)

(assert (=> b!68451 m!109349))

(declare-fun m!109351 () Bool)

(assert (=> b!68451 m!109351))

(declare-fun m!109353 () Bool)

(assert (=> b!68448 m!109353))

(assert (=> b!68448 m!109353))

(declare-fun m!109355 () Bool)

(assert (=> b!68448 m!109355))

(declare-fun m!109357 () Bool)

(assert (=> b!68450 m!109357))

(assert (=> b!68450 m!109343))

(declare-fun m!109359 () Bool)

(assert (=> b!68454 m!109359))

(declare-fun m!109361 () Bool)

(assert (=> b!68454 m!109361))

(declare-fun m!109363 () Bool)

(assert (=> d!21834 m!109363))

(declare-fun m!109365 () Bool)

(assert (=> d!21834 m!109365))

(assert (=> d!21834 m!109321))

(assert (=> b!68455 m!109361))

(assert (=> b!68455 m!108393))

(declare-fun m!109367 () Bool)

(assert (=> b!68452 m!109367))

(assert (=> b!67977 d!21834))

(declare-fun d!21836 () Bool)

(assert (=> d!21836 (= (array_inv!1199 (buf!1713 thiss!1379)) (bvsge (size!1332 (buf!1713 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!67986 d!21836))

(declare-fun d!21838 () Bool)

(assert (=> d!21838 (= (invariant!0 (currentBit!3398 (_2!3095 lt!108613)) (currentByte!3403 (_2!3095 lt!108613)) (size!1332 (buf!1713 (_2!3095 lt!108613)))) (and (bvsge (currentBit!3398 (_2!3095 lt!108613)) #b00000000000000000000000000000000) (bvslt (currentBit!3398 (_2!3095 lt!108613)) #b00000000000000000000000000001000) (bvsge (currentByte!3403 (_2!3095 lt!108613)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3403 (_2!3095 lt!108613)) (size!1332 (buf!1713 (_2!3095 lt!108613)))) (and (= (currentBit!3398 (_2!3095 lt!108613)) #b00000000000000000000000000000000) (= (currentByte!3403 (_2!3095 lt!108613)) (size!1332 (buf!1713 (_2!3095 lt!108613))))))))))

(assert (=> b!67987 d!21838))

(check-sat (not b!68455) (not d!21648) (not d!21608) (not b!68118) (not b!68107) (not b!68400) (not b!68449) (not d!21800) (not b!68127) (not d!21626) (not b!68102) (not b!68122) (not b!68421) (not b!68403) (not bm!877) (not d!21600) (not b!68453) (not b!68140) (not d!21642) (not b!68424) (not d!21834) (not b!68125) (not b!68405) (not b!68101) (not d!21618) (not b!68452) (not d!21804) (not d!21832) (not b!68142) (not b!68120) (not b!68121) (not b!68402) (not b!68408) (not b!68420) (not d!21830) (not b!68401) (not d!21826) (not d!21810) (not b!68450) (not b!68407) (not b!68430) (not b!68106) (not b!68105) (not d!21638) (not b!68123) (not b!68427) (not b!68126) (not b!68139) (not b!68396) (not d!21802) (not d!21808) (not b!68137) (not b!68422) (not b!68451) (not b!68454) (not b!68398) (not d!21620) (not d!21628) (not b!68425) (not b!68399) (not d!21624) (not b!68448) (not b!68103) (not b!68406) (not d!21622) (not b!68418) (not b!68130) (not d!21604) (not d!21602) (not b!68410))
