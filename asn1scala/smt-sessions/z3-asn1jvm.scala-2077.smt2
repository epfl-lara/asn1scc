; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52624 () Bool)

(assert start!52624)

(declare-fun b!243232 () Bool)

(declare-fun e!168602 () Bool)

(declare-datatypes ((array!13336 0))(
  ( (array!13337 (arr!6833 (Array (_ BitVec 32) (_ BitVec 8))) (size!5846 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10614 0))(
  ( (BitStream!10615 (buf!6315 array!13336) (currentByte!11687 (_ BitVec 32)) (currentBit!11682 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10614)

(declare-fun array_inv!5587 (array!13336) Bool)

(assert (=> b!243232 (= e!168602 (array_inv!5587 (buf!6315 thiss!1005)))))

(declare-fun b!243233 () Bool)

(declare-fun e!168610 () Bool)

(declare-datatypes ((tuple2!20832 0))(
  ( (tuple2!20833 (_1!11338 BitStream!10614) (_2!11338 Bool)) )
))
(declare-fun lt!379099 () tuple2!20832)

(declare-datatypes ((tuple2!20834 0))(
  ( (tuple2!20835 (_1!11339 BitStream!10614) (_2!11339 BitStream!10614)) )
))
(declare-fun lt!379092 () tuple2!20834)

(assert (=> b!243233 (= e!168610 (not (or (not (_2!11338 lt!379099)) (not (= (_1!11338 lt!379099) (_2!11339 lt!379092))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10614 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20832)

(assert (=> b!243233 (= lt!379099 (checkBitsLoopPure!0 (_1!11339 lt!379092) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17781 0))(
  ( (Unit!17782) )
))
(declare-datatypes ((tuple2!20836 0))(
  ( (tuple2!20837 (_1!11340 Unit!17781) (_2!11340 BitStream!10614)) )
))
(declare-fun lt!379093 () tuple2!20836)

(declare-fun lt!379086 () tuple2!20836)

(declare-fun lt!379091 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243233 (validate_offset_bits!1 ((_ sign_extend 32) (size!5846 (buf!6315 (_2!11340 lt!379093)))) ((_ sign_extend 32) (currentByte!11687 (_2!11340 lt!379086))) ((_ sign_extend 32) (currentBit!11682 (_2!11340 lt!379086))) lt!379091)))

(declare-fun lt!379085 () Unit!17781)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10614 array!13336 (_ BitVec 64)) Unit!17781)

(assert (=> b!243233 (= lt!379085 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11340 lt!379086) (buf!6315 (_2!11340 lt!379093)) lt!379091))))

(declare-fun reader!0 (BitStream!10614 BitStream!10614) tuple2!20834)

(assert (=> b!243233 (= lt!379092 (reader!0 (_2!11340 lt!379086) (_2!11340 lt!379093)))))

(declare-fun b!243234 () Bool)

(declare-fun res!203192 () Bool)

(declare-fun e!168604 () Bool)

(assert (=> b!243234 (=> (not res!203192) (not e!168604))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243234 (= res!203192 (invariant!0 (currentBit!11682 thiss!1005) (currentByte!11687 thiss!1005) (size!5846 (buf!6315 (_2!11340 lt!379086)))))))

(declare-fun b!243235 () Bool)

(assert (=> b!243235 (= e!168604 (invariant!0 (currentBit!11682 thiss!1005) (currentByte!11687 thiss!1005) (size!5846 (buf!6315 (_2!11340 lt!379093)))))))

(declare-fun res!203198 () Bool)

(declare-fun e!168609 () Bool)

(assert (=> start!52624 (=> (not res!203198) (not e!168609))))

(assert (=> start!52624 (= res!203198 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52624 e!168609))

(assert (=> start!52624 true))

(declare-fun inv!12 (BitStream!10614) Bool)

(assert (=> start!52624 (and (inv!12 thiss!1005) e!168602)))

(declare-fun b!243236 () Bool)

(assert (=> b!243236 (= e!168609 (not true))))

(declare-fun lt!379098 () tuple2!20834)

(declare-fun readBitPure!0 (BitStream!10614) tuple2!20832)

(assert (=> b!243236 (= (_2!11338 (readBitPure!0 (_1!11339 lt!379098))) bit!26)))

(declare-fun lt!379095 () tuple2!20834)

(assert (=> b!243236 (= lt!379095 (reader!0 (_2!11340 lt!379086) (_2!11340 lt!379093)))))

(assert (=> b!243236 (= lt!379098 (reader!0 thiss!1005 (_2!11340 lt!379093)))))

(declare-fun e!168611 () Bool)

(assert (=> b!243236 e!168611))

(declare-fun res!203196 () Bool)

(assert (=> b!243236 (=> (not res!203196) (not e!168611))))

(declare-fun lt!379087 () tuple2!20832)

(declare-fun lt!379090 () tuple2!20832)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243236 (= res!203196 (= (bitIndex!0 (size!5846 (buf!6315 (_1!11338 lt!379087))) (currentByte!11687 (_1!11338 lt!379087)) (currentBit!11682 (_1!11338 lt!379087))) (bitIndex!0 (size!5846 (buf!6315 (_1!11338 lt!379090))) (currentByte!11687 (_1!11338 lt!379090)) (currentBit!11682 (_1!11338 lt!379090)))))))

(declare-fun lt!379096 () Unit!17781)

(declare-fun lt!379100 () BitStream!10614)

(declare-fun readBitPrefixLemma!0 (BitStream!10614 BitStream!10614) Unit!17781)

(assert (=> b!243236 (= lt!379096 (readBitPrefixLemma!0 lt!379100 (_2!11340 lt!379093)))))

(assert (=> b!243236 (= lt!379090 (readBitPure!0 (BitStream!10615 (buf!6315 (_2!11340 lt!379093)) (currentByte!11687 thiss!1005) (currentBit!11682 thiss!1005))))))

(assert (=> b!243236 (= lt!379087 (readBitPure!0 lt!379100))))

(assert (=> b!243236 (= lt!379100 (BitStream!10615 (buf!6315 (_2!11340 lt!379086)) (currentByte!11687 thiss!1005) (currentBit!11682 thiss!1005)))))

(assert (=> b!243236 e!168604))

(declare-fun res!203199 () Bool)

(assert (=> b!243236 (=> (not res!203199) (not e!168604))))

(declare-fun isPrefixOf!0 (BitStream!10614 BitStream!10614) Bool)

(assert (=> b!243236 (= res!203199 (isPrefixOf!0 thiss!1005 (_2!11340 lt!379093)))))

(declare-fun lt!379088 () Unit!17781)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10614 BitStream!10614 BitStream!10614) Unit!17781)

(assert (=> b!243236 (= lt!379088 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11340 lt!379086) (_2!11340 lt!379093)))))

(declare-fun e!168603 () Bool)

(assert (=> b!243236 e!168603))

(declare-fun res!203195 () Bool)

(assert (=> b!243236 (=> (not res!203195) (not e!168603))))

(assert (=> b!243236 (= res!203195 (= (size!5846 (buf!6315 (_2!11340 lt!379086))) (size!5846 (buf!6315 (_2!11340 lt!379093)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10614 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20836)

(assert (=> b!243236 (= lt!379093 (appendNBitsLoop!0 (_2!11340 lt!379086) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243236 (validate_offset_bits!1 ((_ sign_extend 32) (size!5846 (buf!6315 (_2!11340 lt!379086)))) ((_ sign_extend 32) (currentByte!11687 (_2!11340 lt!379086))) ((_ sign_extend 32) (currentBit!11682 (_2!11340 lt!379086))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379101 () Unit!17781)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10614 BitStream!10614 (_ BitVec 64) (_ BitVec 64)) Unit!17781)

(assert (=> b!243236 (= lt!379101 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11340 lt!379086) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168608 () Bool)

(assert (=> b!243236 e!168608))

(declare-fun res!203194 () Bool)

(assert (=> b!243236 (=> (not res!203194) (not e!168608))))

(assert (=> b!243236 (= res!203194 (= (size!5846 (buf!6315 thiss!1005)) (size!5846 (buf!6315 (_2!11340 lt!379086)))))))

(declare-fun appendBit!0 (BitStream!10614 Bool) tuple2!20836)

(assert (=> b!243236 (= lt!379086 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243237 () Bool)

(assert (=> b!243237 (= e!168603 e!168610)))

(declare-fun res!203191 () Bool)

(assert (=> b!243237 (=> (not res!203191) (not e!168610))))

(assert (=> b!243237 (= res!203191 (= (bitIndex!0 (size!5846 (buf!6315 (_2!11340 lt!379093))) (currentByte!11687 (_2!11340 lt!379093)) (currentBit!11682 (_2!11340 lt!379093))) (bvadd (bitIndex!0 (size!5846 (buf!6315 (_2!11340 lt!379086))) (currentByte!11687 (_2!11340 lt!379086)) (currentBit!11682 (_2!11340 lt!379086))) lt!379091)))))

(assert (=> b!243237 (= lt!379091 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243238 () Bool)

(declare-fun e!168606 () Bool)

(declare-fun lt!379097 () tuple2!20832)

(declare-fun lt!379089 () (_ BitVec 64))

(assert (=> b!243238 (= e!168606 (= (bitIndex!0 (size!5846 (buf!6315 (_1!11338 lt!379097))) (currentByte!11687 (_1!11338 lt!379097)) (currentBit!11682 (_1!11338 lt!379097))) lt!379089))))

(declare-fun b!243239 () Bool)

(declare-fun res!203193 () Bool)

(assert (=> b!243239 (=> (not res!203193) (not e!168609))))

(assert (=> b!243239 (= res!203193 (validate_offset_bits!1 ((_ sign_extend 32) (size!5846 (buf!6315 thiss!1005))) ((_ sign_extend 32) (currentByte!11687 thiss!1005)) ((_ sign_extend 32) (currentBit!11682 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243240 () Bool)

(declare-fun res!203201 () Bool)

(declare-fun e!168605 () Bool)

(assert (=> b!243240 (=> (not res!203201) (not e!168605))))

(assert (=> b!243240 (= res!203201 (isPrefixOf!0 thiss!1005 (_2!11340 lt!379086)))))

(declare-fun b!243241 () Bool)

(declare-fun res!203202 () Bool)

(assert (=> b!243241 (=> (not res!203202) (not e!168609))))

(assert (=> b!243241 (= res!203202 (bvslt from!289 nBits!297))))

(declare-fun b!243242 () Bool)

(assert (=> b!243242 (= e!168611 (= (_2!11338 lt!379087) (_2!11338 lt!379090)))))

(declare-fun b!243243 () Bool)

(assert (=> b!243243 (= e!168605 e!168606)))

(declare-fun res!203197 () Bool)

(assert (=> b!243243 (=> (not res!203197) (not e!168606))))

(assert (=> b!243243 (= res!203197 (and (= (_2!11338 lt!379097) bit!26) (= (_1!11338 lt!379097) (_2!11340 lt!379086))))))

(declare-fun readerFrom!0 (BitStream!10614 (_ BitVec 32) (_ BitVec 32)) BitStream!10614)

(assert (=> b!243243 (= lt!379097 (readBitPure!0 (readerFrom!0 (_2!11340 lt!379086) (currentBit!11682 thiss!1005) (currentByte!11687 thiss!1005))))))

(declare-fun b!243244 () Bool)

(assert (=> b!243244 (= e!168608 e!168605)))

(declare-fun res!203190 () Bool)

(assert (=> b!243244 (=> (not res!203190) (not e!168605))))

(declare-fun lt!379094 () (_ BitVec 64))

(assert (=> b!243244 (= res!203190 (= lt!379089 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379094)))))

(assert (=> b!243244 (= lt!379089 (bitIndex!0 (size!5846 (buf!6315 (_2!11340 lt!379086))) (currentByte!11687 (_2!11340 lt!379086)) (currentBit!11682 (_2!11340 lt!379086))))))

(assert (=> b!243244 (= lt!379094 (bitIndex!0 (size!5846 (buf!6315 thiss!1005)) (currentByte!11687 thiss!1005) (currentBit!11682 thiss!1005)))))

(declare-fun b!243245 () Bool)

(declare-fun res!203200 () Bool)

(assert (=> b!243245 (=> (not res!203200) (not e!168610))))

(assert (=> b!243245 (= res!203200 (isPrefixOf!0 (_2!11340 lt!379086) (_2!11340 lt!379093)))))

(assert (= (and start!52624 res!203198) b!243239))

(assert (= (and b!243239 res!203193) b!243241))

(assert (= (and b!243241 res!203202) b!243236))

(assert (= (and b!243236 res!203194) b!243244))

(assert (= (and b!243244 res!203190) b!243240))

(assert (= (and b!243240 res!203201) b!243243))

(assert (= (and b!243243 res!203197) b!243238))

(assert (= (and b!243236 res!203195) b!243237))

(assert (= (and b!243237 res!203191) b!243245))

(assert (= (and b!243245 res!203200) b!243233))

(assert (= (and b!243236 res!203199) b!243234))

(assert (= (and b!243234 res!203192) b!243235))

(assert (= (and b!243236 res!203196) b!243242))

(assert (= start!52624 b!243232))

(declare-fun m!366473 () Bool)

(assert (=> b!243239 m!366473))

(declare-fun m!366475 () Bool)

(assert (=> b!243238 m!366475))

(declare-fun m!366477 () Bool)

(assert (=> b!243233 m!366477))

(declare-fun m!366479 () Bool)

(assert (=> b!243233 m!366479))

(declare-fun m!366481 () Bool)

(assert (=> b!243233 m!366481))

(declare-fun m!366483 () Bool)

(assert (=> b!243233 m!366483))

(declare-fun m!366485 () Bool)

(assert (=> b!243243 m!366485))

(assert (=> b!243243 m!366485))

(declare-fun m!366487 () Bool)

(assert (=> b!243243 m!366487))

(declare-fun m!366489 () Bool)

(assert (=> b!243244 m!366489))

(declare-fun m!366491 () Bool)

(assert (=> b!243244 m!366491))

(declare-fun m!366493 () Bool)

(assert (=> b!243234 m!366493))

(declare-fun m!366495 () Bool)

(assert (=> start!52624 m!366495))

(declare-fun m!366497 () Bool)

(assert (=> b!243240 m!366497))

(declare-fun m!366499 () Bool)

(assert (=> b!243245 m!366499))

(declare-fun m!366501 () Bool)

(assert (=> b!243236 m!366501))

(declare-fun m!366503 () Bool)

(assert (=> b!243236 m!366503))

(declare-fun m!366505 () Bool)

(assert (=> b!243236 m!366505))

(declare-fun m!366507 () Bool)

(assert (=> b!243236 m!366507))

(declare-fun m!366509 () Bool)

(assert (=> b!243236 m!366509))

(declare-fun m!366511 () Bool)

(assert (=> b!243236 m!366511))

(assert (=> b!243236 m!366483))

(declare-fun m!366513 () Bool)

(assert (=> b!243236 m!366513))

(declare-fun m!366515 () Bool)

(assert (=> b!243236 m!366515))

(declare-fun m!366517 () Bool)

(assert (=> b!243236 m!366517))

(declare-fun m!366519 () Bool)

(assert (=> b!243236 m!366519))

(declare-fun m!366521 () Bool)

(assert (=> b!243236 m!366521))

(declare-fun m!366523 () Bool)

(assert (=> b!243236 m!366523))

(declare-fun m!366525 () Bool)

(assert (=> b!243236 m!366525))

(declare-fun m!366527 () Bool)

(assert (=> b!243235 m!366527))

(declare-fun m!366529 () Bool)

(assert (=> b!243237 m!366529))

(assert (=> b!243237 m!366489))

(declare-fun m!366531 () Bool)

(assert (=> b!243232 m!366531))

(check-sat (not b!243237) (not b!243236) (not b!243232) (not b!243240) (not b!243234) (not b!243235) (not b!243239) (not b!243243) (not b!243238) (not b!243233) (not b!243244) (not b!243245) (not start!52624))
