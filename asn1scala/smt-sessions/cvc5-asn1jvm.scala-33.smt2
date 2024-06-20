; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!710 () Bool)

(assert start!710)

(declare-fun b!2175 () Bool)

(declare-fun e!1540 () Bool)

(declare-fun e!1543 () Bool)

(assert (=> b!2175 (= e!1540 e!1543)))

(declare-fun res!3927 () Bool)

(assert (=> b!2175 (=> (not res!3927) (not e!1543))))

(declare-datatypes ((array!207 0))(
  ( (array!208 (arr!469 (Array (_ BitVec 32) (_ BitVec 8))) (size!82 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!142 0))(
  ( (BitStream!143 (buf!391 array!207) (currentByte!1346 (_ BitVec 32)) (currentBit!1341 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!118 0))(
  ( (Unit!119) )
))
(declare-datatypes ((tuple2!148 0))(
  ( (tuple2!149 (_1!81 Unit!118) (_2!81 BitStream!142)) )
))
(declare-fun lt!1750 () tuple2!148)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2175 (= res!3927 (invariant!0 (currentBit!1341 (_2!81 lt!1750)) (currentByte!1346 (_2!81 lt!1750)) (size!82 (buf!391 (_2!81 lt!1750)))))))

(declare-fun srcBuffer!6 () array!207)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!142)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!142 array!207 (_ BitVec 64) (_ BitVec 64)) tuple2!148)

(assert (=> b!2175 (= lt!1750 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2176 () Bool)

(declare-fun e!1544 () Bool)

(declare-fun array_inv!77 (array!207) Bool)

(assert (=> b!2176 (= e!1544 (array_inv!77 (buf!391 thiss!1486)))))

(declare-fun b!2177 () Bool)

(declare-fun res!3928 () Bool)

(assert (=> b!2177 (=> (not res!3928) (not e!1543))))

(assert (=> b!2177 (= res!3928 (= (size!82 (buf!391 thiss!1486)) (size!82 (buf!391 (_2!81 lt!1750)))))))

(declare-fun b!2178 () Bool)

(declare-fun res!3931 () Bool)

(assert (=> b!2178 (=> (not res!3931) (not e!1543))))

(declare-fun isPrefixOf!0 (BitStream!142 BitStream!142) Bool)

(assert (=> b!2178 (= res!3931 (isPrefixOf!0 thiss!1486 (_2!81 lt!1750)))))

(declare-fun b!2179 () Bool)

(declare-fun res!3926 () Bool)

(assert (=> b!2179 (=> (not res!3926) (not e!1543))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2179 (= res!3926 (= (bitIndex!0 (size!82 (buf!391 (_2!81 lt!1750))) (currentByte!1346 (_2!81 lt!1750)) (currentBit!1341 (_2!81 lt!1750))) (bvadd (bitIndex!0 (size!82 (buf!391 thiss!1486)) (currentByte!1346 thiss!1486) (currentBit!1341 thiss!1486)) nBits!460)))))

(declare-fun res!3930 () Bool)

(assert (=> start!710 (=> (not res!3930) (not e!1540))))

(assert (=> start!710 (= res!3930 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!82 srcBuffer!6))))))))

(assert (=> start!710 e!1540))

(assert (=> start!710 true))

(assert (=> start!710 (array_inv!77 srcBuffer!6)))

(declare-fun inv!12 (BitStream!142) Bool)

(assert (=> start!710 (and (inv!12 thiss!1486) e!1544)))

(declare-fun b!2180 () Bool)

(assert (=> b!2180 (= e!1543 false)))

(declare-datatypes ((tuple2!150 0))(
  ( (tuple2!151 (_1!82 BitStream!142) (_2!82 BitStream!142)) )
))
(declare-fun lt!1751 () tuple2!150)

(declare-fun reader!0 (BitStream!142 BitStream!142) tuple2!150)

(assert (=> b!2180 (= lt!1751 (reader!0 thiss!1486 (_2!81 lt!1750)))))

(declare-fun b!2181 () Bool)

(declare-fun res!3929 () Bool)

(assert (=> b!2181 (=> (not res!3929) (not e!1540))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2181 (= res!3929 (validate_offset_bits!1 ((_ sign_extend 32) (size!82 (buf!391 thiss!1486))) ((_ sign_extend 32) (currentByte!1346 thiss!1486)) ((_ sign_extend 32) (currentBit!1341 thiss!1486)) nBits!460))))

(assert (= (and start!710 res!3930) b!2181))

(assert (= (and b!2181 res!3929) b!2175))

(assert (= (and b!2175 res!3927) b!2177))

(assert (= (and b!2177 res!3928) b!2179))

(assert (= (and b!2179 res!3926) b!2178))

(assert (= (and b!2178 res!3931) b!2180))

(assert (= start!710 b!2176))

(declare-fun m!1815 () Bool)

(assert (=> b!2176 m!1815))

(declare-fun m!1817 () Bool)

(assert (=> start!710 m!1817))

(declare-fun m!1819 () Bool)

(assert (=> start!710 m!1819))

(declare-fun m!1821 () Bool)

(assert (=> b!2180 m!1821))

(declare-fun m!1823 () Bool)

(assert (=> b!2175 m!1823))

(declare-fun m!1825 () Bool)

(assert (=> b!2175 m!1825))

(declare-fun m!1827 () Bool)

(assert (=> b!2181 m!1827))

(declare-fun m!1829 () Bool)

(assert (=> b!2179 m!1829))

(declare-fun m!1831 () Bool)

(assert (=> b!2179 m!1831))

(declare-fun m!1833 () Bool)

(assert (=> b!2178 m!1833))

(push 1)

(assert (not b!2176))

(assert (not start!710))

(assert (not b!2179))

(assert (not b!2180))

(assert (not b!2178))

(assert (not b!2181))

(assert (not b!2175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

