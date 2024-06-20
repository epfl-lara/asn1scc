; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!716 () Bool)

(assert start!716)

(declare-fun b!2238 () Bool)

(declare-fun res!3982 () Bool)

(declare-fun e!1588 () Bool)

(assert (=> b!2238 (=> (not res!3982) (not e!1588))))

(declare-datatypes ((array!213 0))(
  ( (array!214 (arr!472 (Array (_ BitVec 32) (_ BitVec 8))) (size!85 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!148 0))(
  ( (BitStream!149 (buf!394 array!213) (currentByte!1349 (_ BitVec 32)) (currentBit!1344 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!148)

(declare-datatypes ((Unit!124 0))(
  ( (Unit!125) )
))
(declare-datatypes ((tuple2!160 0))(
  ( (tuple2!161 (_1!87 Unit!124) (_2!87 BitStream!148)) )
))
(declare-fun lt!1768 () tuple2!160)

(assert (=> b!2238 (= res!3982 (= (size!85 (buf!394 thiss!1486)) (size!85 (buf!394 (_2!87 lt!1768)))))))

(declare-fun b!2239 () Bool)

(declare-fun res!3983 () Bool)

(assert (=> b!2239 (=> (not res!3983) (not e!1588))))

(declare-fun isPrefixOf!0 (BitStream!148 BitStream!148) Bool)

(assert (=> b!2239 (= res!3983 (isPrefixOf!0 thiss!1486 (_2!87 lt!1768)))))

(declare-fun res!3980 () Bool)

(declare-fun e!1587 () Bool)

(assert (=> start!716 (=> (not res!3980) (not e!1587))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!213)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!716 (= res!3980 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!85 srcBuffer!6))))))))

(assert (=> start!716 e!1587))

(assert (=> start!716 true))

(declare-fun array_inv!80 (array!213) Bool)

(assert (=> start!716 (array_inv!80 srcBuffer!6)))

(declare-fun e!1586 () Bool)

(declare-fun inv!12 (BitStream!148) Bool)

(assert (=> start!716 (and (inv!12 thiss!1486) e!1586)))

(declare-fun b!2240 () Bool)

(declare-fun res!3981 () Bool)

(assert (=> b!2240 (=> (not res!3981) (not e!1588))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2240 (= res!3981 (= (bitIndex!0 (size!85 (buf!394 (_2!87 lt!1768))) (currentByte!1349 (_2!87 lt!1768)) (currentBit!1344 (_2!87 lt!1768))) (bvadd (bitIndex!0 (size!85 (buf!394 thiss!1486)) (currentByte!1349 thiss!1486) (currentBit!1344 thiss!1486)) nBits!460)))))

(declare-fun b!2241 () Bool)

(assert (=> b!2241 (= e!1586 (array_inv!80 (buf!394 thiss!1486)))))

(declare-fun b!2242 () Bool)

(declare-fun res!3984 () Bool)

(assert (=> b!2242 (=> (not res!3984) (not e!1587))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2242 (= res!3984 (validate_offset_bits!1 ((_ sign_extend 32) (size!85 (buf!394 thiss!1486))) ((_ sign_extend 32) (currentByte!1349 thiss!1486)) ((_ sign_extend 32) (currentBit!1344 thiss!1486)) nBits!460))))

(declare-fun b!2243 () Bool)

(assert (=> b!2243 (= e!1588 false)))

(declare-datatypes ((tuple2!162 0))(
  ( (tuple2!163 (_1!88 BitStream!148) (_2!88 BitStream!148)) )
))
(declare-fun lt!1769 () tuple2!162)

(declare-fun reader!0 (BitStream!148 BitStream!148) tuple2!162)

(assert (=> b!2243 (= lt!1769 (reader!0 thiss!1486 (_2!87 lt!1768)))))

(declare-fun b!2244 () Bool)

(assert (=> b!2244 (= e!1587 e!1588)))

(declare-fun res!3985 () Bool)

(assert (=> b!2244 (=> (not res!3985) (not e!1588))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2244 (= res!3985 (invariant!0 (currentBit!1344 (_2!87 lt!1768)) (currentByte!1349 (_2!87 lt!1768)) (size!85 (buf!394 (_2!87 lt!1768)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!148 array!213 (_ BitVec 64) (_ BitVec 64)) tuple2!160)

(assert (=> b!2244 (= lt!1768 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!716 res!3980) b!2242))

(assert (= (and b!2242 res!3984) b!2244))

(assert (= (and b!2244 res!3985) b!2238))

(assert (= (and b!2238 res!3982) b!2240))

(assert (= (and b!2240 res!3981) b!2239))

(assert (= (and b!2239 res!3983) b!2243))

(assert (= start!716 b!2241))

(declare-fun m!1875 () Bool)

(assert (=> b!2244 m!1875))

(declare-fun m!1877 () Bool)

(assert (=> b!2244 m!1877))

(declare-fun m!1879 () Bool)

(assert (=> b!2239 m!1879))

(declare-fun m!1881 () Bool)

(assert (=> b!2243 m!1881))

(declare-fun m!1883 () Bool)

(assert (=> b!2241 m!1883))

(declare-fun m!1885 () Bool)

(assert (=> b!2240 m!1885))

(declare-fun m!1887 () Bool)

(assert (=> b!2240 m!1887))

(declare-fun m!1889 () Bool)

(assert (=> start!716 m!1889))

(declare-fun m!1891 () Bool)

(assert (=> start!716 m!1891))

(declare-fun m!1893 () Bool)

(assert (=> b!2242 m!1893))

(push 1)

(assert (not b!2244))

(assert (not b!2241))

(assert (not b!2240))

(assert (not b!2243))

(assert (not b!2242))

(assert (not b!2239))

(assert (not start!716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

