; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!798 () Bool)

(assert start!798)

(declare-fun b!2709 () Bool)

(declare-fun res!4376 () Bool)

(declare-fun e!1882 () Bool)

(assert (=> b!2709 (=> (not res!4376) (not e!1882))))

(declare-datatypes ((array!244 0))(
  ( (array!245 (arr!486 (Array (_ BitVec 32) (_ BitVec 8))) (size!99 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!176 0))(
  ( (BitStream!177 (buf!411 array!244) (currentByte!1372 (_ BitVec 32)) (currentBit!1367 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!176)

(declare-datatypes ((Unit!176 0))(
  ( (Unit!177) )
))
(declare-datatypes ((tuple2!226 0))(
  ( (tuple2!227 (_1!120 Unit!176) (_2!120 BitStream!176)) )
))
(declare-fun lt!2543 () tuple2!226)

(assert (=> b!2709 (= res!4376 (= (size!99 (buf!411 thiss!1486)) (size!99 (buf!411 (_2!120 lt!2543)))))))

(declare-fun b!2710 () Bool)

(assert (=> b!2710 (= e!1882 (not true))))

(declare-datatypes ((tuple2!228 0))(
  ( (tuple2!229 (_1!121 array!244) (_2!121 BitStream!176)) )
))
(declare-fun lt!2545 () tuple2!228)

(declare-datatypes ((tuple2!230 0))(
  ( (tuple2!231 (_1!122 BitStream!176) (_2!122 BitStream!176)) )
))
(declare-fun lt!2544 () tuple2!230)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!176 (_ BitVec 64)) tuple2!228)

(assert (=> b!2710 (= lt!2545 (readBits!0 (_1!122 lt!2544) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2710 (validate_offset_bits!1 ((_ sign_extend 32) (size!99 (buf!411 (_2!120 lt!2543)))) ((_ sign_extend 32) (currentByte!1372 thiss!1486)) ((_ sign_extend 32) (currentBit!1367 thiss!1486)) nBits!460)))

(declare-fun lt!2546 () Unit!176)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!176 array!244 (_ BitVec 64)) Unit!176)

(assert (=> b!2710 (= lt!2546 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!411 (_2!120 lt!2543)) nBits!460))))

(declare-fun reader!0 (BitStream!176 BitStream!176) tuple2!230)

(assert (=> b!2710 (= lt!2544 (reader!0 thiss!1486 (_2!120 lt!2543)))))

(declare-fun b!2711 () Bool)

(declare-fun res!4377 () Bool)

(declare-fun e!1883 () Bool)

(assert (=> b!2711 (=> (not res!4377) (not e!1883))))

(assert (=> b!2711 (= res!4377 (validate_offset_bits!1 ((_ sign_extend 32) (size!99 (buf!411 thiss!1486))) ((_ sign_extend 32) (currentByte!1372 thiss!1486)) ((_ sign_extend 32) (currentBit!1367 thiss!1486)) nBits!460))))

(declare-fun b!2712 () Bool)

(declare-fun res!4373 () Bool)

(assert (=> b!2712 (=> (not res!4373) (not e!1882))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2712 (= res!4373 (= (bitIndex!0 (size!99 (buf!411 (_2!120 lt!2543))) (currentByte!1372 (_2!120 lt!2543)) (currentBit!1367 (_2!120 lt!2543))) (bvadd (bitIndex!0 (size!99 (buf!411 thiss!1486)) (currentByte!1372 thiss!1486) (currentBit!1367 thiss!1486)) nBits!460)))))

(declare-fun b!2714 () Bool)

(declare-fun e!1881 () Bool)

(declare-fun array_inv!94 (array!244) Bool)

(assert (=> b!2714 (= e!1881 (array_inv!94 (buf!411 thiss!1486)))))

(declare-fun b!2715 () Bool)

(declare-fun res!4375 () Bool)

(assert (=> b!2715 (=> (not res!4375) (not e!1882))))

(declare-fun isPrefixOf!0 (BitStream!176 BitStream!176) Bool)

(assert (=> b!2715 (= res!4375 (isPrefixOf!0 thiss!1486 (_2!120 lt!2543)))))

(declare-fun b!2713 () Bool)

(assert (=> b!2713 (= e!1883 e!1882)))

(declare-fun res!4374 () Bool)

(assert (=> b!2713 (=> (not res!4374) (not e!1882))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2713 (= res!4374 (invariant!0 (currentBit!1367 (_2!120 lt!2543)) (currentByte!1372 (_2!120 lt!2543)) (size!99 (buf!411 (_2!120 lt!2543)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!244)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!176 array!244 (_ BitVec 64) (_ BitVec 64)) tuple2!226)

(assert (=> b!2713 (= lt!2543 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!4378 () Bool)

(assert (=> start!798 (=> (not res!4378) (not e!1883))))

(assert (=> start!798 (= res!4378 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!99 srcBuffer!6))))))))

(assert (=> start!798 e!1883))

(assert (=> start!798 true))

(assert (=> start!798 (array_inv!94 srcBuffer!6)))

(declare-fun inv!12 (BitStream!176) Bool)

(assert (=> start!798 (and (inv!12 thiss!1486) e!1881)))

(assert (= (and start!798 res!4378) b!2711))

(assert (= (and b!2711 res!4377) b!2713))

(assert (= (and b!2713 res!4374) b!2709))

(assert (= (and b!2709 res!4376) b!2712))

(assert (= (and b!2712 res!4373) b!2715))

(assert (= (and b!2715 res!4375) b!2710))

(assert (= start!798 b!2714))

(declare-fun m!2587 () Bool)

(assert (=> b!2711 m!2587))

(declare-fun m!2589 () Bool)

(assert (=> b!2714 m!2589))

(declare-fun m!2591 () Bool)

(assert (=> b!2712 m!2591))

(declare-fun m!2593 () Bool)

(assert (=> b!2712 m!2593))

(declare-fun m!2595 () Bool)

(assert (=> b!2710 m!2595))

(declare-fun m!2597 () Bool)

(assert (=> b!2710 m!2597))

(declare-fun m!2599 () Bool)

(assert (=> b!2710 m!2599))

(declare-fun m!2601 () Bool)

(assert (=> b!2710 m!2601))

(declare-fun m!2603 () Bool)

(assert (=> b!2715 m!2603))

(declare-fun m!2605 () Bool)

(assert (=> b!2713 m!2605))

(declare-fun m!2607 () Bool)

(assert (=> b!2713 m!2607))

(declare-fun m!2609 () Bool)

(assert (=> start!798 m!2609))

(declare-fun m!2611 () Bool)

(assert (=> start!798 m!2611))

(push 1)

