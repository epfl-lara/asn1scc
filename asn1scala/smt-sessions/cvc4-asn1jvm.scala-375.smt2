; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8946 () Bool)

(assert start!8946)

(declare-fun b!44329 () Bool)

(declare-fun e!29540 () Bool)

(declare-fun e!29538 () Bool)

(assert (=> b!44329 (= e!29540 e!29538)))

(declare-fun res!37544 () Bool)

(assert (=> b!44329 (=> res!37544 e!29538)))

(declare-datatypes ((array!2237 0))(
  ( (array!2238 (arr!1519 (Array (_ BitVec 32) (_ BitVec 8))) (size!1008 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1760 0))(
  ( (BitStream!1761 (buf!1351 array!2237) (currentByte!2832 (_ BitVec 32)) (currentBit!2827 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3158 0))(
  ( (Unit!3159) )
))
(declare-datatypes ((tuple2!4342 0))(
  ( (tuple2!4343 (_1!2264 Unit!3158) (_2!2264 BitStream!1760)) )
))
(declare-fun lt!67712 () tuple2!4342)

(declare-fun lt!67709 () tuple2!4342)

(declare-fun isPrefixOf!0 (BitStream!1760 BitStream!1760) Bool)

(assert (=> b!44329 (= res!37544 (not (isPrefixOf!0 (_2!2264 lt!67712) (_2!2264 lt!67709))))))

(declare-fun thiss!1379 () BitStream!1760)

(assert (=> b!44329 (isPrefixOf!0 thiss!1379 (_2!2264 lt!67709))))

(declare-fun lt!67716 () Unit!3158)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1760 BitStream!1760 BitStream!1760) Unit!3158)

(assert (=> b!44329 (= lt!67716 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2264 lt!67712) (_2!2264 lt!67709)))))

(declare-fun srcBuffer!2 () array!2237)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1760 array!2237 (_ BitVec 64) (_ BitVec 64)) tuple2!4342)

