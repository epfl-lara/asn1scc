; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4952 () Bool)

(assert start!4952)

(declare-fun b!19687 () Bool)

(declare-fun e!13134 () Bool)

(declare-fun e!13129 () Bool)

(assert (=> b!19687 (= e!13134 (not e!13129))))

(declare-fun res!17188 () Bool)

(assert (=> b!19687 (=> res!17188 e!13129)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19687 (= res!17188 (bvsge i!635 to!314))))

(declare-datatypes ((array!1419 0))(
  ( (array!1420 (arr!1044 (Array (_ BitVec 32) (_ BitVec 8))) (size!603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1040 0))(
  ( (BitStream!1041 (buf!906 array!1419) (currentByte!2189 (_ BitVec 32)) (currentBit!2184 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1040)

(declare-fun isPrefixOf!0 (BitStream!1040 BitStream!1040) Bool)

(assert (=> b!19687 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1753 0))(
  ( (Unit!1754) )
))
(declare-fun lt!28006 () Unit!1753)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1040) Unit!1753)

(assert (=> b!19687 (= lt!28006 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28011 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19687 (= lt!28011 (bitIndex!0 (size!603 (buf!906 thiss!1379)) (currentByte!2189 thiss!1379) (currentBit!2184 thiss!1379)))))

(declare-fun b!19688 () Bool)

(declare-fun e!13130 () Bool)

(declare-fun array_inv!573 (array!1419) Bool)

(assert (=> b!19688 (= e!13130 (array_inv!573 (buf!906 thiss!1379)))))

(declare-fun b!19689 () Bool)

(declare-fun e!13131 () Bool)

(assert (=> b!19689 (= e!13129 e!13131)))

(declare-fun res!17186 () Bool)

(assert (=> b!19689 (=> res!17186 e!13131)))

(declare-datatypes ((tuple2!2272 0))(
  ( (tuple2!2273 (_1!1221 Unit!1753) (_2!1221 BitStream!1040)) )
))
(declare-fun lt!28008 () tuple2!2272)

(assert (=> b!19689 (= res!17186 (not (isPrefixOf!0 thiss!1379 (_2!1221 lt!28008))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19689 (validate_offset_bits!1 ((_ sign_extend 32) (size!603 (buf!906 (_2!1221 lt!28008)))) ((_ sign_extend 32) (currentByte!2189 (_2!1221 lt!28008))) ((_ sign_extend 32) (currentBit!2184 (_2!1221 lt!28008))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28009 () Unit!1753)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1040 BitStream!1040 (_ BitVec 64) (_ BitVec 64)) Unit!1753)

(assert (=> b!19689 (= lt!28009 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1221 lt!28008) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1419)

(declare-fun appendBitFromByte!0 (BitStream!1040 (_ BitVec 8) (_ BitVec 32)) tuple2!2272)

(assert (=> b!19689 (= lt!28008 (appendBitFromByte!0 thiss!1379 (select (arr!1044 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19690 () Bool)

(declare-fun res!17189 () Bool)

(assert (=> b!19690 (=> (not res!17189) (not e!13134))))

(assert (=> b!19690 (= res!17189 (validate_offset_bits!1 ((_ sign_extend 32) (size!603 (buf!906 thiss!1379))) ((_ sign_extend 32) (currentByte!2189 thiss!1379)) ((_ sign_extend 32) (currentBit!2184 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17187 () Bool)

(assert (=> start!4952 (=> (not res!17187) (not e!13134))))

(assert (=> start!4952 (= res!17187 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!603 srcBuffer!2))))))))

(assert (=> start!4952 e!13134))

(assert (=> start!4952 true))

(assert (=> start!4952 (array_inv!573 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1040) Bool)

(assert (=> start!4952 (and (inv!12 thiss!1379) e!13130)))

(declare-fun b!19691 () Bool)

(assert (=> b!19691 (= e!13131 (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111110))))

(declare-datatypes ((List!221 0))(
  ( (Nil!218) (Cons!217 (h!336 Bool) (t!971 List!221)) )
))
(declare-fun lt!28010 () List!221)

(declare-datatypes ((tuple2!2274 0))(
  ( (tuple2!2275 (_1!1222 BitStream!1040) (_2!1222 BitStream!1040)) )
))
(declare-fun lt!28012 () tuple2!2274)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1040 BitStream!1040 (_ BitVec 64)) List!221)

(assert (=> b!19691 (= lt!28010 (bitStreamReadBitsIntoList!0 (_2!1221 lt!28008) (_1!1222 lt!28012) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19691 (validate_offset_bits!1 ((_ sign_extend 32) (size!603 (buf!906 (_2!1221 lt!28008)))) ((_ sign_extend 32) (currentByte!2189 thiss!1379)) ((_ sign_extend 32) (currentBit!2184 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28007 () Unit!1753)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1040 array!1419 (_ BitVec 64)) Unit!1753)

(assert (=> b!19691 (= lt!28007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!906 (_2!1221 lt!28008)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1040 BitStream!1040) tuple2!2274)

(assert (=> b!19691 (= lt!28012 (reader!0 thiss!1379 (_2!1221 lt!28008)))))

(assert (= (and start!4952 res!17187) b!19690))

(assert (= (and b!19690 res!17189) b!19687))

(assert (= (and b!19687 (not res!17188)) b!19689))

(assert (= (and b!19689 (not res!17186)) b!19691))

(assert (= start!4952 b!19688))

(declare-fun m!26611 () Bool)

(assert (=> b!19688 m!26611))

(declare-fun m!26613 () Bool)

(assert (=> b!19691 m!26613))

(declare-fun m!26615 () Bool)

(assert (=> b!19691 m!26615))

(declare-fun m!26617 () Bool)

(assert (=> b!19691 m!26617))

(declare-fun m!26619 () Bool)

(assert (=> b!19691 m!26619))

(declare-fun m!26621 () Bool)

(assert (=> b!19690 m!26621))

(declare-fun m!26623 () Bool)

(assert (=> b!19687 m!26623))

(declare-fun m!26625 () Bool)

(assert (=> b!19687 m!26625))

(declare-fun m!26627 () Bool)

(assert (=> b!19687 m!26627))

(declare-fun m!26629 () Bool)

(assert (=> b!19689 m!26629))

(declare-fun m!26631 () Bool)

(assert (=> b!19689 m!26631))

(declare-fun m!26633 () Bool)

(assert (=> b!19689 m!26633))

(declare-fun m!26635 () Bool)

(assert (=> b!19689 m!26635))

(assert (=> b!19689 m!26631))

(declare-fun m!26637 () Bool)

(assert (=> b!19689 m!26637))

(declare-fun m!26639 () Bool)

(assert (=> start!4952 m!26639))

(declare-fun m!26641 () Bool)

(assert (=> start!4952 m!26641))

(push 1)

(assert (not b!19687))

(assert (not b!19688))

(assert (not b!19690))

(assert (not b!19689))

(assert (not start!4952))

(assert (not b!19691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

