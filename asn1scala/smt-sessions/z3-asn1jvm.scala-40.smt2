; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!808 () Bool)

(assert start!808)

(declare-fun b!2814 () Bool)

(declare-fun e!1957 () Bool)

(assert (=> b!2814 (= e!1957 (not true))))

(declare-datatypes ((array!254 0))(
  ( (array!255 (arr!491 (Array (_ BitVec 32) (_ BitVec 8))) (size!104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!186 0))(
  ( (BitStream!187 (buf!416 array!254) (currentByte!1377 (_ BitVec 32)) (currentBit!1372 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!256 0))(
  ( (tuple2!257 (_1!135 array!254) (_2!135 BitStream!186)) )
))
(declare-fun lt!2605 () tuple2!256)

(declare-datatypes ((tuple2!258 0))(
  ( (tuple2!259 (_1!136 BitStream!186) (_2!136 BitStream!186)) )
))
(declare-fun lt!2604 () tuple2!258)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!186 (_ BitVec 64)) tuple2!256)

(assert (=> b!2814 (= lt!2605 (readBits!0 (_1!136 lt!2604) nBits!460))))

(declare-datatypes ((Unit!186 0))(
  ( (Unit!187) )
))
(declare-datatypes ((tuple2!260 0))(
  ( (tuple2!261 (_1!137 Unit!186) (_2!137 BitStream!186)) )
))
(declare-fun lt!2606 () tuple2!260)

(declare-fun thiss!1486 () BitStream!186)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2814 (validate_offset_bits!1 ((_ sign_extend 32) (size!104 (buf!416 (_2!137 lt!2606)))) ((_ sign_extend 32) (currentByte!1377 thiss!1486)) ((_ sign_extend 32) (currentBit!1372 thiss!1486)) nBits!460)))

(declare-fun lt!2603 () Unit!186)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!186 array!254 (_ BitVec 64)) Unit!186)

(assert (=> b!2814 (= lt!2603 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!416 (_2!137 lt!2606)) nBits!460))))

(declare-fun reader!0 (BitStream!186 BitStream!186) tuple2!258)

(assert (=> b!2814 (= lt!2604 (reader!0 thiss!1486 (_2!137 lt!2606)))))

(declare-fun b!2815 () Bool)

(declare-fun res!4467 () Bool)

(assert (=> b!2815 (=> (not res!4467) (not e!1957))))

(assert (=> b!2815 (= res!4467 (= (size!104 (buf!416 thiss!1486)) (size!104 (buf!416 (_2!137 lt!2606)))))))

(declare-fun b!2816 () Bool)

(declare-fun res!4466 () Bool)

(assert (=> b!2816 (=> (not res!4466) (not e!1957))))

(declare-fun isPrefixOf!0 (BitStream!186 BitStream!186) Bool)

(assert (=> b!2816 (= res!4466 (isPrefixOf!0 thiss!1486 (_2!137 lt!2606)))))

(declare-fun b!2817 () Bool)

(declare-fun res!4468 () Bool)

(assert (=> b!2817 (=> (not res!4468) (not e!1957))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2817 (= res!4468 (= (bitIndex!0 (size!104 (buf!416 (_2!137 lt!2606))) (currentByte!1377 (_2!137 lt!2606)) (currentBit!1372 (_2!137 lt!2606))) (bvadd (bitIndex!0 (size!104 (buf!416 thiss!1486)) (currentByte!1377 thiss!1486) (currentBit!1372 thiss!1486)) nBits!460)))))

(declare-fun b!2818 () Bool)

(declare-fun e!1958 () Bool)

(assert (=> b!2818 (= e!1958 e!1957)))

(declare-fun res!4463 () Bool)

(assert (=> b!2818 (=> (not res!4463) (not e!1957))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2818 (= res!4463 (invariant!0 (currentBit!1372 (_2!137 lt!2606)) (currentByte!1377 (_2!137 lt!2606)) (size!104 (buf!416 (_2!137 lt!2606)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!254)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!186 array!254 (_ BitVec 64) (_ BitVec 64)) tuple2!260)

(assert (=> b!2818 (= lt!2606 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!4464 () Bool)

(assert (=> start!808 (=> (not res!4464) (not e!1958))))

(assert (=> start!808 (= res!4464 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!104 srcBuffer!6))))))))

(assert (=> start!808 e!1958))

(assert (=> start!808 true))

(declare-fun array_inv!99 (array!254) Bool)

(assert (=> start!808 (array_inv!99 srcBuffer!6)))

(declare-fun e!1954 () Bool)

(declare-fun inv!12 (BitStream!186) Bool)

(assert (=> start!808 (and (inv!12 thiss!1486) e!1954)))

(declare-fun b!2819 () Bool)

(declare-fun res!4465 () Bool)

(assert (=> b!2819 (=> (not res!4465) (not e!1958))))

(assert (=> b!2819 (= res!4465 (validate_offset_bits!1 ((_ sign_extend 32) (size!104 (buf!416 thiss!1486))) ((_ sign_extend 32) (currentByte!1377 thiss!1486)) ((_ sign_extend 32) (currentBit!1372 thiss!1486)) nBits!460))))

(declare-fun b!2820 () Bool)

(assert (=> b!2820 (= e!1954 (array_inv!99 (buf!416 thiss!1486)))))

(assert (= (and start!808 res!4464) b!2819))

(assert (= (and b!2819 res!4465) b!2818))

(assert (= (and b!2818 res!4463) b!2815))

(assert (= (and b!2815 res!4467) b!2817))

(assert (= (and b!2817 res!4468) b!2816))

(assert (= (and b!2816 res!4466) b!2814))

(assert (= start!808 b!2820))

(declare-fun m!2717 () Bool)

(assert (=> b!2816 m!2717))

(declare-fun m!2719 () Bool)

(assert (=> b!2819 m!2719))

(declare-fun m!2721 () Bool)

(assert (=> start!808 m!2721))

(declare-fun m!2723 () Bool)

(assert (=> start!808 m!2723))

(declare-fun m!2725 () Bool)

(assert (=> b!2820 m!2725))

(declare-fun m!2727 () Bool)

(assert (=> b!2818 m!2727))

(declare-fun m!2729 () Bool)

(assert (=> b!2818 m!2729))

(declare-fun m!2731 () Bool)

(assert (=> b!2817 m!2731))

(declare-fun m!2733 () Bool)

(assert (=> b!2817 m!2733))

(declare-fun m!2735 () Bool)

(assert (=> b!2814 m!2735))

(declare-fun m!2737 () Bool)

(assert (=> b!2814 m!2737))

(declare-fun m!2739 () Bool)

(assert (=> b!2814 m!2739))

(declare-fun m!2741 () Bool)

(assert (=> b!2814 m!2741))

(check-sat (not b!2817) (not b!2816) (not b!2814) (not b!2819) (not start!808) (not b!2818) (not b!2820))
