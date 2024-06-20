; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!706 () Bool)

(assert start!706)

(declare-fun res!3894 () Bool)

(declare-fun e!1511 () Bool)

(assert (=> start!706 (=> (not res!3894) (not e!1511))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!203 0))(
  ( (array!204 (arr!467 (Array (_ BitVec 32) (_ BitVec 8))) (size!80 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!203)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!706 (= res!3894 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!80 srcBuffer!6))))))))

(assert (=> start!706 e!1511))

(assert (=> start!706 true))

(declare-fun array_inv!75 (array!203) Bool)

(assert (=> start!706 (array_inv!75 srcBuffer!6)))

(declare-datatypes ((BitStream!138 0))(
  ( (BitStream!139 (buf!389 array!203) (currentByte!1344 (_ BitVec 32)) (currentBit!1339 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!138)

(declare-fun e!1513 () Bool)

(declare-fun inv!12 (BitStream!138) Bool)

(assert (=> start!706 (and (inv!12 thiss!1486) e!1513)))

(declare-fun b!2137 () Bool)

(declare-fun res!3897 () Bool)

(declare-fun e!1512 () Bool)

(assert (=> b!2137 (=> (not res!3897) (not e!1512))))

(declare-datatypes ((Unit!114 0))(
  ( (Unit!115) )
))
(declare-datatypes ((tuple2!144 0))(
  ( (tuple2!145 (_1!79 Unit!114) (_2!79 BitStream!138)) )
))
(declare-fun lt!1738 () tuple2!144)

(assert (=> b!2137 (= res!3897 (= (size!80 (buf!389 thiss!1486)) (size!80 (buf!389 (_2!79 lt!1738)))))))

(declare-fun b!2138 () Bool)

(assert (=> b!2138 (= e!1512 false)))

(declare-fun lt!1739 () Bool)

(declare-fun isPrefixOf!0 (BitStream!138 BitStream!138) Bool)

(assert (=> b!2138 (= lt!1739 (isPrefixOf!0 thiss!1486 (_2!79 lt!1738)))))

(declare-fun b!2139 () Bool)

(assert (=> b!2139 (= e!1513 (array_inv!75 (buf!389 thiss!1486)))))

(declare-fun b!2140 () Bool)

(declare-fun res!3896 () Bool)

(assert (=> b!2140 (=> (not res!3896) (not e!1512))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2140 (= res!3896 (= (bitIndex!0 (size!80 (buf!389 (_2!79 lt!1738))) (currentByte!1344 (_2!79 lt!1738)) (currentBit!1339 (_2!79 lt!1738))) (bvadd (bitIndex!0 (size!80 (buf!389 thiss!1486)) (currentByte!1344 thiss!1486) (currentBit!1339 thiss!1486)) nBits!460)))))

(declare-fun b!2141 () Bool)

(assert (=> b!2141 (= e!1511 e!1512)))

(declare-fun res!3898 () Bool)

(assert (=> b!2141 (=> (not res!3898) (not e!1512))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2141 (= res!3898 (invariant!0 (currentBit!1339 (_2!79 lt!1738)) (currentByte!1344 (_2!79 lt!1738)) (size!80 (buf!389 (_2!79 lt!1738)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!138 array!203 (_ BitVec 64) (_ BitVec 64)) tuple2!144)

(assert (=> b!2141 (= lt!1738 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2142 () Bool)

(declare-fun res!3895 () Bool)

(assert (=> b!2142 (=> (not res!3895) (not e!1511))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2142 (= res!3895 (validate_offset_bits!1 ((_ sign_extend 32) (size!80 (buf!389 thiss!1486))) ((_ sign_extend 32) (currentByte!1344 thiss!1486)) ((_ sign_extend 32) (currentBit!1339 thiss!1486)) nBits!460))))

(assert (= (and start!706 res!3894) b!2142))

(assert (= (and b!2142 res!3895) b!2141))

(assert (= (and b!2141 res!3898) b!2137))

(assert (= (and b!2137 res!3897) b!2140))

(assert (= (and b!2140 res!3896) b!2138))

(assert (= start!706 b!2139))

(declare-fun m!1779 () Bool)

(assert (=> b!2141 m!1779))

(declare-fun m!1781 () Bool)

(assert (=> b!2141 m!1781))

(declare-fun m!1783 () Bool)

(assert (=> b!2140 m!1783))

(declare-fun m!1785 () Bool)

(assert (=> b!2140 m!1785))

(declare-fun m!1787 () Bool)

(assert (=> b!2142 m!1787))

(declare-fun m!1789 () Bool)

(assert (=> start!706 m!1789))

(declare-fun m!1791 () Bool)

(assert (=> start!706 m!1791))

(declare-fun m!1793 () Bool)

(assert (=> b!2139 m!1793))

(declare-fun m!1795 () Bool)

(assert (=> b!2138 m!1795))

(check-sat (not b!2140) (not b!2142) (not b!2141) (not start!706) (not b!2139) (not b!2138))
