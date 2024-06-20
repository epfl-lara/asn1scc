; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13260 () Bool)

(assert start!13260)

(declare-fun b!67908 () Bool)

(declare-fun res!56179 () Bool)

(declare-fun e!44448 () Bool)

(assert (=> b!67908 (=> res!56179 e!44448)))

(declare-fun lt!108536 () (_ BitVec 64))

(declare-datatypes ((array!2875 0))(
  ( (array!2876 (arr!1904 (Array (_ BitVec 32) (_ BitVec 8))) (size!1331 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2278 0))(
  ( (BitStream!2279 (buf!1712 array!2875) (currentByte!3402 (_ BitVec 32)) (currentBit!3397 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4571 0))(
  ( (Unit!4572) )
))
(declare-datatypes ((tuple2!5964 0))(
  ( (tuple2!5965 (_1!3093 Unit!4571) (_2!3093 BitStream!2278)) )
))
(declare-fun lt!108551 () tuple2!5964)

(declare-fun lt!108553 () Bool)

(declare-fun bitAt!0 (array!2875 (_ BitVec 64)) Bool)

(assert (=> b!67908 (= res!56179 (not (= (bitAt!0 (buf!1712 (_2!3093 lt!108551)) lt!108536) lt!108553)))))

(declare-fun res!56176 () Bool)

(declare-fun e!44445 () Bool)

(assert (=> start!13260 (=> (not res!56176) (not e!44445))))

(declare-fun srcBuffer!2 () array!2875)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13260 (= res!56176 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1331 srcBuffer!2))))))))

(assert (=> start!13260 e!44445))

(assert (=> start!13260 true))

(declare-fun array_inv!1198 (array!2875) Bool)

(assert (=> start!13260 (array_inv!1198 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2278)

(declare-fun e!44450 () Bool)

(declare-fun inv!12 (BitStream!2278) Bool)

(assert (=> start!13260 (and (inv!12 thiss!1379) e!44450)))

(declare-fun b!67909 () Bool)

(declare-fun res!56169 () Bool)

(declare-fun e!44452 () Bool)

(assert (=> b!67909 (=> res!56169 e!44452)))

(declare-fun lt!108541 () tuple2!5964)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!67909 (= res!56169 (not (invariant!0 (currentBit!3397 (_2!3093 lt!108541)) (currentByte!3402 (_2!3093 lt!108541)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))

(declare-fun b!67910 () Bool)

(declare-fun res!56172 () Bool)

(declare-fun e!44444 () Bool)

(assert (=> b!67910 (=> res!56172 e!44444)))

(assert (=> b!67910 (= res!56172 (not (invariant!0 (currentBit!3397 (_2!3093 lt!108551)) (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))

(declare-fun b!67911 () Bool)

(declare-fun res!56187 () Bool)

(declare-fun e!44443 () Bool)

(assert (=> b!67911 (=> res!56187 e!44443)))

(declare-datatypes ((List!714 0))(
  ( (Nil!711) (Cons!710 (h!829 Bool) (t!1464 List!714)) )
))
(declare-fun lt!108537 () List!714)

(declare-fun length!342 (List!714) Int)

(assert (=> b!67911 (= res!56187 (<= (length!342 lt!108537) 0))))

(declare-fun b!67912 () Bool)

(assert (=> b!67912 (= e!44450 (array_inv!1198 (buf!1712 thiss!1379)))))

(declare-fun b!67913 () Bool)

(assert (=> b!67913 (= e!44444 e!44443)))

(declare-fun res!56186 () Bool)

(assert (=> b!67913 (=> res!56186 e!44443)))

(assert (=> b!67913 (= res!56186 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108543 () (_ BitVec 64))

(declare-fun lt!108548 () List!714)

(declare-datatypes ((tuple2!5966 0))(
  ( (tuple2!5967 (_1!3094 BitStream!2278) (_2!3094 BitStream!2278)) )
))
(declare-fun lt!108554 () tuple2!5966)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2278 BitStream!2278 (_ BitVec 64)) List!714)

(assert (=> b!67913 (= lt!108548 (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_1!3094 lt!108554) lt!108543))))

(declare-fun lt!108547 () tuple2!5966)

(assert (=> b!67913 (= lt!108537 (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_1!3094 lt!108547) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67913 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!108543)))

(declare-fun lt!108546 () Unit!4571)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2278 array!2875 (_ BitVec 64)) Unit!4571)

(assert (=> b!67913 (= lt!108546 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!108541)) lt!108543))))

(declare-fun reader!0 (BitStream!2278 BitStream!2278) tuple2!5966)

(assert (=> b!67913 (= lt!108554 (reader!0 (_2!3093 lt!108551) (_2!3093 lt!108541)))))

(assert (=> b!67913 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!108544 () Unit!4571)

(assert (=> b!67913 (= lt!108544 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1712 (_2!3093 lt!108541)) (bvsub to!314 i!635)))))

(assert (=> b!67913 (= lt!108547 (reader!0 thiss!1379 (_2!3093 lt!108541)))))

(declare-fun b!67914 () Bool)

(declare-fun e!44440 () Bool)

(declare-fun e!44442 () Bool)

(assert (=> b!67914 (= e!44440 e!44442)))

(declare-fun res!56171 () Bool)

(assert (=> b!67914 (=> res!56171 e!44442)))

(declare-fun isPrefixOf!0 (BitStream!2278 BitStream!2278) Bool)

(assert (=> b!67914 (= res!56171 (not (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108541))))))

(assert (=> b!67914 (isPrefixOf!0 thiss!1379 (_2!3093 lt!108541))))

(declare-fun lt!108556 () Unit!4571)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2278 BitStream!2278 BitStream!2278) Unit!4571)

(assert (=> b!67914 (= lt!108556 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3093 lt!108551) (_2!3093 lt!108541)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2278 array!2875 (_ BitVec 64) (_ BitVec 64)) tuple2!5964)