(assert (=> b!44329 (= lt!67709 (appendBitsMSBFirstLoop!0 (_2!2264 lt!67712) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29537 () Bool)

(assert (=> b!44329 e!29537))

(declare-fun res!37543 () Bool)

(assert (=> b!44329 (=> (not res!37543) (not e!29537))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44329 (= res!37543 (validate_offset_bits!1 ((_ sign_extend 32) (size!1008 (buf!1351 (_2!2264 lt!67712)))) ((_ sign_extend 32) (currentByte!2832 thiss!1379)) ((_ sign_extend 32) (currentBit!2827 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67710 () Unit!3158)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1760 array!2237 (_ BitVec 64)) Unit!3158)

(assert (=> b!44329 (= lt!67710 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1351 (_2!2264 lt!67712)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4344 0))(
  ( (tuple2!4345 (_1!2265 BitStream!1760) (_2!2265 BitStream!1760)) )
))
(declare-fun lt!67713 () tuple2!4344)

(declare-fun reader!0 (BitStream!1760 BitStream!1760) tuple2!4344)

(assert (=> b!44329 (= lt!67713 (reader!0 thiss!1379 (_2!2264 lt!67712)))))

(declare-fun b!44330 () Bool)

(declare-datatypes ((List!521 0))(
  ( (Nil!518) (Cons!517 (h!636 Bool) (t!1271 List!521)) )
))
(declare-fun head!340 (List!521) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1760 array!2237 (_ BitVec 64) (_ BitVec 64)) List!521)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1760 BitStream!1760 (_ BitVec 64)) List!521)

(assert (=> b!44330 (= e!29537 (= (head!340 (byteArrayBitContentToList!0 (_2!2264 lt!67712) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!340 (bitStreamReadBitsIntoList!0 (_2!2264 lt!67712) (_1!2265 lt!67713) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44332 () Bool)

(declare-fun res!37542 () Bool)

(declare-fun e!29541 () Bool)

(assert (=> b!44332 (=> (not res!37542) (not e!29541))))

(assert (=> b!44332 (= res!37542 (validate_offset_bits!1 ((_ sign_extend 32) (size!1008 (buf!1351 thiss!1379))) ((_ sign_extend 32) (currentByte!2832 thiss!1379)) ((_ sign_extend 32) (currentBit!2827 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44333 () Bool)

(declare-fun e!29539 () Bool)

(declare-fun array_inv!933 (array!2237) Bool)

(assert (=> b!44333 (= e!29539 (array_inv!933 (buf!1351 thiss!1379)))))

(declare-fun b!44334 () Bool)

(assert (=> b!44334 (= e!29538 true)))

(declare-fun lt!67717 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44334 (= lt!67717 (bitIndex!0 (size!1008 (buf!1351 (_2!2264 lt!67709))) (currentByte!2832 (_2!2264 lt!67709)) (currentBit!2827 (_2!2264 lt!67709))))))

(declare-fun b!44335 () Bool)

(declare-fun e!29543 () Bool)

(assert (=> b!44335 (= e!29543 e!29540)))

(declare-fun res!37545 () Bool)

(assert (=> b!44335 (=> res!37545 e!29540)))

(assert (=> b!44335 (= res!37545 (not (isPrefixOf!0 thiss!1379 (_2!2264 lt!67712))))))

(assert (=> b!44335 (validate_offset_bits!1 ((_ sign_extend 32) (size!1008 (buf!1351 (_2!2264 lt!67712)))) ((_ sign_extend 32) (currentByte!2832 (_2!2264 lt!67712))) ((_ sign_extend 32) (currentBit!2827 (_2!2264 lt!67712))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67715 () Unit!3158)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1760 BitStream!1760 (_ BitVec 64) (_ BitVec 64)) Unit!3158)

(assert (=> b!44335 (= lt!67715 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2264 lt!67712) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1760 (_ BitVec 8) (_ BitVec 32)) tuple2!4342)

(assert (=> b!44335 (= lt!67712 (appendBitFromByte!0 thiss!1379 (select (arr!1519 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44331 () Bool)

(assert (=> b!44331 (= e!29541 (not e!29543))))

(declare-fun res!37541 () Bool)

(assert (=> b!44331 (=> res!37541 e!29543)))

(assert (=> b!44331 (= res!37541 (bvsge i!635 to!314))))

(assert (=> b!44331 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67711 () Unit!3158)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1760) Unit!3158)

(assert (=> b!44331 (= lt!67711 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!67714 () (_ BitVec 64))

(assert (=> b!44331 (= lt!67714 (bitIndex!0 (size!1008 (buf!1351 thiss!1379)) (currentByte!2832 thiss!1379) (currentBit!2827 thiss!1379)))))

(declare-fun res!37540 () Bool)

(assert (=> start!8946 (=> (not res!37540) (not e!29541))))

(assert (=> start!8946 (= res!37540 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1008 srcBuffer!2))))))))

(assert (=> start!8946 e!29541))

(assert (=> start!8946 true))

(assert (=> start!8946 (array_inv!933 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1760) Bool)

(assert (=> start!8946 (and (inv!12 thiss!1379) e!29539)))

(assert (= (and start!8946 res!37540) b!44332))

(assert (= (and b!44332 res!37542) b!44331))

(assert (= (and b!44331 (not res!37541)) b!44335))

(assert (= (and b!44335 (not res!37545)) b!44329))

(assert (= (and b!44329 res!37543) b!44330))

(assert (= (and b!44329 (not res!37544)) b!44334))

(assert (= start!8946 b!44333))

(declare-fun m!67603 () Bool)

(assert (=> b!44333 m!67603))

(declare-fun m!67605 () Bool)

(assert (=> b!44329 m!67605))

(declare-fun m!67607 () Bool)

(assert (=> b!44329 m!67607))

(declare-fun m!67609 () Bool)

(assert (=> b!44329 m!67609))

(declare-fun m!67611 () Bool)

(assert (=> b!44329 m!67611))

(declare-fun m!67613 () Bool)

(assert (=> b!44329 m!67613))

(declare-fun m!67615 () Bool)

(assert (=> b!44329 m!67615))

(declare-fun m!67617 () Bool)

(assert (=> b!44329 m!67617))

(declare-fun m!67619 () Bool)

(assert (=> b!44332 m!67619))

(declare-fun m!67621 () Bool)

(assert (=> b!44334 m!67621))

(declare-fun m!67623 () Bool)

(assert (=> b!44330 m!67623))

(assert (=> b!44330 m!67623))

(declare-fun m!67625 () Bool)

(assert (=> b!44330 m!67625))

(declare-fun m!67627 () Bool)

(assert (=> b!44330 m!67627))

(assert (=> b!44330 m!67627))

(declare-fun m!67629 () Bool)

(assert (=> b!44330 m!67629))

(declare-fun m!67631 () Bool)

(assert (=> b!44331 m!67631))

(declare-fun m!67633 () Bool)

(assert (=> b!44331 m!67633))

(declare-fun m!67635 () Bool)

(assert (=> b!44331 m!67635))

(declare-fun m!67637 () Bool)

(assert (=> b!44335 m!67637))

(declare-fun m!67639 () Bool)

(assert (=> b!44335 m!67639))

(declare-fun m!67641 () Bool)

(assert (=> b!44335 m!67641))

(declare-fun m!67643 () Bool)

(assert (=> b!44335 m!67643))

(assert (=> b!44335 m!67637))

(declare-fun m!67645 () Bool)

(assert (=> b!44335 m!67645))

(declare-fun m!67647 () Bool)

(assert (=> start!8946 m!67647))

(declare-fun m!67649 () Bool)

(assert (=> start!8946 m!67649))

(push 1)

