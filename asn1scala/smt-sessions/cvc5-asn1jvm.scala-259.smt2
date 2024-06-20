; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5110 () Bool)

(assert start!5110)

(declare-fun res!17645 () Bool)

(declare-fun e!13563 () Bool)

(assert (=> start!5110 (=> (not res!17645) (not e!13563))))

(declare-datatypes ((array!1445 0))(
  ( (array!1446 (arr!1057 (Array (_ BitVec 32) (_ BitVec 8))) (size!613 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1445)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5110 (= res!17645 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!613 srcBuffer!2))))))))

(assert (=> start!5110 e!13563))

(assert (=> start!5110 true))

(declare-fun array_inv!583 (array!1445) Bool)

(assert (=> start!5110 (array_inv!583 srcBuffer!2)))

(declare-datatypes ((BitStream!1060 0))(
  ( (BitStream!1061 (buf!922 array!1445) (currentByte!2211 (_ BitVec 32)) (currentBit!2206 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1060)

(declare-fun e!13562 () Bool)

(declare-fun inv!12 (BitStream!1060) Bool)

(assert (=> start!5110 (and (inv!12 thiss!1379) e!13562)))

(declare-fun b!20304 () Bool)

(declare-fun e!13557 () Bool)

(declare-datatypes ((tuple2!2360 0))(
  ( (tuple2!2361 (_1!1265 BitStream!1060) (_2!1265 BitStream!1060)) )
))
(declare-fun lt!29006 () tuple2!2360)

(declare-datatypes ((Unit!1779 0))(
  ( (Unit!1780) )
))
(declare-datatypes ((tuple2!2362 0))(
  ( (tuple2!2363 (_1!1266 Unit!1779) (_2!1266 BitStream!1060)) )
))
(declare-fun lt!29010 () tuple2!2362)

(declare-datatypes ((List!231 0))(
  ( (Nil!228) (Cons!227 (h!346 Bool) (t!981 List!231)) )
))
(declare-fun head!68 (List!231) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1060 array!1445 (_ BitVec 64) (_ BitVec 64)) List!231)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1060 BitStream!1060 (_ BitVec 64)) List!231)

(assert (=> b!20304 (= e!13557 (= (head!68 (byteArrayBitContentToList!0 (_2!1266 lt!29010) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!68 (bitStreamReadBitsIntoList!0 (_2!1266 lt!29010) (_1!1265 lt!29006) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20305 () Bool)

(declare-fun res!17644 () Bool)

(assert (=> b!20305 (=> (not res!17644) (not e!13563))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20305 (= res!17644 (validate_offset_bits!1 ((_ sign_extend 32) (size!613 (buf!922 thiss!1379))) ((_ sign_extend 32) (currentByte!2211 thiss!1379)) ((_ sign_extend 32) (currentBit!2206 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20306 () Bool)

(declare-fun e!13559 () Bool)

(assert (=> b!20306 (= e!13563 (not e!13559))))

(declare-fun res!17643 () Bool)

(assert (=> b!20306 (=> res!17643 e!13559)))

(assert (=> b!20306 (= res!17643 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1060 BitStream!1060) Bool)

(assert (=> b!20306 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29011 () Unit!1779)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1060) Unit!1779)

(assert (=> b!20306 (= lt!29011 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29009 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20306 (= lt!29009 (bitIndex!0 (size!613 (buf!922 thiss!1379)) (currentByte!2211 thiss!1379) (currentBit!2206 thiss!1379)))))

(declare-fun b!20307 () Bool)

(declare-fun e!13558 () Bool)

(assert (=> b!20307 (= e!13558 true)))

(assert (=> b!20307 e!13557))

(declare-fun res!17642 () Bool)

(assert (=> b!20307 (=> (not res!17642) (not e!13557))))

(assert (=> b!20307 (= res!17642 (validate_offset_bits!1 ((_ sign_extend 32) (size!613 (buf!922 (_2!1266 lt!29010)))) ((_ sign_extend 32) (currentByte!2211 thiss!1379)) ((_ sign_extend 32) (currentBit!2206 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29007 () Unit!1779)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1060 array!1445 (_ BitVec 64)) Unit!1779)

(assert (=> b!20307 (= lt!29007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!922 (_2!1266 lt!29010)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1060 BitStream!1060) tuple2!2360)

(assert (=> b!20307 (= lt!29006 (reader!0 thiss!1379 (_2!1266 lt!29010)))))

(declare-fun b!20308 () Bool)

(assert (=> b!20308 (= e!13562 (array_inv!583 (buf!922 thiss!1379)))))

(declare-fun b!20309 () Bool)

(assert (=> b!20309 (= e!13559 e!13558)))

(declare-fun res!17641 () Bool)

(assert (=> b!20309 (=> res!17641 e!13558)))

(assert (=> b!20309 (= res!17641 (not (isPrefixOf!0 thiss!1379 (_2!1266 lt!29010))))))

(assert (=> b!20309 (validate_offset_bits!1 ((_ sign_extend 32) (size!613 (buf!922 (_2!1266 lt!29010)))) ((_ sign_extend 32) (currentByte!2211 (_2!1266 lt!29010))) ((_ sign_extend 32) (currentBit!2206 (_2!1266 lt!29010))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29008 () Unit!1779)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1060 BitStream!1060 (_ BitVec 64) (_ BitVec 64)) Unit!1779)

(assert (=> b!20309 (= lt!29008 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1266 lt!29010) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1060 (_ BitVec 8) (_ BitVec 32)) tuple2!2362)

(assert (=> b!20309 (= lt!29010 (appendBitFromByte!0 thiss!1379 (select (arr!1057 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5110 res!17645) b!20305))

(assert (= (and b!20305 res!17644) b!20306))

(assert (= (and b!20306 (not res!17643)) b!20309))

(assert (= (and b!20309 (not res!17641)) b!20307))

(assert (= (and b!20307 res!17642) b!20304))

(assert (= start!5110 b!20308))

(declare-fun m!27435 () Bool)

(assert (=> start!5110 m!27435))

(declare-fun m!27437 () Bool)

(assert (=> start!5110 m!27437))

(declare-fun m!27439 () Bool)

(assert (=> b!20308 m!27439))

(declare-fun m!27441 () Bool)

(assert (=> b!20309 m!27441))

(declare-fun m!27443 () Bool)

(assert (=> b!20309 m!27443))

(assert (=> b!20309 m!27441))

(declare-fun m!27445 () Bool)

(assert (=> b!20309 m!27445))

(declare-fun m!27447 () Bool)

(assert (=> b!20309 m!27447))

(declare-fun m!27449 () Bool)

(assert (=> b!20309 m!27449))

(declare-fun m!27451 () Bool)

(assert (=> b!20304 m!27451))

(assert (=> b!20304 m!27451))

(declare-fun m!27453 () Bool)

(assert (=> b!20304 m!27453))

(declare-fun m!27455 () Bool)

(assert (=> b!20304 m!27455))

(assert (=> b!20304 m!27455))

(declare-fun m!27457 () Bool)

(assert (=> b!20304 m!27457))

(declare-fun m!27459 () Bool)

(assert (=> b!20306 m!27459))

(declare-fun m!27461 () Bool)

(assert (=> b!20306 m!27461))

(declare-fun m!27463 () Bool)

(assert (=> b!20306 m!27463))

(declare-fun m!27465 () Bool)

(assert (=> b!20307 m!27465))

(declare-fun m!27467 () Bool)

(assert (=> b!20307 m!27467))

(declare-fun m!27469 () Bool)

(assert (=> b!20307 m!27469))

(declare-fun m!27471 () Bool)

(assert (=> b!20305 m!27471))

(push 1)

(assert (not b!20308))

(assert (not b!20305))

(assert (not b!20304))

(assert (not start!5110))

(assert (not b!20307))

(assert (not b!20309))

(assert (not b!20306))

(check-sat)