(assert (=> b!67914 (= lt!108541 (appendBitsMSBFirstLoop!0 (_2!3093 lt!108551) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44447 () Bool)

(assert (=> b!67914 e!44447))

(declare-fun res!56182 () Bool)

(assert (=> b!67914 (=> (not res!56182) (not e!44447))))

(assert (=> b!67914 (= res!56182 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108552 () Unit!4571)

(assert (=> b!67914 (= lt!108552 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1712 (_2!3093 lt!108551)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108539 () tuple2!5966)

(assert (=> b!67914 (= lt!108539 (reader!0 thiss!1379 (_2!3093 lt!108551)))))

(declare-fun b!67915 () Bool)

(declare-fun head!533 (List!714) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2278 array!2875 (_ BitVec 64) (_ BitVec 64)) List!714)

(assert (=> b!67915 (= e!44447 (= (head!533 (byteArrayBitContentToList!0 (_2!3093 lt!108551) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!533 (bitStreamReadBitsIntoList!0 (_2!3093 lt!108551) (_1!3094 lt!108539) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!67916 () Bool)

(declare-fun e!44449 () Bool)

(assert (=> b!67916 (= e!44443 e!44449)))

(declare-fun res!56181 () Bool)

(assert (=> b!67916 (=> res!56181 e!44449)))

(declare-fun lt!108555 () List!714)

(assert (=> b!67916 (= res!56181 (not (= lt!108555 lt!108548)))))

(assert (=> b!67916 (= lt!108548 lt!108555)))

(declare-fun tail!318 (List!714) List!714)

(assert (=> b!67916 (= lt!108555 (tail!318 lt!108537))))

(declare-fun lt!108545 () Unit!4571)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2278 BitStream!2278 BitStream!2278 BitStream!2278 (_ BitVec 64) List!714) Unit!4571)

(assert (=> b!67916 (= lt!108545 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3093 lt!108541) (_2!3093 lt!108541) (_1!3094 lt!108547) (_1!3094 lt!108554) (bvsub to!314 i!635) lt!108537))))

(declare-fun b!67917 () Bool)

(declare-fun e!44446 () Bool)

(assert (=> b!67917 (= e!44445 (not e!44446))))

(declare-fun res!56184 () Bool)

(assert (=> b!67917 (=> res!56184 e!44446)))

(assert (=> b!67917 (= res!56184 (bvsge i!635 to!314))))

(assert (=> b!67917 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!108538 () Unit!4571)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2278) Unit!4571)

(assert (=> b!67917 (= lt!108538 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!67917 (= lt!108536 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(declare-fun b!67918 () Bool)

(declare-fun e!44453 () Bool)

(assert (=> b!67918 (= e!44449 e!44453)))

(declare-fun res!56177 () Bool)

(assert (=> b!67918 (=> res!56177 e!44453)))

(declare-fun lt!108540 () Bool)

(assert (=> b!67918 (= res!56177 (not (= lt!108540 (bitAt!0 (buf!1712 (_1!3094 lt!108554)) lt!108536))))))

(assert (=> b!67918 (= lt!108540 (bitAt!0 (buf!1712 (_1!3094 lt!108547)) lt!108536))))

(declare-fun b!67919 () Bool)

(assert (=> b!67919 (= e!44453 e!44448)))

(declare-fun res!56174 () Bool)

(assert (=> b!67919 (=> res!56174 e!44448)))

(assert (=> b!67919 (= res!56174 (not (= (head!533 (byteArrayBitContentToList!0 (_2!3093 lt!108541) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!108553)))))

(assert (=> b!67919 (= lt!108553 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!67920 () Bool)

(declare-fun res!56183 () Bool)

(assert (=> b!67920 (=> (not res!56183) (not e!44445))))

(assert (=> b!67920 (= res!56183 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!67921 () Bool)

(declare-fun res!56173 () Bool)

(assert (=> b!67921 (=> res!56173 e!44453)))

(assert (=> b!67921 (= res!56173 (not (= (head!533 lt!108537) lt!108540)))))

(declare-fun b!67922 () Bool)

(declare-fun res!56180 () Bool)

(assert (=> b!67922 (=> res!56180 e!44444)))

(assert (=> b!67922 (= res!56180 (not (invariant!0 (currentBit!3397 (_2!3093 lt!108551)) (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108551))))))))

(declare-fun b!67923 () Bool)

(declare-fun res!56178 () Bool)

(assert (=> b!67923 (=> res!56178 e!44452)))

(assert (=> b!67923 (= res!56178 (not (= (size!1331 (buf!1712 thiss!1379)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))

(declare-fun b!67924 () Bool)

(declare-fun lt!108550 () (_ BitVec 64))

(assert (=> b!67924 (= e!44448 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108550))))

(declare-fun b!67925 () Bool)

(assert (=> b!67925 (= e!44446 e!44440)))

(declare-fun res!56175 () Bool)

(assert (=> b!67925 (=> res!56175 e!44440)))

(assert (=> b!67925 (= res!56175 (not (isPrefixOf!0 thiss!1379 (_2!3093 lt!108551))))))

(assert (=> b!67925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!108543)))

(assert (=> b!67925 (= lt!108543 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108542 () Unit!4571)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2278 BitStream!2278 (_ BitVec 64) (_ BitVec 64)) Unit!4571)

(assert (=> b!67925 (= lt!108542 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3093 lt!108551) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2278 (_ BitVec 8) (_ BitVec 32)) tuple2!5964)

(assert (=> b!67925 (= lt!108551 (appendBitFromByte!0 thiss!1379 (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!67926 () Bool)

(assert (=> b!67926 (= e!44442 e!44452)))

(declare-fun res!56170 () Bool)

(assert (=> b!67926 (=> res!56170 e!44452)))

(declare-fun lt!108549 () (_ BitVec 64))

(assert (=> b!67926 (= res!56170 (not (= lt!108549 (bvsub (bvadd lt!108536 to!314) i!635))))))

(assert (=> b!67926 (= lt!108549 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541))))))

(declare-fun b!67927 () Bool)

(assert (=> b!67927 (= e!44452 e!44444)))

(declare-fun res!56185 () Bool)

(assert (=> b!67927 (=> res!56185 e!44444)))

(assert (=> b!67927 (= res!56185 (not (= (size!1331 (buf!1712 (_2!3093 lt!108551))) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))

(assert (=> b!67927 (= lt!108549 (bvsub (bvsub (bvadd lt!108550 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67927 (= lt!108550 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (=> b!67927 (= (size!1331 (buf!1712 (_2!3093 lt!108541))) (size!1331 (buf!1712 thiss!1379)))))

(assert (= (and start!13260 res!56176) b!67920))

(assert (= (and b!67920 res!56183) b!67917))

(assert (= (and b!67917 (not res!56184)) b!67925))

(assert (= (and b!67925 (not res!56175)) b!67914))

(assert (= (and b!67914 res!56182) b!67915))

(assert (= (and b!67914 (not res!56171)) b!67926))

(assert (= (and b!67926 (not res!56170)) b!67909))

(assert (= (and b!67909 (not res!56169)) b!67923))

(assert (= (and b!67923 (not res!56178)) b!67927))

(assert (= (and b!67927 (not res!56185)) b!67922))

(assert (= (and b!67922 (not res!56180)) b!67910))

(assert (= (and b!67910 (not res!56172)) b!67913))

(assert (= (and b!67913 (not res!56186)) b!67911))

(assert (= (and b!67911 (not res!56187)) b!67916))

(assert (= (and b!67916 (not res!56181)) b!67918))

(assert (= (and b!67918 (not res!56177)) b!67921))

(assert (= (and b!67921 (not res!56173)) b!67919))

(assert (= (and b!67919 (not res!56174)) b!67908))

(assert (= (and b!67908 (not res!56179)) b!67924))

(assert (= start!13260 b!67912))

(declare-fun m!108295 () Bool)

(assert (=> b!67918 m!108295))

(declare-fun m!108297 () Bool)

(assert (=> b!67918 m!108297))

(declare-fun m!108299 () Bool)

(assert (=> b!67909 m!108299))

(declare-fun m!108301 () Bool)

(assert (=> b!67915 m!108301))

(assert (=> b!67915 m!108301))

(declare-fun m!108303 () Bool)

(assert (=> b!67915 m!108303))

(declare-fun m!108305 () Bool)

(assert (=> b!67915 m!108305))

(assert (=> b!67915 m!108305))

(declare-fun m!108307 () Bool)

(assert (=> b!67915 m!108307))

(declare-fun m!108309 () Bool)

(assert (=> b!67925 m!108309))

(declare-fun m!108311 () Bool)

(assert (=> b!67925 m!108311))

(declare-fun m!108313 () Bool)

(assert (=> b!67925 m!108313))

(declare-fun m!108315 () Bool)

(assert (=> b!67925 m!108315))

(assert (=> b!67925 m!108309))

(declare-fun m!108317 () Bool)

(assert (=> b!67925 m!108317))

(declare-fun m!108319 () Bool)

(assert (=> b!67910 m!108319))

(declare-fun m!108321 () Bool)

(assert (=> b!67922 m!108321))

(declare-fun m!108323 () Bool)

(assert (=> start!13260 m!108323))

(declare-fun m!108325 () Bool)

(assert (=> start!13260 m!108325))

(declare-fun m!108327 () Bool)

(assert (=> b!67917 m!108327))

(declare-fun m!108329 () Bool)

(assert (=> b!67917 m!108329))

(declare-fun m!108331 () Bool)

(assert (=> b!67917 m!108331))

(declare-fun m!108333 () Bool)

(assert (=> b!67919 m!108333))

(assert (=> b!67919 m!108333))

(declare-fun m!108335 () Bool)

(assert (=> b!67919 m!108335))

(declare-fun m!108337 () Bool)

(assert (=> b!67919 m!108337))

(declare-fun m!108339 () Bool)

(assert (=> b!67914 m!108339))

(declare-fun m!108341 () Bool)

(assert (=> b!67914 m!108341))

(declare-fun m!108343 () Bool)

(assert (=> b!67914 m!108343))

(declare-fun m!108345 () Bool)

(assert (=> b!67914 m!108345))

(declare-fun m!108347 () Bool)

(assert (=> b!67914 m!108347))

(declare-fun m!108349 () Bool)

(assert (=> b!67914 m!108349))

(declare-fun m!108351 () Bool)

(assert (=> b!67914 m!108351))

(declare-fun m!108353 () Bool)

(assert (=> b!67916 m!108353))

(declare-fun m!108355 () Bool)

(assert (=> b!67916 m!108355))

(declare-fun m!108357 () Bool)

(assert (=> b!67908 m!108357))

(declare-fun m!108359 () Bool)

(assert (=> b!67913 m!108359))

(declare-fun m!108361 () Bool)

(assert (=> b!67913 m!108361))

(declare-fun m!108363 () Bool)

(assert (=> b!67913 m!108363))

(declare-fun m!108365 () Bool)

(assert (=> b!67913 m!108365))

(declare-fun m!108367 () Bool)

(assert (=> b!67913 m!108367))

(declare-fun m!108369 () Bool)

(assert (=> b!67913 m!108369))

(declare-fun m!108371 () Bool)

(assert (=> b!67913 m!108371))

(declare-fun m!108373 () Bool)

(assert (=> b!67913 m!108373))

(declare-fun m!108375 () Bool)

(assert (=> b!67920 m!108375))

(declare-fun m!108377 () Bool)

(assert (=> b!67911 m!108377))

(declare-fun m!108379 () Bool)

(assert (=> b!67926 m!108379))

(declare-fun m!108381 () Bool)

(assert (=> b!67927 m!108381))

(declare-fun m!108383 () Bool)

(assert (=> b!67912 m!108383))

(declare-fun m!108385 () Bool)

(assert (=> b!67921 m!108385))

(push 1)

(assert (not b!67916))

(assert (not b!67918))

(assert (not start!13260))

(assert (not b!67922))

(assert (not b!67908))

(assert (not b!67915))

(assert (not b!67921))

(assert (not b!67917))

(assert (not b!67911))

(assert (not b!67926))

(assert (not b!67914))

(assert (not b!67912))

(assert (not b!67920))

(assert (not b!67909))

(assert (not b!67925))

(assert (not b!67919))

(assert (not b!67913))

(assert (not b!67910))

(assert (not b!67927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21570 () Bool)

(assert (=> d!21570 (= (invariant!0 (currentBit!3397 (_2!3093 lt!108551)) (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108551)))) (and (bvsge (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (bvslt (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000001000) (bvsge (currentByte!3402 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108551)))) (and (= (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (= (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108551))))))))))

(assert (=> b!67922 d!21570))

(declare-fun d!21572 () Bool)

(assert (=> d!21572 (= (array_inv!1198 (buf!1712 thiss!1379)) (bvsge (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!67912 d!21572))

(declare-fun d!21574 () Bool)

(assert (=> d!21574 (= (invariant!0 (currentBit!3397 (_2!3093 lt!108551)) (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108541)))) (and (bvsge (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (bvslt (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000001000) (bvsge (currentByte!3402 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108541)))) (and (= (currentBit!3397 (_2!3093 lt!108551)) #b00000000000000000000000000000000) (= (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))))

(assert (=> b!67910 d!21574))

(declare-fun d!21576 () Bool)

(assert (=> d!21576 (= (head!533 lt!108537) (h!829 lt!108537))))

(assert (=> b!67921 d!21576))

(declare-fun d!21578 () Bool)

(declare-fun size!1334 (List!714) Int)

(assert (=> d!21578 (= (length!342 lt!108537) (size!1334 lt!108537))))

(declare-fun bs!5217 () Bool)

(assert (= bs!5217 d!21578))

(declare-fun m!108571 () Bool)

(assert (=> bs!5217 m!108571))

(assert (=> b!67911 d!21578))

(declare-fun d!21580 () Bool)

(assert (=> d!21580 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108685 () Unit!4571)

(declare-fun choose!9 (BitStream!2278 array!2875 (_ BitVec 64) BitStream!2278) Unit!4571)

(assert (=> d!21580 (= lt!108685 (choose!9 thiss!1379 (buf!1712 (_2!3093 lt!108551)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2279 (buf!1712 (_2!3093 lt!108551)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(assert (=> d!21580 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1712 (_2!3093 lt!108551)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108685)))

(declare-fun bs!5218 () Bool)

(assert (= bs!5218 d!21580))

(assert (=> bs!5218 m!108339))

(declare-fun m!108573 () Bool)

(assert (=> bs!5218 m!108573))

(assert (=> b!67914 d!21580))

(declare-fun d!21582 () Bool)

(declare-fun res!56310 () Bool)

(declare-fun e!44543 () Bool)

(assert (=> d!21582 (=> (not res!56310) (not e!44543))))

(assert (=> d!21582 (= res!56310 (= (size!1331 (buf!1712 (_2!3093 lt!108551))) (size!1331 (buf!1712 (_2!3093 lt!108541)))))))

(assert (=> d!21582 (= (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108541)) e!44543)))

(declare-fun b!68054 () Bool)

(declare-fun res!56308 () Bool)

(assert (=> b!68054 (=> (not res!56308) (not e!44543))))

(assert (=> b!68054 (= res!56308 (bvsle (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))) (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541)))))))

(declare-fun b!68055 () Bool)

(declare-fun e!44542 () Bool)

(assert (=> b!68055 (= e!44543 e!44542)))

(declare-fun res!56309 () Bool)

(assert (=> b!68055 (=> res!56309 e!44542)))

(assert (=> b!68055 (= res!56309 (= (size!1331 (buf!1712 (_2!3093 lt!108551))) #b00000000000000000000000000000000))))

(declare-fun b!68056 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2875 array!2875 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68056 (= e!44542 (arrayBitRangesEq!0 (buf!1712 (_2!3093 lt!108551)) (buf!1712 (_2!3093 lt!108541)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551)))))))

(assert (= (and d!21582 res!56310) b!68054))

(assert (= (and b!68054 res!56308) b!68055))

(assert (= (and b!68055 (not res!56309)) b!68056))

(assert (=> b!68054 m!108381))

(assert (=> b!68054 m!108379))

(assert (=> b!68056 m!108381))

(assert (=> b!68056 m!108381))

(declare-fun m!108575 () Bool)

(assert (=> b!68056 m!108575))

(assert (=> b!67914 d!21582))

(declare-fun d!21584 () Bool)

(assert (=> d!21584 (isPrefixOf!0 thiss!1379 (_2!3093 lt!108541))))

(declare-fun lt!108688 () Unit!4571)

(declare-fun choose!30 (BitStream!2278 BitStream!2278 BitStream!2278) Unit!4571)

(assert (=> d!21584 (= lt!108688 (choose!30 thiss!1379 (_2!3093 lt!108551) (_2!3093 lt!108541)))))

(assert (=> d!21584 (isPrefixOf!0 thiss!1379 (_2!3093 lt!108551))))

(assert (=> d!21584 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3093 lt!108551) (_2!3093 lt!108541)) lt!108688)))

(declare-fun bs!5219 () Bool)

(assert (= bs!5219 d!21584))

(assert (=> bs!5219 m!108343))

(declare-fun m!108577 () Bool)

(assert (=> bs!5219 m!108577))

(assert (=> bs!5219 m!108315))

(assert (=> b!67914 d!21584))

(declare-fun b!68067 () Bool)

(declare-fun res!56319 () Bool)

(declare-fun e!44549 () Bool)

(assert (=> b!68067 (=> (not res!56319) (not e!44549))))

(declare-fun lt!108745 () tuple2!5966)

(assert (=> b!68067 (= res!56319 (isPrefixOf!0 (_1!3094 lt!108745) thiss!1379))))

(declare-fun b!68068 () Bool)

(declare-fun e!44548 () Unit!4571)

(declare-fun Unit!4577 () Unit!4571)

(assert (=> b!68068 (= e!44548 Unit!4577)))

(declare-fun b!68069 () Bool)

(declare-fun lt!108747 () Unit!4571)

(assert (=> b!68069 (= e!44548 lt!108747)))

(declare-fun lt!108741 () (_ BitVec 64))

(assert (=> b!68069 (= lt!108741 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108740 () (_ BitVec 64))

(assert (=> b!68069 (= lt!108740 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2875 array!2875 (_ BitVec 64) (_ BitVec 64)) Unit!4571)

(assert (=> b!68069 (= lt!108747 (arrayBitRangesEqSymmetric!0 (buf!1712 thiss!1379) (buf!1712 (_2!3093 lt!108551)) lt!108741 lt!108740))))

(assert (=> b!68069 (arrayBitRangesEq!0 (buf!1712 (_2!3093 lt!108551)) (buf!1712 thiss!1379) lt!108741 lt!108740)))

(declare-fun b!68070 () Bool)

(declare-fun res!56317 () Bool)

(assert (=> b!68070 (=> (not res!56317) (not e!44549))))

(assert (=> b!68070 (= res!56317 (isPrefixOf!0 (_2!3094 lt!108745) (_2!3093 lt!108551)))))

(declare-fun d!21586 () Bool)

(assert (=> d!21586 e!44549))

(declare-fun res!56318 () Bool)

(assert (=> d!21586 (=> (not res!56318) (not e!44549))))

(assert (=> d!21586 (= res!56318 (isPrefixOf!0 (_1!3094 lt!108745) (_2!3094 lt!108745)))))

(declare-fun lt!108736 () BitStream!2278)

(assert (=> d!21586 (= lt!108745 (tuple2!5967 lt!108736 (_2!3093 lt!108551)))))

(declare-fun lt!108746 () Unit!4571)

(declare-fun lt!108729 () Unit!4571)

(assert (=> d!21586 (= lt!108746 lt!108729)))

(assert (=> d!21586 (isPrefixOf!0 lt!108736 (_2!3093 lt!108551))))

(assert (=> d!21586 (= lt!108729 (lemmaIsPrefixTransitive!0 lt!108736 (_2!3093 lt!108551) (_2!3093 lt!108551)))))

(declare-fun lt!108737 () Unit!4571)

(declare-fun lt!108733 () Unit!4571)

(assert (=> d!21586 (= lt!108737 lt!108733)))

(assert (=> d!21586 (isPrefixOf!0 lt!108736 (_2!3093 lt!108551))))

(assert (=> d!21586 (= lt!108733 (lemmaIsPrefixTransitive!0 lt!108736 thiss!1379 (_2!3093 lt!108551)))))

(declare-fun lt!108731 () Unit!4571)

(assert (=> d!21586 (= lt!108731 e!44548)))

(declare-fun c!4995 () Bool)

(assert (=> d!21586 (= c!4995 (not (= (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!108730 () Unit!4571)

(declare-fun lt!108732 () Unit!4571)

(assert (=> d!21586 (= lt!108730 lt!108732)))

(assert (=> d!21586 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108551))))

(assert (=> d!21586 (= lt!108732 (lemmaIsPrefixRefl!0 (_2!3093 lt!108551)))))

(declare-fun lt!108735 () Unit!4571)

(declare-fun lt!108743 () Unit!4571)

(assert (=> d!21586 (= lt!108735 lt!108743)))

(assert (=> d!21586 (= lt!108743 (lemmaIsPrefixRefl!0 (_2!3093 lt!108551)))))

(declare-fun lt!108748 () Unit!4571)

(declare-fun lt!108738 () Unit!4571)

(assert (=> d!21586 (= lt!108748 lt!108738)))

(assert (=> d!21586 (isPrefixOf!0 lt!108736 lt!108736)))

(assert (=> d!21586 (= lt!108738 (lemmaIsPrefixRefl!0 lt!108736))))

(declare-fun lt!108739 () Unit!4571)

(declare-fun lt!108744 () Unit!4571)

(assert (=> d!21586 (= lt!108739 lt!108744)))

(assert (=> d!21586 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21586 (= lt!108744 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21586 (= lt!108736 (BitStream!2279 (buf!1712 (_2!3093 lt!108551)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(assert (=> d!21586 (isPrefixOf!0 thiss!1379 (_2!3093 lt!108551))))

(assert (=> d!21586 (= (reader!0 thiss!1379 (_2!3093 lt!108551)) lt!108745)))

(declare-fun lt!108742 () (_ BitVec 64))

(declare-fun b!68071 () Bool)

(declare-fun lt!108734 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2278 (_ BitVec 64)) BitStream!2278)

(assert (=> b!68071 (= e!44549 (= (_1!3094 lt!108745) (withMovedBitIndex!0 (_2!3094 lt!108745) (bvsub lt!108742 lt!108734))))))

(assert (=> b!68071 (or (= (bvand lt!108742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108734 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108742 lt!108734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68071 (= lt!108734 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (=> b!68071 (= lt!108742 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(assert (= (and d!21586 c!4995) b!68069))

(assert (= (and d!21586 (not c!4995)) b!68068))

(assert (= (and d!21586 res!56318) b!68067))

(assert (= (and b!68067 res!56319) b!68070))

(assert (= (and b!68070 res!56317) b!68071))

(assert (=> b!68069 m!108331))

(declare-fun m!108579 () Bool)

(assert (=> b!68069 m!108579))

(declare-fun m!108581 () Bool)

(assert (=> b!68069 m!108581))

(declare-fun m!108583 () Bool)

(assert (=> b!68070 m!108583))

(declare-fun m!108585 () Bool)

(assert (=> b!68071 m!108585))

(assert (=> b!68071 m!108381))

(assert (=> b!68071 m!108331))

(declare-fun m!108587 () Bool)

(assert (=> b!68067 m!108587))

(declare-fun m!108589 () Bool)

(assert (=> d!21586 m!108589))

(assert (=> d!21586 m!108315))

(declare-fun m!108591 () Bool)

(assert (=> d!21586 m!108591))

(declare-fun m!108593 () Bool)

(assert (=> d!21586 m!108593))

(assert (=> d!21586 m!108327))

(declare-fun m!108595 () Bool)

(assert (=> d!21586 m!108595))

(declare-fun m!108597 () Bool)

(assert (=> d!21586 m!108597))

(declare-fun m!108599 () Bool)

(assert (=> d!21586 m!108599))

(declare-fun m!108601 () Bool)

(assert (=> d!21586 m!108601))

(assert (=> d!21586 m!108329))

(declare-fun m!108603 () Bool)

(assert (=> d!21586 m!108603))

(assert (=> b!67914 d!21586))

(declare-fun d!21588 () Bool)

(declare-fun res!56322 () Bool)

(declare-fun e!44551 () Bool)

(assert (=> d!21588 (=> (not res!56322) (not e!44551))))

(assert (=> d!21588 (= res!56322 (= (size!1331 (buf!1712 thiss!1379)) (size!1331 (buf!1712 (_2!3093 lt!108541)))))))

(assert (=> d!21588 (= (isPrefixOf!0 thiss!1379 (_2!3093 lt!108541)) e!44551)))

(declare-fun b!68072 () Bool)

(declare-fun res!56320 () Bool)

(assert (=> b!68072 (=> (not res!56320) (not e!44551))))

(assert (=> b!68072 (= res!56320 (bvsle (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)) (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541)))))))

(declare-fun b!68073 () Bool)

(declare-fun e!44550 () Bool)

(assert (=> b!68073 (= e!44551 e!44550)))

(declare-fun res!56321 () Bool)

(assert (=> b!68073 (=> res!56321 e!44550)))

(assert (=> b!68073 (= res!56321 (= (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68074 () Bool)

(assert (=> b!68074 (= e!44550 (arrayBitRangesEq!0 (buf!1712 thiss!1379) (buf!1712 (_2!3093 lt!108541)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(assert (= (and d!21588 res!56322) b!68072))

(assert (= (and b!68072 res!56320) b!68073))

(assert (= (and b!68073 (not res!56321)) b!68074))

(assert (=> b!68072 m!108331))

(assert (=> b!68072 m!108379))

(assert (=> b!68074 m!108331))

(assert (=> b!68074 m!108331))

(declare-fun m!108605 () Bool)

(assert (=> b!68074 m!108605))

(assert (=> b!67914 d!21588))

(declare-fun b!68175 () Bool)

(declare-fun res!56393 () Bool)

(declare-fun e!44602 () Bool)

(assert (=> b!68175 (=> (not res!56393) (not e!44602))))

(declare-fun lt!109088 () tuple2!5964)

(assert (=> b!68175 (= res!56393 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!109088)))))

(declare-fun b!68176 () Bool)

(declare-fun res!56391 () Bool)

(assert (=> b!68176 (=> (not res!56391) (not e!44602))))

(assert (=> b!68176 (= res!56391 (invariant!0 (currentBit!3397 (_2!3093 lt!109088)) (currentByte!3402 (_2!3093 lt!109088)) (size!1331 (buf!1712 (_2!3093 lt!109088)))))))

(declare-fun b!68177 () Bool)

(declare-fun e!44601 () Bool)

(declare-fun lt!109089 () (_ BitVec 64))

(assert (=> b!68177 (= e!44601 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!109089))))

(declare-fun d!21590 () Bool)

(assert (=> d!21590 e!44602))

(declare-fun res!56392 () Bool)

(assert (=> d!21590 (=> (not res!56392) (not e!44602))))

(declare-fun lt!109097 () (_ BitVec 64))

(assert (=> d!21590 (= res!56392 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109088))) (currentByte!3402 (_2!3093 lt!109088)) (currentBit!3397 (_2!3093 lt!109088))) (bvsub lt!109097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21590 (or (= (bvand lt!109097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109055 () (_ BitVec 64))

(assert (=> d!21590 (= lt!109097 (bvadd lt!109055 to!314))))

(assert (=> d!21590 (or (not (= (bvand lt!109055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109055 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21590 (= lt!109055 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(declare-fun e!44603 () tuple2!5964)

(assert (=> d!21590 (= lt!109088 e!44603)))

(declare-fun c!5012 () Bool)

(assert (=> d!21590 (= c!5012 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!109054 () Unit!4571)

(declare-fun lt!109078 () Unit!4571)

(assert (=> d!21590 (= lt!109054 lt!109078)))

(assert (=> d!21590 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108551))))

(assert (=> d!21590 (= lt!109078 (lemmaIsPrefixRefl!0 (_2!3093 lt!108551)))))

(declare-fun lt!109087 () (_ BitVec 64))

(assert (=> d!21590 (= lt!109087 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (=> d!21590 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21590 (= (appendBitsMSBFirstLoop!0 (_2!3093 lt!108551) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!109088)))

(declare-fun b!68178 () Bool)

(declare-fun Unit!4578 () Unit!4571)

(assert (=> b!68178 (= e!44603 (tuple2!5965 Unit!4578 (_2!3093 lt!108551)))))

(assert (=> b!68178 (= (size!1331 (buf!1712 (_2!3093 lt!108551))) (size!1331 (buf!1712 (_2!3093 lt!108551))))))

(declare-fun lt!109066 () Unit!4571)

(declare-fun Unit!4579 () Unit!4571)

(assert (=> b!68178 (= lt!109066 Unit!4579)))

(declare-fun call!876 () tuple2!5966)

(declare-fun checkByteArrayBitContent!0 (BitStream!2278 array!2875 array!2875 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5976 0))(
  ( (tuple2!5977 (_1!3099 array!2875) (_2!3099 BitStream!2278)) )
))
(declare-fun readBits!0 (BitStream!2278 (_ BitVec 64)) tuple2!5976)

(assert (=> b!68178 (checkByteArrayBitContent!0 (_2!3093 lt!108551) srcBuffer!2 (_1!3099 (readBits!0 (_1!3094 call!876) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!68179 () Bool)

(declare-fun res!56395 () Bool)

(assert (=> b!68179 (=> (not res!56395) (not e!44602))))

(assert (=> b!68179 (= res!56395 (= (size!1331 (buf!1712 (_2!3093 lt!109088))) (size!1331 (buf!1712 (_2!3093 lt!108551)))))))

(declare-fun b!68180 () Bool)

(declare-fun lt!109070 () tuple2!5964)

(declare-fun Unit!4580 () Unit!4571)

(assert (=> b!68180 (= e!44603 (tuple2!5965 Unit!4580 (_2!3093 lt!109070)))))

(declare-fun lt!109086 () tuple2!5964)

(assert (=> b!68180 (= lt!109086 (appendBitFromByte!0 (_2!3093 lt!108551) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!109096 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109096 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109068 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109068 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109092 () Unit!4571)

(assert (=> b!68180 (= lt!109092 (validateOffsetBitsIneqLemma!0 (_2!3093 lt!108551) (_2!3093 lt!109086) lt!109096 lt!109068))))

(assert (=> b!68180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!109086)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!109086))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!109086))) (bvsub lt!109096 lt!109068))))

(declare-fun lt!109072 () Unit!4571)

(assert (=> b!68180 (= lt!109072 lt!109092)))

(declare-fun lt!109095 () tuple2!5966)

(assert (=> b!68180 (= lt!109095 (reader!0 (_2!3093 lt!108551) (_2!3093 lt!109086)))))

(declare-fun lt!109076 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109076 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109074 () Unit!4571)

(assert (=> b!68180 (= lt!109074 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!109086)) lt!109076))))

(assert (=> b!68180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!109086)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!109076)))

(declare-fun lt!109094 () Unit!4571)

(assert (=> b!68180 (= lt!109094 lt!109074)))

(assert (=> b!68180 (= (head!533 (byteArrayBitContentToList!0 (_2!3093 lt!109086) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!533 (bitStreamReadBitsIntoList!0 (_2!3093 lt!109086) (_1!3094 lt!109095) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109082 () Unit!4571)

(declare-fun Unit!4581 () Unit!4571)

(assert (=> b!68180 (= lt!109082 Unit!4581)))

(assert (=> b!68180 (= lt!109070 (appendBitsMSBFirstLoop!0 (_2!3093 lt!109086) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!109069 () Unit!4571)

(assert (=> b!68180 (= lt!109069 (lemmaIsPrefixTransitive!0 (_2!3093 lt!108551) (_2!3093 lt!109086) (_2!3093 lt!109070)))))

(assert (=> b!68180 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!109070))))

(declare-fun lt!109077 () Unit!4571)

(assert (=> b!68180 (= lt!109077 lt!109069)))

(assert (=> b!68180 (= (size!1331 (buf!1712 (_2!3093 lt!109070))) (size!1331 (buf!1712 (_2!3093 lt!108551))))))

(declare-fun lt!109058 () Unit!4571)

(declare-fun Unit!4582 () Unit!4571)

(assert (=> b!68180 (= lt!109058 Unit!4582)))

(assert (=> b!68180 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109070))) (currentByte!3402 (_2!3093 lt!109070)) (currentBit!3397 (_2!3093 lt!109070))) (bvsub (bvadd (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109062 () Unit!4571)

(declare-fun Unit!4583 () Unit!4571)

(assert (=> b!68180 (= lt!109062 Unit!4583)))

(assert (=> b!68180 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109070))) (currentByte!3402 (_2!3093 lt!109070)) (currentBit!3397 (_2!3093 lt!109070))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109086))) (currentByte!3402 (_2!3093 lt!109086)) (currentBit!3397 (_2!3093 lt!109086))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109084 () Unit!4571)

(declare-fun Unit!4584 () Unit!4571)

(assert (=> b!68180 (= lt!109084 Unit!4584)))

(declare-fun lt!109071 () tuple2!5966)

(assert (=> b!68180 (= lt!109071 call!876)))

(declare-fun lt!109056 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109056 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109075 () Unit!4571)

(assert (=> b!68180 (= lt!109075 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!109070)) lt!109056))))

(assert (=> b!68180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!109070)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!109056)))

(declare-fun lt!109073 () Unit!4571)

(assert (=> b!68180 (= lt!109073 lt!109075)))

(declare-fun lt!109064 () tuple2!5966)

(assert (=> b!68180 (= lt!109064 (reader!0 (_2!3093 lt!109086) (_2!3093 lt!109070)))))

(declare-fun lt!109090 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109090 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109063 () Unit!4571)

(assert (=> b!68180 (= lt!109063 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!109086) (buf!1712 (_2!3093 lt!109070)) lt!109090))))

(assert (=> b!68180 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!109070)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!109086))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!109086))) lt!109090)))

(declare-fun lt!109057 () Unit!4571)

(assert (=> b!68180 (= lt!109057 lt!109063)))

(declare-fun lt!109059 () List!714)

(assert (=> b!68180 (= lt!109059 (byteArrayBitContentToList!0 (_2!3093 lt!109070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109067 () List!714)

(assert (=> b!68180 (= lt!109067 (byteArrayBitContentToList!0 (_2!3093 lt!109070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109061 () List!714)

(assert (=> b!68180 (= lt!109061 (bitStreamReadBitsIntoList!0 (_2!3093 lt!109070) (_1!3094 lt!109071) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109079 () List!714)

(assert (=> b!68180 (= lt!109079 (bitStreamReadBitsIntoList!0 (_2!3093 lt!109070) (_1!3094 lt!109064) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109080 () (_ BitVec 64))

(assert (=> b!68180 (= lt!109080 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109081 () Unit!4571)

(assert (=> b!68180 (= lt!109081 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3093 lt!109070) (_2!3093 lt!109070) (_1!3094 lt!109071) (_1!3094 lt!109064) lt!109080 lt!109061))))

(assert (=> b!68180 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!109070) (_1!3094 lt!109064) (bvsub lt!109080 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!318 lt!109061))))

(declare-fun lt!109083 () Unit!4571)

(assert (=> b!68180 (= lt!109083 lt!109081)))

(declare-fun lt!109065 () Unit!4571)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2875 array!2875 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4571)

(assert (=> b!68180 (= lt!109065 (arrayBitRangesEqImpliesEq!0 (buf!1712 (_2!3093 lt!109086)) (buf!1712 (_2!3093 lt!109070)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!109087 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109086))) (currentByte!3402 (_2!3093 lt!109086)) (currentBit!3397 (_2!3093 lt!109086)))))))

(assert (=> b!68180 (= (bitAt!0 (buf!1712 (_2!3093 lt!109086)) lt!109087) (bitAt!0 (buf!1712 (_2!3093 lt!109070)) lt!109087))))

(declare-fun lt!109093 () Unit!4571)

(assert (=> b!68180 (= lt!109093 lt!109065)))

(declare-fun b!68181 () Bool)

(declare-fun res!56394 () Bool)

(assert (=> b!68181 (=> (not res!56394) (not e!44602))))

(assert (=> b!68181 (= res!56394 (= (size!1331 (buf!1712 (_2!3093 lt!108551))) (size!1331 (buf!1712 (_2!3093 lt!109088)))))))

(declare-fun bm!873 () Bool)

(assert (=> bm!873 (= call!876 (reader!0 (_2!3093 lt!108551) (ite c!5012 (_2!3093 lt!109070) (_2!3093 lt!108551))))))

(declare-fun b!68182 () Bool)

(declare-fun lt!109091 () tuple2!5966)

(assert (=> b!68182 (= e!44602 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!109088) (_1!3094 lt!109091) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3093 lt!109088) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!68182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109060 () Unit!4571)

(declare-fun lt!109085 () Unit!4571)

(assert (=> b!68182 (= lt!109060 lt!109085)))

(assert (=> b!68182 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!109088)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!109089)))

(assert (=> b!68182 (= lt!109085 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!109088)) lt!109089))))

(assert (=> b!68182 e!44601))

(declare-fun res!56396 () Bool)

(assert (=> b!68182 (=> (not res!56396) (not e!44601))))

(assert (=> b!68182 (= res!56396 (and (= (size!1331 (buf!1712 (_2!3093 lt!108551))) (size!1331 (buf!1712 (_2!3093 lt!109088)))) (bvsge lt!109089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68182 (= lt!109089 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!68182 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68182 (= lt!109091 (reader!0 (_2!3093 lt!108551) (_2!3093 lt!109088)))))

(assert (= (and d!21590 c!5012) b!68180))

(assert (= (and d!21590 (not c!5012)) b!68178))

(assert (= (or b!68180 b!68178) bm!873))

(assert (= (and d!21590 res!56392) b!68176))

(assert (= (and b!68176 res!56391) b!68181))

(assert (= (and b!68181 res!56394) b!68175))

(assert (= (and b!68175 res!56393) b!68179))

(assert (= (and b!68179 res!56395) b!68182))

(assert (= (and b!68182 res!56396) b!68177))

(declare-fun m!108717 () Bool)

(assert (=> b!68175 m!108717))

(declare-fun m!108719 () Bool)

(assert (=> b!68177 m!108719))

(declare-fun m!108721 () Bool)

(assert (=> bm!873 m!108721))

(declare-fun m!108723 () Bool)

(assert (=> b!68180 m!108723))

(declare-fun m!108725 () Bool)

(assert (=> b!68180 m!108725))

(declare-fun m!108727 () Bool)

(assert (=> b!68180 m!108727))

(declare-fun m!108729 () Bool)

(assert (=> b!68180 m!108729))

(declare-fun m!108731 () Bool)

(assert (=> b!68180 m!108731))

(declare-fun m!108733 () Bool)

(assert (=> b!68180 m!108733))

(declare-fun m!108735 () Bool)

(assert (=> b!68180 m!108735))

(declare-fun m!108737 () Bool)

(assert (=> b!68180 m!108737))

(declare-fun m!108739 () Bool)

(assert (=> b!68180 m!108739))

(declare-fun m!108741 () Bool)

(assert (=> b!68180 m!108741))

(declare-fun m!108743 () Bool)

(assert (=> b!68180 m!108743))

(declare-fun m!108745 () Bool)

(assert (=> b!68180 m!108745))

(declare-fun m!108747 () Bool)

(assert (=> b!68180 m!108747))

(declare-fun m!108749 () Bool)

(assert (=> b!68180 m!108749))

(declare-fun m!108751 () Bool)

(assert (=> b!68180 m!108751))

(assert (=> b!68180 m!108731))

(declare-fun m!108753 () Bool)

(assert (=> b!68180 m!108753))

(declare-fun m!108755 () Bool)

(assert (=> b!68180 m!108755))

(declare-fun m!108757 () Bool)

(assert (=> b!68180 m!108757))

(declare-fun m!108759 () Bool)

(assert (=> b!68180 m!108759))

(declare-fun m!108761 () Bool)

(assert (=> b!68180 m!108761))

(declare-fun m!108763 () Bool)

(assert (=> b!68180 m!108763))

(assert (=> b!68180 m!108727))

(declare-fun m!108765 () Bool)

(assert (=> b!68180 m!108765))

(declare-fun m!108767 () Bool)

(assert (=> b!68180 m!108767))

(declare-fun m!108769 () Bool)

(assert (=> b!68180 m!108769))

(declare-fun m!108771 () Bool)

(assert (=> b!68180 m!108771))

(declare-fun m!108773 () Bool)

(assert (=> b!68180 m!108773))

(assert (=> b!68180 m!108735))

(declare-fun m!108775 () Bool)

(assert (=> b!68180 m!108775))

(assert (=> b!68180 m!108381))

(assert (=> b!68180 m!108757))

(declare-fun m!108777 () Bool)

(assert (=> b!68180 m!108777))

(declare-fun m!108779 () Bool)

(assert (=> b!68180 m!108779))

(declare-fun m!108781 () Bool)

(assert (=> b!68180 m!108781))

(declare-fun m!108783 () Bool)

(assert (=> b!68180 m!108783))

(declare-fun m!108785 () Bool)

(assert (=> d!21590 m!108785))

(assert (=> d!21590 m!108381))

(assert (=> d!21590 m!108589))

(assert (=> d!21590 m!108599))

(declare-fun m!108787 () Bool)

(assert (=> b!68178 m!108787))

(declare-fun m!108789 () Bool)

(assert (=> b!68178 m!108789))

(declare-fun m!108791 () Bool)

(assert (=> b!68182 m!108791))

(declare-fun m!108793 () Bool)

(assert (=> b!68182 m!108793))

(declare-fun m!108795 () Bool)

(assert (=> b!68182 m!108795))

(declare-fun m!108797 () Bool)

(assert (=> b!68182 m!108797))

(declare-fun m!108799 () Bool)

(assert (=> b!68182 m!108799))

(declare-fun m!108801 () Bool)

(assert (=> b!68176 m!108801))

(assert (=> b!67914 d!21590))

(declare-fun d!21650 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21650 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5232 () Bool)

(assert (= bs!5232 d!21650))

(declare-fun m!108803 () Bool)

(assert (=> bs!5232 m!108803))

(assert (=> b!67914 d!21650))

(declare-fun d!21652 () Bool)

(declare-fun res!56399 () Bool)

(declare-fun e!44605 () Bool)

(assert (=> d!21652 (=> (not res!56399) (not e!44605))))

(assert (=> d!21652 (= res!56399 (= (size!1331 (buf!1712 thiss!1379)) (size!1331 (buf!1712 (_2!3093 lt!108551)))))))

(assert (=> d!21652 (= (isPrefixOf!0 thiss!1379 (_2!3093 lt!108551)) e!44605)))

(declare-fun b!68183 () Bool)

(declare-fun res!56397 () Bool)

(assert (=> b!68183 (=> (not res!56397) (not e!44605))))

(assert (=> b!68183 (= res!56397 (bvsle (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)) (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551)))))))

(declare-fun b!68184 () Bool)

(declare-fun e!44604 () Bool)

(assert (=> b!68184 (= e!44605 e!44604)))

(declare-fun res!56398 () Bool)

(assert (=> b!68184 (=> res!56398 e!44604)))

(assert (=> b!68184 (= res!56398 (= (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68185 () Bool)

(assert (=> b!68185 (= e!44604 (arrayBitRangesEq!0 (buf!1712 thiss!1379) (buf!1712 (_2!3093 lt!108551)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(assert (= (and d!21652 res!56399) b!68183))

(assert (= (and b!68183 res!56397) b!68184))

(assert (= (and b!68184 (not res!56398)) b!68185))

(assert (=> b!68183 m!108331))

(assert (=> b!68183 m!108381))

(assert (=> b!68185 m!108331))

(assert (=> b!68185 m!108331))

(declare-fun m!108805 () Bool)

(assert (=> b!68185 m!108805))

(assert (=> b!67925 d!21652))

(declare-fun d!21654 () Bool)

(assert (=> d!21654 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!108543) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551)))) lt!108543))))

(declare-fun bs!5233 () Bool)

(assert (= bs!5233 d!21654))

(declare-fun m!108807 () Bool)

(assert (=> bs!5233 m!108807))

(assert (=> b!67925 d!21654))

(declare-fun d!21656 () Bool)

(declare-fun e!44611 () Bool)

(assert (=> d!21656 e!44611))

(declare-fun res!56408 () Bool)

(assert (=> d!21656 (=> (not res!56408) (not e!44611))))

(assert (=> d!21656 (= res!56408 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!109144 () Unit!4571)

(declare-fun choose!27 (BitStream!2278 BitStream!2278 (_ BitVec 64) (_ BitVec 64)) Unit!4571)

(assert (=> d!21656 (= lt!109144 (choose!27 thiss!1379 (_2!3093 lt!108551) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21656 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3093 lt!108551) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109144)))

(declare-fun b!68196 () Bool)

(assert (=> b!68196 (= e!44611 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21656 res!56408) b!68196))

(declare-fun m!108809 () Bool)

(assert (=> d!21656 m!108809))

(declare-fun m!108811 () Bool)

(assert (=> b!68196 m!108811))

(assert (=> b!67925 d!21656))

(declare-fun b!68238 () Bool)

(declare-fun e!44634 () Bool)

(declare-fun e!44635 () Bool)

(assert (=> b!68238 (= e!44634 e!44635)))

(declare-fun res!56446 () Bool)

(assert (=> b!68238 (=> (not res!56446) (not e!44635))))

(declare-fun lt!109239 () Bool)

(declare-datatypes ((tuple2!5978 0))(
  ( (tuple2!5979 (_1!3100 BitStream!2278) (_2!3100 Bool)) )
))
(declare-fun lt!109248 () tuple2!5978)

(declare-fun lt!109243 () tuple2!5964)

(assert (=> b!68238 (= res!56446 (and (= (_2!3100 lt!109248) lt!109239) (= (_1!3100 lt!109248) (_2!3093 lt!109243))))))

(declare-fun readBitPure!0 (BitStream!2278) tuple2!5978)

(declare-fun readerFrom!0 (BitStream!2278 (_ BitVec 32) (_ BitVec 32)) BitStream!2278)

(assert (=> b!68238 (= lt!109248 (readBitPure!0 (readerFrom!0 (_2!3093 lt!109243) (currentBit!3397 thiss!1379) (currentByte!3402 thiss!1379))))))

(declare-fun d!21658 () Bool)

(declare-fun e!44636 () Bool)

(assert (=> d!21658 e!44636))

(declare-fun res!56450 () Bool)

(assert (=> d!21658 (=> (not res!56450) (not e!44636))))

(declare-fun lt!109247 () tuple2!5964)

(assert (=> d!21658 (= res!56450 (= (size!1331 (buf!1712 (_2!3093 lt!109247))) (size!1331 (buf!1712 thiss!1379))))))

(declare-fun lt!109246 () (_ BitVec 8))

(declare-fun lt!109238 () array!2875)

(assert (=> d!21658 (= lt!109246 (select (arr!1904 lt!109238) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21658 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1331 lt!109238)))))

(assert (=> d!21658 (= lt!109238 (array!2876 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!109245 () tuple2!5964)

(assert (=> d!21658 (= lt!109247 (tuple2!5965 (_1!3093 lt!109245) (_2!3093 lt!109245)))))

(assert (=> d!21658 (= lt!109245 lt!109243)))

(assert (=> d!21658 e!44634))

(declare-fun res!56445 () Bool)

(assert (=> d!21658 (=> (not res!56445) (not e!44634))))

(assert (=> d!21658 (= res!56445 (= (size!1331 (buf!1712 thiss!1379)) (size!1331 (buf!1712 (_2!3093 lt!109243)))))))

(declare-fun appendBit!0 (BitStream!2278 Bool) tuple2!5964)

(assert (=> d!21658 (= lt!109243 (appendBit!0 thiss!1379 lt!109239))))

(assert (=> d!21658 (= lt!109239 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21658 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21658 (= (appendBitFromByte!0 thiss!1379 (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!109247)))

(declare-fun b!68239 () Bool)

(assert (=> b!68239 (= e!44635 (= (bitIndex!0 (size!1331 (buf!1712 (_1!3100 lt!109248))) (currentByte!3402 (_1!3100 lt!109248)) (currentBit!3397 (_1!3100 lt!109248))) (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109243))) (currentByte!3402 (_2!3093 lt!109243)) (currentBit!3397 (_2!3093 lt!109243)))))))

(declare-fun b!68240 () Bool)

(declare-fun e!44633 () Bool)

(assert (=> b!68240 (= e!44636 e!44633)))

(declare-fun res!56447 () Bool)

(assert (=> b!68240 (=> (not res!56447) (not e!44633))))

(declare-fun lt!109241 () tuple2!5978)

(assert (=> b!68240 (= res!56447 (and (= (_2!3100 lt!109241) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!109246)) #b00000000000000000000000000000000))) (= (_1!3100 lt!109241) (_2!3093 lt!109247))))))

(declare-fun lt!109242 () tuple2!5976)

(declare-fun lt!109240 () BitStream!2278)

(assert (=> b!68240 (= lt!109242 (readBits!0 lt!109240 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68240 (= lt!109241 (readBitPure!0 lt!109240))))

(assert (=> b!68240 (= lt!109240 (readerFrom!0 (_2!3093 lt!109247) (currentBit!3397 thiss!1379) (currentByte!3402 thiss!1379)))))

(declare-fun b!68241 () Bool)

(declare-fun res!56449 () Bool)

(assert (=> b!68241 (=> (not res!56449) (not e!44634))))

(assert (=> b!68241 (= res!56449 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109243))) (currentByte!3402 (_2!3093 lt!109243)) (currentBit!3397 (_2!3093 lt!109243))) (bvadd (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68242 () Bool)

(declare-fun res!56444 () Bool)

(assert (=> b!68242 (=> (not res!56444) (not e!44636))))

(assert (=> b!68242 (= res!56444 (isPrefixOf!0 thiss!1379 (_2!3093 lt!109247)))))

(declare-fun b!68243 () Bool)

(assert (=> b!68243 (= e!44633 (= (bitIndex!0 (size!1331 (buf!1712 (_1!3100 lt!109241))) (currentByte!3402 (_1!3100 lt!109241)) (currentBit!3397 (_1!3100 lt!109241))) (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109247))) (currentByte!3402 (_2!3093 lt!109247)) (currentBit!3397 (_2!3093 lt!109247)))))))

(declare-fun b!68244 () Bool)

(declare-fun res!56443 () Bool)

(assert (=> b!68244 (=> (not res!56443) (not e!44636))))

(declare-fun lt!109244 () (_ BitVec 64))

(declare-fun lt!109249 () (_ BitVec 64))

(assert (=> b!68244 (= res!56443 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!109247))) (currentByte!3402 (_2!3093 lt!109247)) (currentBit!3397 (_2!3093 lt!109247))) (bvadd lt!109249 lt!109244)))))

(assert (=> b!68244 (or (not (= (bvand lt!109249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109244 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109249 lt!109244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68244 (= lt!109244 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!68244 (= lt!109249 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(declare-fun b!68245 () Bool)

(declare-fun res!56448 () Bool)

(assert (=> b!68245 (=> (not res!56448) (not e!44634))))

(assert (=> b!68245 (= res!56448 (isPrefixOf!0 thiss!1379 (_2!3093 lt!109243)))))

(assert (= (and d!21658 res!56445) b!68241))

(assert (= (and b!68241 res!56449) b!68245))

(assert (= (and b!68245 res!56448) b!68238))

(assert (= (and b!68238 res!56446) b!68239))

(assert (= (and d!21658 res!56450) b!68244))

(assert (= (and b!68244 res!56443) b!68242))

(assert (= (and b!68242 res!56444) b!68240))

(assert (= (and b!68240 res!56447) b!68243))

(declare-fun m!108945 () Bool)

(assert (=> b!68242 m!108945))

(declare-fun m!108947 () Bool)

(assert (=> d!21658 m!108947))

(declare-fun m!108949 () Bool)

(assert (=> d!21658 m!108949))

(declare-fun m!108951 () Bool)

(assert (=> d!21658 m!108951))

(declare-fun m!108953 () Bool)

(assert (=> b!68241 m!108953))

(assert (=> b!68241 m!108331))

(declare-fun m!108955 () Bool)

(assert (=> b!68244 m!108955))

(assert (=> b!68244 m!108331))

(declare-fun m!108957 () Bool)

(assert (=> b!68238 m!108957))

(assert (=> b!68238 m!108957))

(declare-fun m!108959 () Bool)

(assert (=> b!68238 m!108959))

(declare-fun m!108961 () Bool)

(assert (=> b!68245 m!108961))

(declare-fun m!108963 () Bool)

(assert (=> b!68239 m!108963))

(assert (=> b!68239 m!108953))

(declare-fun m!108965 () Bool)

(assert (=> b!68240 m!108965))

(declare-fun m!108967 () Bool)

(assert (=> b!68240 m!108967))

(declare-fun m!108969 () Bool)

(assert (=> b!68240 m!108969))

(declare-fun m!108971 () Bool)

(assert (=> b!68243 m!108971))

(assert (=> b!68243 m!108955))

(assert (=> b!67925 d!21658))

(declare-fun d!21682 () Bool)

(assert (=> d!21682 (= (head!533 (byteArrayBitContentToList!0 (_2!3093 lt!108551) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!829 (byteArrayBitContentToList!0 (_2!3093 lt!108551) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67915 d!21682))

(declare-fun d!21684 () Bool)

(declare-fun c!5019 () Bool)

(assert (=> d!21684 (= c!5019 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44639 () List!714)

(assert (=> d!21684 (= (byteArrayBitContentToList!0 (_2!3093 lt!108551) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44639)))

(declare-fun b!68250 () Bool)

(assert (=> b!68250 (= e!44639 Nil!711)))

(declare-fun b!68251 () Bool)

(assert (=> b!68251 (= e!44639 (Cons!710 (not (= (bvand ((_ sign_extend 24) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3093 lt!108551) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21684 c!5019) b!68250))

(assert (= (and d!21684 (not c!5019)) b!68251))

(assert (=> b!68251 m!108309))

(assert (=> b!68251 m!108951))

(declare-fun m!108973 () Bool)

(assert (=> b!68251 m!108973))

(assert (=> b!67915 d!21684))

(declare-fun d!21686 () Bool)

(assert (=> d!21686 (= (head!533 (bitStreamReadBitsIntoList!0 (_2!3093 lt!108551) (_1!3094 lt!108539) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!829 (bitStreamReadBitsIntoList!0 (_2!3093 lt!108551) (_1!3094 lt!108539) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67915 d!21686))

(declare-fun b!68260 () Bool)

(declare-datatypes ((tuple2!5982 0))(
  ( (tuple2!5983 (_1!3102 List!714) (_2!3102 BitStream!2278)) )
))
(declare-fun e!44645 () tuple2!5982)

(assert (=> b!68260 (= e!44645 (tuple2!5983 Nil!711 (_1!3094 lt!108539)))))

(declare-datatypes ((tuple2!5984 0))(
  ( (tuple2!5985 (_1!3103 Bool) (_2!3103 BitStream!2278)) )
))
(declare-fun lt!109258 () tuple2!5984)

(declare-fun lt!109257 () (_ BitVec 64))

(declare-fun b!68261 () Bool)

(assert (=> b!68261 (= e!44645 (tuple2!5983 (Cons!710 (_1!3103 lt!109258) (bitStreamReadBitsIntoList!0 (_2!3093 lt!108551) (_2!3103 lt!109258) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!109257))) (_2!3103 lt!109258)))))

(declare-fun readBit!0 (BitStream!2278) tuple2!5984)

(assert (=> b!68261 (= lt!109258 (readBit!0 (_1!3094 lt!108539)))))

(assert (=> b!68261 (= lt!109257 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21688 () Bool)

(declare-fun e!44644 () Bool)

(assert (=> d!21688 e!44644))

(declare-fun c!5024 () Bool)

(assert (=> d!21688 (= c!5024 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109256 () List!714)

(assert (=> d!21688 (= lt!109256 (_1!3102 e!44645))))

(declare-fun c!5025 () Bool)

(assert (=> d!21688 (= c!5025 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21688 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21688 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!108551) (_1!3094 lt!108539) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109256)))

(declare-fun b!68262 () Bool)

(declare-fun isEmpty!216 (List!714) Bool)

(assert (=> b!68262 (= e!44644 (isEmpty!216 lt!109256))))

(declare-fun b!68263 () Bool)

(assert (=> b!68263 (= e!44644 (> (length!342 lt!109256) 0))))

(assert (= (and d!21688 c!5025) b!68260))

(assert (= (and d!21688 (not c!5025)) b!68261))

(assert (= (and d!21688 c!5024) b!68262))

(assert (= (and d!21688 (not c!5024)) b!68263))

(declare-fun m!108975 () Bool)

(assert (=> b!68261 m!108975))

(declare-fun m!108977 () Bool)

(assert (=> b!68261 m!108977))

(declare-fun m!108979 () Bool)

(assert (=> b!68262 m!108979))

(declare-fun m!108981 () Bool)

(assert (=> b!68263 m!108981))

(assert (=> b!67915 d!21688))

(declare-fun b!68264 () Bool)

(declare-fun e!44647 () tuple2!5982)

(assert (=> b!68264 (= e!44647 (tuple2!5983 Nil!711 (_1!3094 lt!108547)))))

(declare-fun lt!109260 () (_ BitVec 64))

(declare-fun lt!109261 () tuple2!5984)

(declare-fun b!68265 () Bool)

(assert (=> b!68265 (= e!44647 (tuple2!5983 (Cons!710 (_1!3103 lt!109261) (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_2!3103 lt!109261) (bvsub (bvsub to!314 i!635) lt!109260))) (_2!3103 lt!109261)))))

(assert (=> b!68265 (= lt!109261 (readBit!0 (_1!3094 lt!108547)))))

(assert (=> b!68265 (= lt!109260 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21690 () Bool)

(declare-fun e!44646 () Bool)

(assert (=> d!21690 e!44646))

(declare-fun c!5026 () Bool)

(assert (=> d!21690 (= c!5026 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109259 () List!714)

(assert (=> d!21690 (= lt!109259 (_1!3102 e!44647))))

(declare-fun c!5027 () Bool)

(assert (=> d!21690 (= c!5027 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21690 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21690 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_1!3094 lt!108547) (bvsub to!314 i!635)) lt!109259)))

(declare-fun b!68266 () Bool)

(assert (=> b!68266 (= e!44646 (isEmpty!216 lt!109259))))

(declare-fun b!68267 () Bool)

(assert (=> b!68267 (= e!44646 (> (length!342 lt!109259) 0))))

(assert (= (and d!21690 c!5027) b!68264))

(assert (= (and d!21690 (not c!5027)) b!68265))

(assert (= (and d!21690 c!5026) b!68266))

(assert (= (and d!21690 (not c!5026)) b!68267))

(declare-fun m!108983 () Bool)

(assert (=> b!68265 m!108983))

(declare-fun m!108985 () Bool)

(assert (=> b!68265 m!108985))

(declare-fun m!108987 () Bool)

(assert (=> b!68266 m!108987))

(declare-fun m!108989 () Bool)

(assert (=> b!68267 m!108989))

(assert (=> b!67913 d!21690))

(declare-fun b!68268 () Bool)

(declare-fun res!56453 () Bool)

(declare-fun e!44649 () Bool)

(assert (=> b!68268 (=> (not res!56453) (not e!44649))))

(declare-fun lt!109278 () tuple2!5966)

(assert (=> b!68268 (= res!56453 (isPrefixOf!0 (_1!3094 lt!109278) thiss!1379))))

(declare-fun b!68269 () Bool)

(declare-fun e!44648 () Unit!4571)

(declare-fun Unit!4592 () Unit!4571)

(assert (=> b!68269 (= e!44648 Unit!4592)))

(declare-fun b!68270 () Bool)

(declare-fun lt!109280 () Unit!4571)

(assert (=> b!68270 (= e!44648 lt!109280)))

(declare-fun lt!109274 () (_ BitVec 64))

(assert (=> b!68270 (= lt!109274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109273 () (_ BitVec 64))

(assert (=> b!68270 (= lt!109273 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(assert (=> b!68270 (= lt!109280 (arrayBitRangesEqSymmetric!0 (buf!1712 thiss!1379) (buf!1712 (_2!3093 lt!108541)) lt!109274 lt!109273))))

(assert (=> b!68270 (arrayBitRangesEq!0 (buf!1712 (_2!3093 lt!108541)) (buf!1712 thiss!1379) lt!109274 lt!109273)))

(declare-fun b!68271 () Bool)

(declare-fun res!56451 () Bool)

(assert (=> b!68271 (=> (not res!56451) (not e!44649))))

(assert (=> b!68271 (= res!56451 (isPrefixOf!0 (_2!3094 lt!109278) (_2!3093 lt!108541)))))

(declare-fun d!21692 () Bool)

(assert (=> d!21692 e!44649))

(declare-fun res!56452 () Bool)

(assert (=> d!21692 (=> (not res!56452) (not e!44649))))

(assert (=> d!21692 (= res!56452 (isPrefixOf!0 (_1!3094 lt!109278) (_2!3094 lt!109278)))))

(declare-fun lt!109269 () BitStream!2278)

(assert (=> d!21692 (= lt!109278 (tuple2!5967 lt!109269 (_2!3093 lt!108541)))))

(declare-fun lt!109279 () Unit!4571)

(declare-fun lt!109262 () Unit!4571)

(assert (=> d!21692 (= lt!109279 lt!109262)))

(assert (=> d!21692 (isPrefixOf!0 lt!109269 (_2!3093 lt!108541))))

(assert (=> d!21692 (= lt!109262 (lemmaIsPrefixTransitive!0 lt!109269 (_2!3093 lt!108541) (_2!3093 lt!108541)))))

(declare-fun lt!109270 () Unit!4571)

(declare-fun lt!109266 () Unit!4571)

(assert (=> d!21692 (= lt!109270 lt!109266)))

(assert (=> d!21692 (isPrefixOf!0 lt!109269 (_2!3093 lt!108541))))

(assert (=> d!21692 (= lt!109266 (lemmaIsPrefixTransitive!0 lt!109269 thiss!1379 (_2!3093 lt!108541)))))

(declare-fun lt!109264 () Unit!4571)

(assert (=> d!21692 (= lt!109264 e!44648)))

(declare-fun c!5028 () Bool)

(assert (=> d!21692 (= c!5028 (not (= (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!109263 () Unit!4571)

(declare-fun lt!109265 () Unit!4571)

(assert (=> d!21692 (= lt!109263 lt!109265)))

(assert (=> d!21692 (isPrefixOf!0 (_2!3093 lt!108541) (_2!3093 lt!108541))))

(assert (=> d!21692 (= lt!109265 (lemmaIsPrefixRefl!0 (_2!3093 lt!108541)))))

(declare-fun lt!109268 () Unit!4571)

(declare-fun lt!109276 () Unit!4571)

(assert (=> d!21692 (= lt!109268 lt!109276)))

(assert (=> d!21692 (= lt!109276 (lemmaIsPrefixRefl!0 (_2!3093 lt!108541)))))

(declare-fun lt!109281 () Unit!4571)

(declare-fun lt!109271 () Unit!4571)

(assert (=> d!21692 (= lt!109281 lt!109271)))

(assert (=> d!21692 (isPrefixOf!0 lt!109269 lt!109269)))

(assert (=> d!21692 (= lt!109271 (lemmaIsPrefixRefl!0 lt!109269))))

(declare-fun lt!109272 () Unit!4571)

(declare-fun lt!109277 () Unit!4571)

(assert (=> d!21692 (= lt!109272 lt!109277)))

(assert (=> d!21692 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21692 (= lt!109277 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21692 (= lt!109269 (BitStream!2279 (buf!1712 (_2!3093 lt!108541)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(assert (=> d!21692 (isPrefixOf!0 thiss!1379 (_2!3093 lt!108541))))

(assert (=> d!21692 (= (reader!0 thiss!1379 (_2!3093 lt!108541)) lt!109278)))

(declare-fun lt!109267 () (_ BitVec 64))

(declare-fun b!68272 () Bool)

(declare-fun lt!109275 () (_ BitVec 64))

(assert (=> b!68272 (= e!44649 (= (_1!3094 lt!109278) (withMovedBitIndex!0 (_2!3094 lt!109278) (bvsub lt!109275 lt!109267))))))

(assert (=> b!68272 (or (= (bvand lt!109275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109275 lt!109267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68272 (= lt!109267 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541))))))

(assert (=> b!68272 (= lt!109275 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)))))

(assert (= (and d!21692 c!5028) b!68270))

(assert (= (and d!21692 (not c!5028)) b!68269))

(assert (= (and d!21692 res!56452) b!68268))

(assert (= (and b!68268 res!56453) b!68271))

(assert (= (and b!68271 res!56451) b!68272))

(assert (=> b!68270 m!108331))

(declare-fun m!108991 () Bool)

(assert (=> b!68270 m!108991))

(declare-fun m!108993 () Bool)

(assert (=> b!68270 m!108993))

(declare-fun m!108995 () Bool)

(assert (=> b!68271 m!108995))

(declare-fun m!108997 () Bool)

(assert (=> b!68272 m!108997))

(assert (=> b!68272 m!108379))

(assert (=> b!68272 m!108331))

(declare-fun m!108999 () Bool)

(assert (=> b!68268 m!108999))

(declare-fun m!109001 () Bool)

(assert (=> d!21692 m!109001))

(assert (=> d!21692 m!108343))

(declare-fun m!109003 () Bool)

(assert (=> d!21692 m!109003))

(declare-fun m!109005 () Bool)

(assert (=> d!21692 m!109005))

(assert (=> d!21692 m!108327))

(declare-fun m!109007 () Bool)

(assert (=> d!21692 m!109007))

(declare-fun m!109009 () Bool)

(assert (=> d!21692 m!109009))

(declare-fun m!109011 () Bool)

(assert (=> d!21692 m!109011))

(declare-fun m!109013 () Bool)

(assert (=> d!21692 m!109013))

(assert (=> d!21692 m!108329))

(declare-fun m!109015 () Bool)

(assert (=> d!21692 m!109015))

(assert (=> b!67913 d!21692))

(declare-fun d!21694 () Bool)

(assert (=> d!21694 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!108543)))

(declare-fun lt!109282 () Unit!4571)

(assert (=> d!21694 (= lt!109282 (choose!9 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!108541)) lt!108543 (BitStream!2279 (buf!1712 (_2!3093 lt!108541)) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551)))))))

(assert (=> d!21694 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3093 lt!108551) (buf!1712 (_2!3093 lt!108541)) lt!108543) lt!109282)))

(declare-fun bs!5240 () Bool)

(assert (= bs!5240 d!21694))

(assert (=> bs!5240 m!108369))

(declare-fun m!109017 () Bool)

(assert (=> bs!5240 m!109017))

(assert (=> b!67913 d!21694))

(declare-fun b!68273 () Bool)

(declare-fun res!56456 () Bool)

(declare-fun e!44651 () Bool)

(assert (=> b!68273 (=> (not res!56456) (not e!44651))))

(declare-fun lt!109299 () tuple2!5966)

(assert (=> b!68273 (= res!56456 (isPrefixOf!0 (_1!3094 lt!109299) (_2!3093 lt!108551)))))

(declare-fun b!68274 () Bool)

(declare-fun e!44650 () Unit!4571)

(declare-fun Unit!4593 () Unit!4571)

(assert (=> b!68274 (= e!44650 Unit!4593)))

(declare-fun b!68275 () Bool)

(declare-fun lt!109301 () Unit!4571)

(assert (=> b!68275 (= e!44650 lt!109301)))

(declare-fun lt!109295 () (_ BitVec 64))

(assert (=> b!68275 (= lt!109295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109294 () (_ BitVec 64))

(assert (=> b!68275 (= lt!109294 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (=> b!68275 (= lt!109301 (arrayBitRangesEqSymmetric!0 (buf!1712 (_2!3093 lt!108551)) (buf!1712 (_2!3093 lt!108541)) lt!109295 lt!109294))))

(assert (=> b!68275 (arrayBitRangesEq!0 (buf!1712 (_2!3093 lt!108541)) (buf!1712 (_2!3093 lt!108551)) lt!109295 lt!109294)))

(declare-fun b!68276 () Bool)

(declare-fun res!56454 () Bool)

(assert (=> b!68276 (=> (not res!56454) (not e!44651))))

(assert (=> b!68276 (= res!56454 (isPrefixOf!0 (_2!3094 lt!109299) (_2!3093 lt!108541)))))

(declare-fun d!21696 () Bool)

(assert (=> d!21696 e!44651))

(declare-fun res!56455 () Bool)

(assert (=> d!21696 (=> (not res!56455) (not e!44651))))

(assert (=> d!21696 (= res!56455 (isPrefixOf!0 (_1!3094 lt!109299) (_2!3094 lt!109299)))))

(declare-fun lt!109290 () BitStream!2278)

(assert (=> d!21696 (= lt!109299 (tuple2!5967 lt!109290 (_2!3093 lt!108541)))))

(declare-fun lt!109300 () Unit!4571)

(declare-fun lt!109283 () Unit!4571)

(assert (=> d!21696 (= lt!109300 lt!109283)))

(assert (=> d!21696 (isPrefixOf!0 lt!109290 (_2!3093 lt!108541))))

(assert (=> d!21696 (= lt!109283 (lemmaIsPrefixTransitive!0 lt!109290 (_2!3093 lt!108541) (_2!3093 lt!108541)))))

(declare-fun lt!109291 () Unit!4571)

(declare-fun lt!109287 () Unit!4571)

(assert (=> d!21696 (= lt!109291 lt!109287)))

(assert (=> d!21696 (isPrefixOf!0 lt!109290 (_2!3093 lt!108541))))

(assert (=> d!21696 (= lt!109287 (lemmaIsPrefixTransitive!0 lt!109290 (_2!3093 lt!108551) (_2!3093 lt!108541)))))

(declare-fun lt!109285 () Unit!4571)

(assert (=> d!21696 (= lt!109285 e!44650)))

(declare-fun c!5029 () Bool)

(assert (=> d!21696 (= c!5029 (not (= (size!1331 (buf!1712 (_2!3093 lt!108551))) #b00000000000000000000000000000000)))))

(declare-fun lt!109284 () Unit!4571)

(declare-fun lt!109286 () Unit!4571)

(assert (=> d!21696 (= lt!109284 lt!109286)))

(assert (=> d!21696 (isPrefixOf!0 (_2!3093 lt!108541) (_2!3093 lt!108541))))

(assert (=> d!21696 (= lt!109286 (lemmaIsPrefixRefl!0 (_2!3093 lt!108541)))))

(declare-fun lt!109289 () Unit!4571)

(declare-fun lt!109297 () Unit!4571)

(assert (=> d!21696 (= lt!109289 lt!109297)))

(assert (=> d!21696 (= lt!109297 (lemmaIsPrefixRefl!0 (_2!3093 lt!108541)))))

(declare-fun lt!109302 () Unit!4571)

(declare-fun lt!109292 () Unit!4571)

(assert (=> d!21696 (= lt!109302 lt!109292)))

(assert (=> d!21696 (isPrefixOf!0 lt!109290 lt!109290)))

(assert (=> d!21696 (= lt!109292 (lemmaIsPrefixRefl!0 lt!109290))))

(declare-fun lt!109293 () Unit!4571)

(declare-fun lt!109298 () Unit!4571)

(assert (=> d!21696 (= lt!109293 lt!109298)))

(assert (=> d!21696 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108551))))

(assert (=> d!21696 (= lt!109298 (lemmaIsPrefixRefl!0 (_2!3093 lt!108551)))))

(assert (=> d!21696 (= lt!109290 (BitStream!2279 (buf!1712 (_2!3093 lt!108541)) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (=> d!21696 (isPrefixOf!0 (_2!3093 lt!108551) (_2!3093 lt!108541))))

(assert (=> d!21696 (= (reader!0 (_2!3093 lt!108551) (_2!3093 lt!108541)) lt!109299)))

(declare-fun b!68277 () Bool)

(declare-fun lt!109296 () (_ BitVec 64))

(declare-fun lt!109288 () (_ BitVec 64))

(assert (=> b!68277 (= e!44651 (= (_1!3094 lt!109299) (withMovedBitIndex!0 (_2!3094 lt!109299) (bvsub lt!109296 lt!109288))))))

(assert (=> b!68277 (or (= (bvand lt!109296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109296 lt!109288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68277 (= lt!109288 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541))))))

(assert (=> b!68277 (= lt!109296 (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))))))

(assert (= (and d!21696 c!5029) b!68275))

(assert (= (and d!21696 (not c!5029)) b!68274))

(assert (= (and d!21696 res!56455) b!68273))

(assert (= (and b!68273 res!56456) b!68276))

(assert (= (and b!68276 res!56454) b!68277))

(assert (=> b!68275 m!108381))

(declare-fun m!109019 () Bool)

(assert (=> b!68275 m!109019))

(declare-fun m!109021 () Bool)

(assert (=> b!68275 m!109021))

(declare-fun m!109023 () Bool)

(assert (=> b!68276 m!109023))

(declare-fun m!109025 () Bool)

(assert (=> b!68277 m!109025))

(assert (=> b!68277 m!108379))

(assert (=> b!68277 m!108381))

(declare-fun m!109027 () Bool)

(assert (=> b!68273 m!109027))

(assert (=> d!21696 m!109001))

(assert (=> d!21696 m!108345))

(declare-fun m!109029 () Bool)

(assert (=> d!21696 m!109029))

(declare-fun m!109031 () Bool)

(assert (=> d!21696 m!109031))

(assert (=> d!21696 m!108589))

(declare-fun m!109033 () Bool)

(assert (=> d!21696 m!109033))

(declare-fun m!109035 () Bool)

(assert (=> d!21696 m!109035))

(assert (=> d!21696 m!109011))

(declare-fun m!109037 () Bool)

(assert (=> d!21696 m!109037))

(assert (=> d!21696 m!108599))

(declare-fun m!109039 () Bool)

(assert (=> d!21696 m!109039))

(assert (=> b!67913 d!21696))

(declare-fun b!68278 () Bool)

(declare-fun e!44653 () tuple2!5982)

(assert (=> b!68278 (= e!44653 (tuple2!5983 Nil!711 (_1!3094 lt!108554)))))

(declare-fun lt!109304 () (_ BitVec 64))

(declare-fun b!68279 () Bool)

(declare-fun lt!109305 () tuple2!5984)

(assert (=> b!68279 (= e!44653 (tuple2!5983 (Cons!710 (_1!3103 lt!109305) (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_2!3103 lt!109305) (bvsub lt!108543 lt!109304))) (_2!3103 lt!109305)))))

(assert (=> b!68279 (= lt!109305 (readBit!0 (_1!3094 lt!108554)))))

(assert (=> b!68279 (= lt!109304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!21698 () Bool)

(declare-fun e!44652 () Bool)

(assert (=> d!21698 e!44652))

(declare-fun c!5030 () Bool)

(assert (=> d!21698 (= c!5030 (= lt!108543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109303 () List!714)

(assert (=> d!21698 (= lt!109303 (_1!3102 e!44653))))

(declare-fun c!5031 () Bool)

(assert (=> d!21698 (= c!5031 (= lt!108543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21698 (bvsge lt!108543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21698 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_1!3094 lt!108554) lt!108543) lt!109303)))

(declare-fun b!68280 () Bool)

(assert (=> b!68280 (= e!44652 (isEmpty!216 lt!109303))))

(declare-fun b!68281 () Bool)

(assert (=> b!68281 (= e!44652 (> (length!342 lt!109303) 0))))

(assert (= (and d!21698 c!5031) b!68278))

(assert (= (and d!21698 (not c!5031)) b!68279))

(assert (= (and d!21698 c!5030) b!68280))

(assert (= (and d!21698 (not c!5030)) b!68281))

(declare-fun m!109041 () Bool)

(assert (=> b!68279 m!109041))

(declare-fun m!109043 () Bool)

(assert (=> b!68279 m!109043))

(declare-fun m!109045 () Bool)

(assert (=> b!68280 m!109045))

(declare-fun m!109047 () Bool)

(assert (=> b!68281 m!109047))

(assert (=> b!67913 d!21698))

(declare-fun d!21700 () Bool)

(assert (=> d!21700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5241 () Bool)

(assert (= bs!5241 d!21700))

(declare-fun m!109049 () Bool)

(assert (=> bs!5241 m!109049))

(assert (=> b!67913 d!21700))

(declare-fun d!21702 () Bool)

(assert (=> d!21702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551))) lt!108543) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551)))) lt!108543))))

(declare-fun bs!5242 () Bool)

(assert (= bs!5242 d!21702))

(declare-fun m!109051 () Bool)

(assert (=> bs!5242 m!109051))

(assert (=> b!67913 d!21702))

(declare-fun d!21704 () Bool)

(assert (=> d!21704 (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109306 () Unit!4571)

(assert (=> d!21704 (= lt!109306 (choose!9 thiss!1379 (buf!1712 (_2!3093 lt!108541)) (bvsub to!314 i!635) (BitStream!2279 (buf!1712 (_2!3093 lt!108541)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(assert (=> d!21704 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1712 (_2!3093 lt!108541)) (bvsub to!314 i!635)) lt!109306)))

(declare-fun bs!5243 () Bool)

(assert (= bs!5243 d!21704))

(assert (=> bs!5243 m!108361))

(declare-fun m!109053 () Bool)

(assert (=> bs!5243 m!109053))

(assert (=> b!67913 d!21704))

(declare-fun d!21706 () Bool)

(declare-fun res!56459 () Bool)

(declare-fun e!44655 () Bool)

(assert (=> d!21706 (=> (not res!56459) (not e!44655))))

(assert (=> d!21706 (= res!56459 (= (size!1331 (buf!1712 thiss!1379)) (size!1331 (buf!1712 thiss!1379))))))

(assert (=> d!21706 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44655)))

(declare-fun b!68282 () Bool)

(declare-fun res!56457 () Bool)

(assert (=> b!68282 (=> (not res!56457) (not e!44655))))

(assert (=> b!68282 (= res!56457 (bvsle (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)) (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(declare-fun b!68283 () Bool)

(declare-fun e!44654 () Bool)

(assert (=> b!68283 (= e!44655 e!44654)))

(declare-fun res!56458 () Bool)

(assert (=> b!68283 (=> res!56458 e!44654)))

(assert (=> b!68283 (= res!56458 (= (size!1331 (buf!1712 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68284 () Bool)

(assert (=> b!68284 (= e!44654 (arrayBitRangesEq!0 (buf!1712 thiss!1379) (buf!1712 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379))))))

(assert (= (and d!21706 res!56459) b!68282))

(assert (= (and b!68282 res!56457) b!68283))

(assert (= (and b!68283 (not res!56458)) b!68284))

(assert (=> b!68282 m!108331))

(assert (=> b!68282 m!108331))

(assert (=> b!68284 m!108331))

(assert (=> b!68284 m!108331))

(declare-fun m!109055 () Bool)

(assert (=> b!68284 m!109055))

(assert (=> b!67917 d!21706))

(declare-fun d!21708 () Bool)

(assert (=> d!21708 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109309 () Unit!4571)

(declare-fun choose!11 (BitStream!2278) Unit!4571)

(assert (=> d!21708 (= lt!109309 (choose!11 thiss!1379))))

(assert (=> d!21708 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!109309)))

(declare-fun bs!5245 () Bool)

(assert (= bs!5245 d!21708))

(assert (=> bs!5245 m!108327))

(declare-fun m!109057 () Bool)

(assert (=> bs!5245 m!109057))

(assert (=> b!67917 d!21708))

(declare-fun d!21710 () Bool)

(declare-fun e!44658 () Bool)

(assert (=> d!21710 e!44658))

(declare-fun res!56464 () Bool)

(assert (=> d!21710 (=> (not res!56464) (not e!44658))))

(declare-fun lt!109326 () (_ BitVec 64))

(declare-fun lt!109324 () (_ BitVec 64))

(declare-fun lt!109325 () (_ BitVec 64))

(assert (=> d!21710 (= res!56464 (= lt!109325 (bvsub lt!109326 lt!109324)))))

(assert (=> d!21710 (or (= (bvand lt!109326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109326 lt!109324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21710 (= lt!109324 (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379))))))

(declare-fun lt!109322 () (_ BitVec 64))

(declare-fun lt!109323 () (_ BitVec 64))

(assert (=> d!21710 (= lt!109326 (bvmul lt!109322 lt!109323))))

(assert (=> d!21710 (or (= lt!109322 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109323 (bvsdiv (bvmul lt!109322 lt!109323) lt!109322)))))

(assert (=> d!21710 (= lt!109323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21710 (= lt!109322 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))))))

(assert (=> d!21710 (= lt!109325 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3402 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3397 thiss!1379))))))

(assert (=> d!21710 (invariant!0 (currentBit!3397 thiss!1379) (currentByte!3402 thiss!1379) (size!1331 (buf!1712 thiss!1379)))))

(assert (=> d!21710 (= (bitIndex!0 (size!1331 (buf!1712 thiss!1379)) (currentByte!3402 thiss!1379) (currentBit!3397 thiss!1379)) lt!109325)))

(declare-fun b!68289 () Bool)

(declare-fun res!56465 () Bool)

(assert (=> b!68289 (=> (not res!56465) (not e!44658))))

(assert (=> b!68289 (= res!56465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109325))))

(declare-fun b!68290 () Bool)

(declare-fun lt!109327 () (_ BitVec 64))

(assert (=> b!68290 (= e!44658 (bvsle lt!109325 (bvmul lt!109327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68290 (or (= lt!109327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109327)))))

(assert (=> b!68290 (= lt!109327 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))))))

(assert (= (and d!21710 res!56464) b!68289))

(assert (= (and b!68289 res!56465) b!68290))

(declare-fun m!109059 () Bool)

(assert (=> d!21710 m!109059))

(declare-fun m!109061 () Bool)

(assert (=> d!21710 m!109061))

(assert (=> b!67917 d!21710))

(declare-fun d!21712 () Bool)

(declare-fun e!44659 () Bool)

(assert (=> d!21712 e!44659))

(declare-fun res!56466 () Bool)

(assert (=> d!21712 (=> (not res!56466) (not e!44659))))

(declare-fun lt!109331 () (_ BitVec 64))

(declare-fun lt!109330 () (_ BitVec 64))

(declare-fun lt!109332 () (_ BitVec 64))

(assert (=> d!21712 (= res!56466 (= lt!109331 (bvsub lt!109332 lt!109330)))))

(assert (=> d!21712 (or (= (bvand lt!109332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109330 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109332 lt!109330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21712 (= lt!109330 (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108541))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108541)))))))

(declare-fun lt!109328 () (_ BitVec 64))

(declare-fun lt!109329 () (_ BitVec 64))

(assert (=> d!21712 (= lt!109332 (bvmul lt!109328 lt!109329))))

(assert (=> d!21712 (or (= lt!109328 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109329 (bvsdiv (bvmul lt!109328 lt!109329) lt!109328)))))

(assert (=> d!21712 (= lt!109329 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21712 (= lt!109328 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))))))

(assert (=> d!21712 (= lt!109331 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108541))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108541)))))))

(assert (=> d!21712 (invariant!0 (currentBit!3397 (_2!3093 lt!108541)) (currentByte!3402 (_2!3093 lt!108541)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))

(assert (=> d!21712 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108541))) (currentByte!3402 (_2!3093 lt!108541)) (currentBit!3397 (_2!3093 lt!108541))) lt!109331)))

(declare-fun b!68291 () Bool)

(declare-fun res!56467 () Bool)

(assert (=> b!68291 (=> (not res!56467) (not e!44659))))

(assert (=> b!68291 (= res!56467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109331))))

(declare-fun b!68292 () Bool)

(declare-fun lt!109333 () (_ BitVec 64))

(assert (=> b!68292 (= e!44659 (bvsle lt!109331 (bvmul lt!109333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68292 (or (= lt!109333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109333)))))

(assert (=> b!68292 (= lt!109333 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108541)))))))

(assert (= (and d!21712 res!56466) b!68291))

(assert (= (and b!68291 res!56467) b!68292))

(declare-fun m!109063 () Bool)

(assert (=> d!21712 m!109063))

(assert (=> d!21712 m!108299))

(assert (=> b!67926 d!21712))

(declare-fun d!21714 () Bool)

(assert (=> d!21714 (= (tail!318 lt!108537) (t!1464 lt!108537))))

(assert (=> b!67916 d!21714))

(declare-fun d!21716 () Bool)

(declare-fun e!44662 () Bool)

(assert (=> d!21716 e!44662))

(declare-fun res!56470 () Bool)

(assert (=> d!21716 (=> (not res!56470) (not e!44662))))

(declare-fun lt!109347 () (_ BitVec 64))

(assert (=> d!21716 (= res!56470 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109347 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!109347) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21716 (= lt!109347 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109346 () Unit!4571)

(declare-fun choose!42 (BitStream!2278 BitStream!2278 BitStream!2278 BitStream!2278 (_ BitVec 64) List!714) Unit!4571)

(assert (=> d!21716 (= lt!109346 (choose!42 (_2!3093 lt!108541) (_2!3093 lt!108541) (_1!3094 lt!108547) (_1!3094 lt!108554) (bvsub to!314 i!635) lt!108537))))

(assert (=> d!21716 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21716 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3093 lt!108541) (_2!3093 lt!108541) (_1!3094 lt!108547) (_1!3094 lt!108554) (bvsub to!314 i!635) lt!108537) lt!109346)))

(declare-fun b!68296 () Bool)

(assert (=> b!68296 (= e!44662 (= (bitStreamReadBitsIntoList!0 (_2!3093 lt!108541) (_1!3094 lt!108554) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!318 lt!108537)))))

(assert (= (and d!21716 res!56470) b!68296))

(declare-fun m!109065 () Bool)

(assert (=> d!21716 m!109065))

(declare-fun m!109067 () Bool)

(assert (=> b!68296 m!109067))

(assert (=> b!68296 m!108353))

(assert (=> b!67916 d!21716))

(declare-fun d!21718 () Bool)

(declare-fun e!44665 () Bool)

(assert (=> d!21718 e!44665))

(declare-fun res!56477 () Bool)

(assert (=> d!21718 (=> (not res!56477) (not e!44665))))

(declare-fun lt!109352 () (_ BitVec 64))

(declare-fun lt!109354 () (_ BitVec 64))

(declare-fun lt!109353 () (_ BitVec 64))

(assert (=> d!21718 (= res!56477 (= lt!109353 (bvsub lt!109354 lt!109352)))))

(assert (=> d!21718 (or (= (bvand lt!109354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109352 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109354 lt!109352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21718 (= lt!109352 (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))) ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551)))))))

(declare-fun lt!109350 () (_ BitVec 64))

(declare-fun lt!109351 () (_ BitVec 64))

(assert (=> d!21718 (= lt!109354 (bvmul lt!109350 lt!109351))))

(assert (=> d!21718 (or (= lt!109350 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109351 (bvsdiv (bvmul lt!109350 lt!109351) lt!109350)))))

(assert (=> d!21718 (= lt!109351 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21718 (= lt!109350 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))))))

(assert (=> d!21718 (= lt!109353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3402 (_2!3093 lt!108551))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3397 (_2!3093 lt!108551)))))))

(assert (=> d!21718 (invariant!0 (currentBit!3397 (_2!3093 lt!108551)) (currentByte!3402 (_2!3093 lt!108551)) (size!1331 (buf!1712 (_2!3093 lt!108551))))))

(assert (=> d!21718 (= (bitIndex!0 (size!1331 (buf!1712 (_2!3093 lt!108551))) (currentByte!3402 (_2!3093 lt!108551)) (currentBit!3397 (_2!3093 lt!108551))) lt!109353)))

(declare-fun b!68303 () Bool)

(declare-fun res!56478 () Bool)

(assert (=> b!68303 (=> (not res!56478) (not e!44665))))

(assert (=> b!68303 (= res!56478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109353))))

(declare-fun b!68304 () Bool)

(declare-fun lt!109355 () (_ BitVec 64))

(assert (=> b!68304 (= e!44665 (bvsle lt!109353 (bvmul lt!109355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68304 (or (= lt!109355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109355)))))

(assert (=> b!68304 (= lt!109355 ((_ sign_extend 32) (size!1331 (buf!1712 (_2!3093 lt!108551)))))))

(assert (= (and d!21718 res!56477) b!68303))

(assert (= (and b!68303 res!56478) b!68304))

(assert (=> d!21718 m!108807))

(assert (=> d!21718 m!108321))

(assert (=> b!67927 d!21718))

(declare-fun d!21720 () Bool)

(assert (=> d!21720 (= (invariant!0 (currentBit!3397 (_2!3093 lt!108541)) (currentByte!3402 (_2!3093 lt!108541)) (size!1331 (buf!1712 (_2!3093 lt!108541)))) (and (bvsge (currentBit!3397 (_2!3093 lt!108541)) #b00000000000000000000000000000000) (bvslt (currentBit!3397 (_2!3093 lt!108541)) #b00000000000000000000000000001000) (bvsge (currentByte!3402 (_2!3093 lt!108541)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3402 (_2!3093 lt!108541)) (size!1331 (buf!1712 (_2!3093 lt!108541)))) (and (= (currentBit!3397 (_2!3093 lt!108541)) #b00000000000000000000000000000000) (= (currentByte!3402 (_2!3093 lt!108541)) (size!1331 (buf!1712 (_2!3093 lt!108541))))))))))

(assert (=> b!67909 d!21720))

(declare-fun d!21722 () Bool)

(assert (=> d!21722 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1331 (buf!1712 thiss!1379))) ((_ sign_extend 32) (currentByte!3402 thiss!1379)) ((_ sign_extend 32) (currentBit!3397 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5246 () Bool)

(assert (= bs!5246 d!21722))

(assert (=> bs!5246 m!109059))

(assert (=> b!67920 d!21722))

(declare-fun d!21724 () Bool)

(assert (=> d!21724 (= (bitAt!0 (buf!1712 (_1!3094 lt!108554)) lt!108536) (not (= (bvand ((_ sign_extend 24) (select (arr!1904 (buf!1712 (_1!3094 lt!108554))) ((_ extract 31 0) (bvsdiv lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5247 () Bool)

(assert (= bs!5247 d!21724))

(declare-fun m!109069 () Bool)

(assert (=> bs!5247 m!109069))

(declare-fun m!109071 () Bool)

(assert (=> bs!5247 m!109071))

(assert (=> b!67918 d!21724))

(declare-fun d!21726 () Bool)

(assert (=> d!21726 (= (bitAt!0 (buf!1712 (_1!3094 lt!108547)) lt!108536) (not (= (bvand ((_ sign_extend 24) (select (arr!1904 (buf!1712 (_1!3094 lt!108547))) ((_ extract 31 0) (bvsdiv lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5248 () Bool)

(assert (= bs!5248 d!21726))

(declare-fun m!109073 () Bool)

(assert (=> bs!5248 m!109073))

(assert (=> bs!5248 m!109071))

(assert (=> b!67918 d!21726))

(declare-fun d!21728 () Bool)

(assert (=> d!21728 (= (array_inv!1198 srcBuffer!2) (bvsge (size!1331 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13260 d!21728))

(declare-fun d!21730 () Bool)

(assert (=> d!21730 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3397 thiss!1379) (currentByte!3402 thiss!1379) (size!1331 (buf!1712 thiss!1379))))))

(declare-fun bs!5249 () Bool)

(assert (= bs!5249 d!21730))

(assert (=> bs!5249 m!109061))

(assert (=> start!13260 d!21730))

(declare-fun d!21732 () Bool)

(assert (=> d!21732 (= (bitAt!0 (buf!1712 (_2!3093 lt!108551)) lt!108536) (not (= (bvand ((_ sign_extend 24) (select (arr!1904 (buf!1712 (_2!3093 lt!108551))) ((_ extract 31 0) (bvsdiv lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108536 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5250 () Bool)

(assert (= bs!5250 d!21732))

(declare-fun m!109075 () Bool)

(assert (=> bs!5250 m!109075))

(assert (=> bs!5250 m!109071))

(assert (=> b!67908 d!21732))

(declare-fun d!21734 () Bool)

(assert (=> d!21734 (= (head!533 (byteArrayBitContentToList!0 (_2!3093 lt!108541) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!829 (byteArrayBitContentToList!0 (_2!3093 lt!108541) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!67919 d!21734))

(declare-fun d!21736 () Bool)

(declare-fun c!5032 () Bool)

(assert (=> d!21736 (= c!5032 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44672 () List!714)

(assert (=> d!21736 (= (byteArrayBitContentToList!0 (_2!3093 lt!108541) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44672)))

(declare-fun b!68315 () Bool)

(assert (=> b!68315 (= e!44672 Nil!711)))

(declare-fun b!68316 () Bool)

(assert (=> b!68316 (= e!44672 (Cons!710 (not (= (bvand ((_ sign_extend 24) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3093 lt!108541) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21736 c!5032) b!68315))

(assert (= (and d!21736 (not c!5032)) b!68316))

(assert (=> b!68316 m!108309))

(assert (=> b!68316 m!108951))

(declare-fun m!109077 () Bool)

(assert (=> b!68316 m!109077))

(assert (=> b!67919 d!21736))

(declare-fun d!21738 () Bool)

(assert (=> d!21738 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1904 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5251 () Bool)

(assert (= bs!5251 d!21738))

(assert (=> bs!5251 m!108309))

(assert (=> bs!5251 m!108951))

(assert (=> b!67919 d!21738))

(push 1)

(assert (not d!21718))

(assert (not b!68262))

(assert (not b!68067))

(assert (not d!21702))

(assert (not d!21708))

(assert (not b!68279))

(assert (not b!68238))

(assert (not bm!873))

(assert (not b!68266))

(assert (not b!68267))

(assert (not d!21658))

(assert (not d!21578))

(assert (not d!21730))

(assert (not d!21654))

(assert (not d!21584))

(assert (not b!68182))

(assert (not d!21704))

(assert (not b!68265))

(assert (not b!68251))

(assert (not b!68270))

(assert (not b!68243))

(assert (not b!68056))

(assert (not b!68196))

(assert (not b!68282))

(assert (not b!68183))

(assert (not d!21692))

(assert (not d!21722))

(assert (not d!21700))

(assert (not b!68271))

(assert (not d!21590))

(assert (not b!68261))

(assert (not b!68244))

(assert (not d!21710))

(assert (not b!68268))

(assert (not b!68275))

(assert (not b!68071))

(assert (not b!68180))

(assert (not b!68272))

(assert (not b!68054))

(assert (not b!68239))

(assert (not b!68281))

(assert (not b!68263))

(assert (not b!68072))

(assert (not d!21712))

(assert (not b!68276))

(assert (not b!68070))

(assert (not b!68176))

(assert (not b!68240))

(assert (not b!68185))

(assert (not b!68241))

(assert (not d!21696))

(assert (not b!68316))

(assert (not b!68273))

(assert (not b!68284))

(assert (not b!68280))

(assert (not b!68175))

(assert (not b!68177))

(assert (not b!68074))

(assert (not b!68245))

(assert (not d!21580))

(assert (not b!68069))

(assert (not b!68178))

(assert (not b!68277))

(assert (not b!68242))

(assert (not d!21716))

(assert (not b!68296))

(assert (not d!21694))

(assert (not d!21656))

(assert (not d!21650))

(assert (not d!21586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

