; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5640 () Bool)

(assert start!5640)

(declare-fun b!23076 () Bool)

(declare-fun e!15586 () Bool)

(declare-fun e!15589 () Bool)

(assert (=> b!23076 (= e!15586 e!15589)))

(declare-fun res!19828 () Bool)

(assert (=> b!23076 (=> res!19828 e!15589)))

(declare-datatypes ((array!1563 0))(
  ( (array!1564 (arr!1123 (Array (_ BitVec 32) (_ BitVec 8))) (size!667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1166 0))(
  ( (BitStream!1167 (buf!988 array!1563) (currentByte!2301 (_ BitVec 32)) (currentBit!2296 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1166)

(declare-datatypes ((Unit!1977 0))(
  ( (Unit!1978) )
))
(declare-datatypes ((tuple2!2650 0))(
  ( (tuple2!2651 (_1!1412 Unit!1977) (_2!1412 BitStream!1166)) )
))
(declare-fun lt!33712 () tuple2!2650)

(declare-fun isPrefixOf!0 (BitStream!1166 BitStream!1166) Bool)

(assert (=> b!23076 (= res!19828 (not (isPrefixOf!0 thiss!1379 (_2!1412 lt!33712))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23076 (validate_offset_bits!1 ((_ sign_extend 32) (size!667 (buf!988 (_2!1412 lt!33712)))) ((_ sign_extend 32) (currentByte!2301 (_2!1412 lt!33712))) ((_ sign_extend 32) (currentBit!2296 (_2!1412 lt!33712))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33709 () Unit!1977)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1166 BitStream!1166 (_ BitVec 64) (_ BitVec 64)) Unit!1977)

(assert (=> b!23076 (= lt!33709 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1412 lt!33712) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1563)

(declare-fun appendBitFromByte!0 (BitStream!1166 (_ BitVec 8) (_ BitVec 32)) tuple2!2650)

(assert (=> b!23076 (= lt!33712 (appendBitFromByte!0 thiss!1379 (select (arr!1123 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23077 () Bool)

(declare-fun res!19834 () Bool)

(declare-fun e!15585 () Bool)

(assert (=> b!23077 (=> res!19834 e!15585)))

(declare-fun lt!33717 () tuple2!2650)

(assert (=> b!23077 (= res!19834 (not (= (size!667 (buf!988 thiss!1379)) (size!667 (buf!988 (_2!1412 lt!33717))))))))

(declare-fun b!23078 () Bool)

(declare-fun res!19832 () Bool)

(declare-fun e!15584 () Bool)

(assert (=> b!23078 (=> res!19832 e!15584)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23078 (= res!19832 (not (invariant!0 (currentBit!2296 (_2!1412 lt!33712)) (currentByte!2301 (_2!1412 lt!33712)) (size!667 (buf!988 (_2!1412 lt!33712))))))))

(declare-fun res!19827 () Bool)

(declare-fun e!15588 () Bool)

(assert (=> start!5640 (=> (not res!19827) (not e!15588))))

(assert (=> start!5640 (= res!19827 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!667 srcBuffer!2))))))))

(assert (=> start!5640 e!15588))

(assert (=> start!5640 true))

(declare-fun array_inv!636 (array!1563) Bool)

(assert (=> start!5640 (array_inv!636 srcBuffer!2)))

(declare-fun e!15591 () Bool)

(declare-fun inv!12 (BitStream!1166) Bool)

(assert (=> start!5640 (and (inv!12 thiss!1379) e!15591)))

(declare-fun b!23079 () Bool)

(assert (=> b!23079 (= e!15585 e!15584)))

(declare-fun res!19829 () Bool)

(assert (=> b!23079 (=> res!19829 e!15584)))

(assert (=> b!23079 (= res!19829 (not (= (size!667 (buf!988 (_2!1412 lt!33712))) (size!667 (buf!988 (_2!1412 lt!33717))))))))

(declare-fun e!15587 () Bool)

(assert (=> b!23079 e!15587))

(declare-fun res!19833 () Bool)

(assert (=> b!23079 (=> (not res!19833) (not e!15587))))

(assert (=> b!23079 (= res!19833 (= (size!667 (buf!988 (_2!1412 lt!33717))) (size!667 (buf!988 thiss!1379))))))

(declare-fun b!23080 () Bool)

(assert (=> b!23080 (= e!15588 (not e!15586))))

(declare-fun res!19831 () Bool)

(assert (=> b!23080 (=> res!19831 e!15586)))

(assert (=> b!23080 (= res!19831 (bvsge i!635 to!314))))

(assert (=> b!23080 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33718 () Unit!1977)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1166) Unit!1977)

(assert (=> b!23080 (= lt!33718 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!33710 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23080 (= lt!33710 (bitIndex!0 (size!667 (buf!988 thiss!1379)) (currentByte!2301 thiss!1379) (currentBit!2296 thiss!1379)))))

(declare-fun b!23081 () Bool)

(assert (=> b!23081 (= e!15591 (array_inv!636 (buf!988 thiss!1379)))))

(declare-fun b!23082 () Bool)

(declare-fun res!19830 () Bool)

(assert (=> b!23082 (=> res!19830 e!15584)))

(assert (=> b!23082 (= res!19830 (not (invariant!0 (currentBit!2296 (_2!1412 lt!33712)) (currentByte!2301 (_2!1412 lt!33712)) (size!667 (buf!988 (_2!1412 lt!33717))))))))

(declare-fun b!23083 () Bool)

(declare-fun e!15582 () Bool)

(assert (=> b!23083 (= e!15589 e!15582)))

(declare-fun res!19825 () Bool)

(assert (=> b!23083 (=> res!19825 e!15582)))

(assert (=> b!23083 (= res!19825 (not (isPrefixOf!0 (_2!1412 lt!33712) (_2!1412 lt!33717))))))

(assert (=> b!23083 (isPrefixOf!0 thiss!1379 (_2!1412 lt!33717))))

(declare-fun lt!33713 () Unit!1977)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1166 BitStream!1166 BitStream!1166) Unit!1977)

(assert (=> b!23083 (= lt!33713 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1412 lt!33712) (_2!1412 lt!33717)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1166 array!1563 (_ BitVec 64) (_ BitVec 64)) tuple2!2650)

(assert (=> b!23083 (= lt!33717 (appendBitsMSBFirstLoop!0 (_2!1412 lt!33712) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15592 () Bool)

(assert (=> b!23083 e!15592))

(declare-fun res!19826 () Bool)

(assert (=> b!23083 (=> (not res!19826) (not e!15592))))

(assert (=> b!23083 (= res!19826 (validate_offset_bits!1 ((_ sign_extend 32) (size!667 (buf!988 (_2!1412 lt!33712)))) ((_ sign_extend 32) (currentByte!2301 thiss!1379)) ((_ sign_extend 32) (currentBit!2296 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33716 () Unit!1977)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1166 array!1563 (_ BitVec 64)) Unit!1977)

(assert (=> b!23083 (= lt!33716 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!988 (_2!1412 lt!33712)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2652 0))(
  ( (tuple2!2653 (_1!1413 BitStream!1166) (_2!1413 BitStream!1166)) )
))
(declare-fun lt!33714 () tuple2!2652)

(declare-fun reader!0 (BitStream!1166 BitStream!1166) tuple2!2652)

(assert (=> b!23083 (= lt!33714 (reader!0 thiss!1379 (_2!1412 lt!33712)))))

(declare-fun b!23084 () Bool)

(declare-fun res!19835 () Bool)

(assert (=> b!23084 (=> res!19835 e!15585)))

(assert (=> b!23084 (= res!19835 (not (invariant!0 (currentBit!2296 (_2!1412 lt!33717)) (currentByte!2301 (_2!1412 lt!33717)) (size!667 (buf!988 (_2!1412 lt!33717))))))))

(declare-fun b!23085 () Bool)

(declare-fun lt!33715 () (_ BitVec 64))

(assert (=> b!23085 (= e!15587 (= lt!33715 (bvsub (bvsub (bvadd (bitIndex!0 (size!667 (buf!988 (_2!1412 lt!33712))) (currentByte!2301 (_2!1412 lt!33712)) (currentBit!2296 (_2!1412 lt!33712))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23086 () Bool)

(assert (=> b!23086 (= e!15584 true)))

(declare-fun lt!33711 () tuple2!2652)

(assert (=> b!23086 (= lt!33711 (reader!0 thiss!1379 (_2!1412 lt!33717)))))

(declare-fun b!23087 () Bool)

(assert (=> b!23087 (= e!15582 e!15585)))

(declare-fun res!19824 () Bool)

(assert (=> b!23087 (=> res!19824 e!15585)))

(assert (=> b!23087 (= res!19824 (not (= lt!33715 (bvsub (bvadd lt!33710 to!314) i!635))))))

(assert (=> b!23087 (= lt!33715 (bitIndex!0 (size!667 (buf!988 (_2!1412 lt!33717))) (currentByte!2301 (_2!1412 lt!33717)) (currentBit!2296 (_2!1412 lt!33717))))))

(declare-fun b!23088 () Bool)

(declare-datatypes ((List!284 0))(
  ( (Nil!281) (Cons!280 (h!399 Bool) (t!1034 List!284)) )
))
(declare-fun head!121 (List!284) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1166 array!1563 (_ BitVec 64) (_ BitVec 64)) List!284)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1166 BitStream!1166 (_ BitVec 64)) List!284)

(assert (=> b!23088 (= e!15592 (= (head!121 (byteArrayBitContentToList!0 (_2!1412 lt!33712) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!121 (bitStreamReadBitsIntoList!0 (_2!1412 lt!33712) (_1!1413 lt!33714) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23089 () Bool)

(declare-fun res!19836 () Bool)

(assert (=> b!23089 (=> (not res!19836) (not e!15588))))

(assert (=> b!23089 (= res!19836 (validate_offset_bits!1 ((_ sign_extend 32) (size!667 (buf!988 thiss!1379))) ((_ sign_extend 32) (currentByte!2301 thiss!1379)) ((_ sign_extend 32) (currentBit!2296 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5640 res!19827) b!23089))

(assert (= (and b!23089 res!19836) b!23080))

(assert (= (and b!23080 (not res!19831)) b!23076))

(assert (= (and b!23076 (not res!19828)) b!23083))

(assert (= (and b!23083 res!19826) b!23088))

(assert (= (and b!23083 (not res!19825)) b!23087))

(assert (= (and b!23087 (not res!19824)) b!23084))

(assert (= (and b!23084 (not res!19835)) b!23077))

(assert (= (and b!23077 (not res!19834)) b!23079))

(assert (= (and b!23079 res!19833) b!23085))

(assert (= (and b!23079 (not res!19829)) b!23078))

(assert (= (and b!23078 (not res!19832)) b!23082))

(assert (= (and b!23082 (not res!19830)) b!23086))

(assert (= start!5640 b!23081))

(declare-fun m!32429 () Bool)

(assert (=> b!23089 m!32429))

(declare-fun m!32431 () Bool)

(assert (=> b!23088 m!32431))

(assert (=> b!23088 m!32431))

(declare-fun m!32433 () Bool)

(assert (=> b!23088 m!32433))

(declare-fun m!32435 () Bool)

(assert (=> b!23088 m!32435))

(assert (=> b!23088 m!32435))

(declare-fun m!32437 () Bool)

(assert (=> b!23088 m!32437))

(declare-fun m!32439 () Bool)

(assert (=> b!23085 m!32439))

(declare-fun m!32441 () Bool)

(assert (=> start!5640 m!32441))

(declare-fun m!32443 () Bool)

(assert (=> start!5640 m!32443))

(declare-fun m!32445 () Bool)

(assert (=> b!23086 m!32445))

(declare-fun m!32447 () Bool)

(assert (=> b!23083 m!32447))

(declare-fun m!32449 () Bool)

(assert (=> b!23083 m!32449))

(declare-fun m!32451 () Bool)

(assert (=> b!23083 m!32451))

(declare-fun m!32453 () Bool)

(assert (=> b!23083 m!32453))

(declare-fun m!32455 () Bool)

(assert (=> b!23083 m!32455))

(declare-fun m!32457 () Bool)

(assert (=> b!23083 m!32457))

(declare-fun m!32459 () Bool)

(assert (=> b!23083 m!32459))

(declare-fun m!32461 () Bool)

(assert (=> b!23081 m!32461))

(declare-fun m!32463 () Bool)

(assert (=> b!23076 m!32463))

(declare-fun m!32465 () Bool)

(assert (=> b!23076 m!32465))

(declare-fun m!32467 () Bool)

(assert (=> b!23076 m!32467))

(declare-fun m!32469 () Bool)

(assert (=> b!23076 m!32469))

(assert (=> b!23076 m!32465))

(declare-fun m!32471 () Bool)

(assert (=> b!23076 m!32471))

(declare-fun m!32473 () Bool)

(assert (=> b!23078 m!32473))

(declare-fun m!32475 () Bool)

(assert (=> b!23082 m!32475))

(declare-fun m!32477 () Bool)

(assert (=> b!23084 m!32477))

(declare-fun m!32479 () Bool)

(assert (=> b!23087 m!32479))

(declare-fun m!32481 () Bool)

(assert (=> b!23080 m!32481))

(declare-fun m!32483 () Bool)

(assert (=> b!23080 m!32483))

(declare-fun m!32485 () Bool)

(assert (=> b!23080 m!32485))

(push 1)

(assert (not start!5640))

(assert (not b!23076))

(assert (not b!23080))

(assert (not b!23082))

(assert (not b!23078))

(assert (not b!23081))

(assert (not b!23088))

(assert (not b!23085))

(assert (not b!23083))

(assert (not b!23084))

(assert (not b!23089))

(assert (not b!23086))

(assert (not b!23087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

