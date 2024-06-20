; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!714 () Bool)

(assert start!714)

(declare-fun b!2217 () Bool)

(declare-fun res!3967 () Bool)

(declare-fun e!1570 () Bool)

(assert (=> b!2217 (=> (not res!3967) (not e!1570))))

(declare-datatypes ((array!211 0))(
  ( (array!212 (arr!471 (Array (_ BitVec 32) (_ BitVec 8))) (size!84 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!146 0))(
  ( (BitStream!147 (buf!393 array!211) (currentByte!1348 (_ BitVec 32)) (currentBit!1343 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!146)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2217 (= res!3967 (validate_offset_bits!1 ((_ sign_extend 32) (size!84 (buf!393 thiss!1486))) ((_ sign_extend 32) (currentByte!1348 thiss!1486)) ((_ sign_extend 32) (currentBit!1343 thiss!1486)) nBits!460))))

(declare-fun b!2218 () Bool)

(declare-fun res!3965 () Bool)

(declare-fun e!1574 () Bool)

(assert (=> b!2218 (=> (not res!3965) (not e!1574))))

(declare-datatypes ((Unit!122 0))(
  ( (Unit!123) )
))
(declare-datatypes ((tuple2!156 0))(
  ( (tuple2!157 (_1!85 Unit!122) (_2!85 BitStream!146)) )
))
(declare-fun lt!1763 () tuple2!156)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2218 (= res!3965 (= (bitIndex!0 (size!84 (buf!393 (_2!85 lt!1763))) (currentByte!1348 (_2!85 lt!1763)) (currentBit!1343 (_2!85 lt!1763))) (bvadd (bitIndex!0 (size!84 (buf!393 thiss!1486)) (currentByte!1348 thiss!1486) (currentBit!1343 thiss!1486)) nBits!460)))))

(declare-fun res!3963 () Bool)

(assert (=> start!714 (=> (not res!3963) (not e!1570))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!211)

(assert (=> start!714 (= res!3963 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!84 srcBuffer!6))))))))

(assert (=> start!714 e!1570))

(assert (=> start!714 true))

(declare-fun array_inv!79 (array!211) Bool)

(assert (=> start!714 (array_inv!79 srcBuffer!6)))

(declare-fun e!1571 () Bool)

(declare-fun inv!12 (BitStream!146) Bool)

(assert (=> start!714 (and (inv!12 thiss!1486) e!1571)))

(declare-fun b!2219 () Bool)

(declare-fun res!3962 () Bool)

(assert (=> b!2219 (=> (not res!3962) (not e!1574))))

(declare-fun isPrefixOf!0 (BitStream!146 BitStream!146) Bool)

(assert (=> b!2219 (= res!3962 (isPrefixOf!0 thiss!1486 (_2!85 lt!1763)))))

(declare-fun b!2220 () Bool)

(assert (=> b!2220 (= e!1574 false)))

(declare-datatypes ((tuple2!158 0))(
  ( (tuple2!159 (_1!86 BitStream!146) (_2!86 BitStream!146)) )
))
(declare-fun lt!1762 () tuple2!158)

(declare-fun reader!0 (BitStream!146 BitStream!146) tuple2!158)

(assert (=> b!2220 (= lt!1762 (reader!0 thiss!1486 (_2!85 lt!1763)))))

(declare-fun b!2221 () Bool)

(declare-fun res!3964 () Bool)

(assert (=> b!2221 (=> (not res!3964) (not e!1574))))

(assert (=> b!2221 (= res!3964 (= (size!84 (buf!393 thiss!1486)) (size!84 (buf!393 (_2!85 lt!1763)))))))

(declare-fun b!2222 () Bool)

(assert (=> b!2222 (= e!1571 (array_inv!79 (buf!393 thiss!1486)))))

(declare-fun b!2223 () Bool)

(assert (=> b!2223 (= e!1570 e!1574)))

(declare-fun res!3966 () Bool)

(assert (=> b!2223 (=> (not res!3966) (not e!1574))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2223 (= res!3966 (invariant!0 (currentBit!1343 (_2!85 lt!1763)) (currentByte!1348 (_2!85 lt!1763)) (size!84 (buf!393 (_2!85 lt!1763)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!146 array!211 (_ BitVec 64) (_ BitVec 64)) tuple2!156)

(assert (=> b!2223 (= lt!1763 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!714 res!3963) b!2217))

(assert (= (and b!2217 res!3967) b!2223))

(assert (= (and b!2223 res!3966) b!2221))

(assert (= (and b!2221 res!3964) b!2218))

(assert (= (and b!2218 res!3965) b!2219))

(assert (= (and b!2219 res!3962) b!2220))

(assert (= start!714 b!2222))

(declare-fun m!1855 () Bool)

(assert (=> b!2220 m!1855))

(declare-fun m!1857 () Bool)

(assert (=> start!714 m!1857))

(declare-fun m!1859 () Bool)

(assert (=> start!714 m!1859))

(declare-fun m!1861 () Bool)

(assert (=> b!2219 m!1861))

(declare-fun m!1863 () Bool)

(assert (=> b!2218 m!1863))

(declare-fun m!1865 () Bool)

(assert (=> b!2218 m!1865))

(declare-fun m!1867 () Bool)

(assert (=> b!2217 m!1867))

(declare-fun m!1869 () Bool)

(assert (=> b!2223 m!1869))

(declare-fun m!1871 () Bool)

(assert (=> b!2223 m!1871))

(declare-fun m!1873 () Bool)

(assert (=> b!2222 m!1873))

(push 1)

(assert (not b!2219))

(assert (not b!2220))

(assert (not b!2222))

(assert (not b!2217))

(assert (not b!2223))

(assert (not start!714))

(assert (not b!2218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

