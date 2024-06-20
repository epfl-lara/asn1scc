; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!704 () Bool)

(assert start!704)

(declare-fun b!2119 () Bool)

(declare-fun res!3882 () Bool)

(declare-fun e!1499 () Bool)

(assert (=> b!2119 (=> (not res!3882) (not e!1499))))

(declare-datatypes ((array!201 0))(
  ( (array!202 (arr!466 (Array (_ BitVec 32) (_ BitVec 8))) (size!79 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!136 0))(
  ( (BitStream!137 (buf!388 array!201) (currentByte!1343 (_ BitVec 32)) (currentBit!1338 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!136)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2119 (= res!3882 (validate_offset_bits!1 ((_ sign_extend 32) (size!79 (buf!388 thiss!1486))) ((_ sign_extend 32) (currentByte!1343 thiss!1486)) ((_ sign_extend 32) (currentBit!1338 thiss!1486)) nBits!460))))

(declare-fun b!2120 () Bool)

(declare-fun e!1497 () Bool)

(assert (=> b!2120 (= e!1497 false)))

(declare-fun lt!1732 () Bool)

(declare-datatypes ((Unit!112 0))(
  ( (Unit!113) )
))
(declare-datatypes ((tuple2!142 0))(
  ( (tuple2!143 (_1!78 Unit!112) (_2!78 BitStream!136)) )
))
(declare-fun lt!1733 () tuple2!142)

(declare-fun isPrefixOf!0 (BitStream!136 BitStream!136) Bool)

(assert (=> b!2120 (= lt!1732 (isPrefixOf!0 thiss!1486 (_2!78 lt!1733)))))

(declare-fun b!2121 () Bool)

(assert (=> b!2121 (= e!1499 e!1497)))

(declare-fun res!3883 () Bool)

(assert (=> b!2121 (=> (not res!3883) (not e!1497))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2121 (= res!3883 (invariant!0 (currentBit!1338 (_2!78 lt!1733)) (currentByte!1343 (_2!78 lt!1733)) (size!79 (buf!388 (_2!78 lt!1733)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!201)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!136 array!201 (_ BitVec 64) (_ BitVec 64)) tuple2!142)

(assert (=> b!2121 (= lt!1733 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2122 () Bool)

(declare-fun res!3879 () Bool)

(assert (=> b!2122 (=> (not res!3879) (not e!1497))))

(assert (=> b!2122 (= res!3879 (= (size!79 (buf!388 thiss!1486)) (size!79 (buf!388 (_2!78 lt!1733)))))))

(declare-fun res!3880 () Bool)

(assert (=> start!704 (=> (not res!3880) (not e!1499))))

(assert (=> start!704 (= res!3880 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!79 srcBuffer!6))))))))

(assert (=> start!704 e!1499))

(assert (=> start!704 true))

(declare-fun array_inv!74 (array!201) Bool)

(assert (=> start!704 (array_inv!74 srcBuffer!6)))

(declare-fun e!1496 () Bool)

(declare-fun inv!12 (BitStream!136) Bool)

(assert (=> start!704 (and (inv!12 thiss!1486) e!1496)))

(declare-fun b!2123 () Bool)

(assert (=> b!2123 (= e!1496 (array_inv!74 (buf!388 thiss!1486)))))

(declare-fun b!2124 () Bool)

(declare-fun res!3881 () Bool)

(assert (=> b!2124 (=> (not res!3881) (not e!1497))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2124 (= res!3881 (= (bitIndex!0 (size!79 (buf!388 (_2!78 lt!1733))) (currentByte!1343 (_2!78 lt!1733)) (currentBit!1338 (_2!78 lt!1733))) (bvadd (bitIndex!0 (size!79 (buf!388 thiss!1486)) (currentByte!1343 thiss!1486) (currentBit!1338 thiss!1486)) nBits!460)))))

(assert (= (and start!704 res!3880) b!2119))

(assert (= (and b!2119 res!3882) b!2121))

(assert (= (and b!2121 res!3883) b!2122))

(assert (= (and b!2122 res!3879) b!2124))

(assert (= (and b!2124 res!3881) b!2120))

(assert (= start!704 b!2123))

(declare-fun m!1761 () Bool)

(assert (=> start!704 m!1761))

(declare-fun m!1763 () Bool)

(assert (=> start!704 m!1763))

(declare-fun m!1765 () Bool)

(assert (=> b!2121 m!1765))

(declare-fun m!1767 () Bool)

(assert (=> b!2121 m!1767))

(declare-fun m!1769 () Bool)

(assert (=> b!2119 m!1769))

(declare-fun m!1771 () Bool)

(assert (=> b!2124 m!1771))

(declare-fun m!1773 () Bool)

(assert (=> b!2124 m!1773))

(declare-fun m!1775 () Bool)

(assert (=> b!2123 m!1775))

(declare-fun m!1777 () Bool)

(assert (=> b!2120 m!1777))

(push 1)

(assert (not b!2119))

(assert (not b!2120))

(assert (not b!2124))

(assert (not b!2123))

(assert (not b!2121))

(assert (not start!704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

