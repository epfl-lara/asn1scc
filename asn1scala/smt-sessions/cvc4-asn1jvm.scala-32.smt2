; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!708 () Bool)

(assert start!708)

(declare-fun b!2155 () Bool)

(declare-fun res!3909 () Bool)

(declare-fun e!1528 () Bool)

(assert (=> b!2155 (=> (not res!3909) (not e!1528))))

(declare-datatypes ((array!205 0))(
  ( (array!206 (arr!468 (Array (_ BitVec 32) (_ BitVec 8))) (size!81 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!140 0))(
  ( (BitStream!141 (buf!390 array!205) (currentByte!1345 (_ BitVec 32)) (currentBit!1340 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!140)

(declare-datatypes ((Unit!116 0))(
  ( (Unit!117) )
))
(declare-datatypes ((tuple2!146 0))(
  ( (tuple2!147 (_1!80 Unit!116) (_2!80 BitStream!140)) )
))
(declare-fun lt!1745 () tuple2!146)

(assert (=> b!2155 (= res!3909 (= (size!81 (buf!390 thiss!1486)) (size!81 (buf!390 (_2!80 lt!1745)))))))

(declare-fun b!2156 () Bool)

(declare-fun e!1525 () Bool)

(assert (=> b!2156 (= e!1525 e!1528)))

(declare-fun res!3911 () Bool)

(assert (=> b!2156 (=> (not res!3911) (not e!1528))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2156 (= res!3911 (invariant!0 (currentBit!1340 (_2!80 lt!1745)) (currentByte!1345 (_2!80 lt!1745)) (size!81 (buf!390 (_2!80 lt!1745)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!205)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!140 array!205 (_ BitVec 64) (_ BitVec 64)) tuple2!146)

(assert (=> b!2156 (= lt!1745 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2157 () Bool)

(assert (=> b!2157 (= e!1528 false)))

(declare-fun lt!1744 () Bool)

(declare-fun isPrefixOf!0 (BitStream!140 BitStream!140) Bool)

(assert (=> b!2157 (= lt!1744 (isPrefixOf!0 thiss!1486 (_2!80 lt!1745)))))

(declare-fun b!2158 () Bool)

(declare-fun res!3912 () Bool)

(assert (=> b!2158 (=> (not res!3912) (not e!1528))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2158 (= res!3912 (= (bitIndex!0 (size!81 (buf!390 (_2!80 lt!1745))) (currentByte!1345 (_2!80 lt!1745)) (currentBit!1340 (_2!80 lt!1745))) (bvadd (bitIndex!0 (size!81 (buf!390 thiss!1486)) (currentByte!1345 thiss!1486) (currentBit!1340 thiss!1486)) nBits!460)))))

(declare-fun res!3913 () Bool)

(assert (=> start!708 (=> (not res!3913) (not e!1525))))

(assert (=> start!708 (= res!3913 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!81 srcBuffer!6))))))))

(assert (=> start!708 e!1525))

(assert (=> start!708 true))

(declare-fun array_inv!76 (array!205) Bool)

(assert (=> start!708 (array_inv!76 srcBuffer!6)))

(declare-fun e!1529 () Bool)

(declare-fun inv!12 (BitStream!140) Bool)

(assert (=> start!708 (and (inv!12 thiss!1486) e!1529)))

(declare-fun b!2159 () Bool)

(declare-fun res!3910 () Bool)

(assert (=> b!2159 (=> (not res!3910) (not e!1525))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2159 (= res!3910 (validate_offset_bits!1 ((_ sign_extend 32) (size!81 (buf!390 thiss!1486))) ((_ sign_extend 32) (currentByte!1345 thiss!1486)) ((_ sign_extend 32) (currentBit!1340 thiss!1486)) nBits!460))))

(declare-fun b!2160 () Bool)

(assert (=> b!2160 (= e!1529 (array_inv!76 (buf!390 thiss!1486)))))

(assert (= (and start!708 res!3913) b!2159))

(assert (= (and b!2159 res!3910) b!2156))

(assert (= (and b!2156 res!3911) b!2155))

(assert (= (and b!2155 res!3909) b!2158))

(assert (= (and b!2158 res!3912) b!2157))

(assert (= start!708 b!2160))

(declare-fun m!1797 () Bool)

(assert (=> b!2156 m!1797))

(declare-fun m!1799 () Bool)

(assert (=> b!2156 m!1799))

(declare-fun m!1801 () Bool)

(assert (=> b!2157 m!1801))

(declare-fun m!1803 () Bool)

(assert (=> b!2158 m!1803))

(declare-fun m!1805 () Bool)

(assert (=> b!2158 m!1805))

(declare-fun m!1807 () Bool)

(assert (=> start!708 m!1807))

(declare-fun m!1809 () Bool)

(assert (=> start!708 m!1809))

(declare-fun m!1811 () Bool)

(assert (=> b!2160 m!1811))

(declare-fun m!1813 () Bool)

(assert (=> b!2159 m!1813))

(push 1)

(assert (not b!2156))

(assert (not start!708))

(assert (not b!2157))

(assert (not b!2159))

(assert (not b!2158))

(assert (not b!2160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

