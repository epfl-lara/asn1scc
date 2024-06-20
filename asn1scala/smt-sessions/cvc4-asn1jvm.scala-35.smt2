; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!726 () Bool)

(assert start!726)

(declare-fun b!2343 () Bool)

(declare-fun e!1662 () Bool)

(declare-datatypes ((array!223 0))(
  ( (array!224 (arr!477 (Array (_ BitVec 32) (_ BitVec 8))) (size!90 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!158 0))(
  ( (BitStream!159 (buf!399 array!223) (currentByte!1354 (_ BitVec 32)) (currentBit!1349 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!158)

(declare-fun array_inv!85 (array!223) Bool)

(assert (=> b!2343 (= e!1662 (array_inv!85 (buf!399 thiss!1486)))))

(declare-fun b!2344 () Bool)

(declare-fun res!4074 () Bool)

(declare-fun e!1661 () Bool)

(assert (=> b!2344 (=> (not res!4074) (not e!1661))))

(declare-datatypes ((Unit!134 0))(
  ( (Unit!135) )
))
(declare-datatypes ((tuple2!180 0))(
  ( (tuple2!181 (_1!97 Unit!134) (_2!97 BitStream!158)) )
))
(declare-fun lt!1799 () tuple2!180)

(assert (=> b!2344 (= res!4074 (= (size!90 (buf!399 thiss!1486)) (size!90 (buf!399 (_2!97 lt!1799)))))))

(declare-fun b!2345 () Bool)

(declare-fun res!4070 () Bool)

(assert (=> b!2345 (=> (not res!4070) (not e!1661))))

(declare-fun isPrefixOf!0 (BitStream!158 BitStream!158) Bool)

(assert (=> b!2345 (= res!4070 (isPrefixOf!0 thiss!1486 (_2!97 lt!1799)))))

(declare-fun res!4072 () Bool)

(declare-fun e!1660 () Bool)

(assert (=> start!726 (=> (not res!4072) (not e!1660))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!223)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!726 (= res!4072 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!90 srcBuffer!6))))))))

(assert (=> start!726 e!1660))

(assert (=> start!726 true))

(assert (=> start!726 (array_inv!85 srcBuffer!6)))

(declare-fun inv!12 (BitStream!158) Bool)

(assert (=> start!726 (and (inv!12 thiss!1486) e!1662)))

(declare-fun b!2346 () Bool)

(declare-fun res!4071 () Bool)

(assert (=> b!2346 (=> (not res!4071) (not e!1661))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2346 (= res!4071 (= (bitIndex!0 (size!90 (buf!399 (_2!97 lt!1799))) (currentByte!1354 (_2!97 lt!1799)) (currentBit!1349 (_2!97 lt!1799))) (bvadd (bitIndex!0 (size!90 (buf!399 thiss!1486)) (currentByte!1354 thiss!1486) (currentBit!1349 thiss!1486)) nBits!460)))))

(declare-fun b!2347 () Bool)

(assert (=> b!2347 (= e!1660 e!1661)))

(declare-fun res!4075 () Bool)

(assert (=> b!2347 (=> (not res!4075) (not e!1661))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2347 (= res!4075 (invariant!0 (currentBit!1349 (_2!97 lt!1799)) (currentByte!1354 (_2!97 lt!1799)) (size!90 (buf!399 (_2!97 lt!1799)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!158 array!223 (_ BitVec 64) (_ BitVec 64)) tuple2!180)

(assert (=> b!2347 (= lt!1799 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2348 () Bool)

(declare-fun res!4073 () Bool)

(assert (=> b!2348 (=> (not res!4073) (not e!1660))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2348 (= res!4073 (validate_offset_bits!1 ((_ sign_extend 32) (size!90 (buf!399 thiss!1486))) ((_ sign_extend 32) (currentByte!1354 thiss!1486)) ((_ sign_extend 32) (currentBit!1349 thiss!1486)) nBits!460))))

(declare-fun b!2349 () Bool)

(assert (=> b!2349 (= e!1661 false)))

(declare-datatypes ((tuple2!182 0))(
  ( (tuple2!183 (_1!98 BitStream!158) (_2!98 BitStream!158)) )
))
(declare-fun lt!1798 () tuple2!182)

(declare-fun reader!0 (BitStream!158 BitStream!158) tuple2!182)

(assert (=> b!2349 (= lt!1798 (reader!0 thiss!1486 (_2!97 lt!1799)))))

(assert (= (and start!726 res!4072) b!2348))

(assert (= (and b!2348 res!4073) b!2347))

(assert (= (and b!2347 res!4075) b!2344))

(assert (= (and b!2344 res!4074) b!2346))

(assert (= (and b!2346 res!4071) b!2345))

(assert (= (and b!2345 res!4070) b!2349))

(assert (= start!726 b!2343))

(declare-fun m!1975 () Bool)

(assert (=> b!2343 m!1975))

(declare-fun m!1977 () Bool)

(assert (=> start!726 m!1977))

(declare-fun m!1979 () Bool)

(assert (=> start!726 m!1979))

(declare-fun m!1981 () Bool)

(assert (=> b!2346 m!1981))

(declare-fun m!1983 () Bool)

(assert (=> b!2346 m!1983))

(declare-fun m!1985 () Bool)

(assert (=> b!2349 m!1985))

(declare-fun m!1987 () Bool)

(assert (=> b!2348 m!1987))

(declare-fun m!1989 () Bool)

(assert (=> b!2345 m!1989))

(declare-fun m!1991 () Bool)

(assert (=> b!2347 m!1991))

(declare-fun m!1993 () Bool)

(assert (=> b!2347 m!1993))

(push 1)

(assert (not b!2346))

(assert (not b!2349))

(assert (not b!2348))

(assert (not b!2345))

(assert (not start!726))

(assert (not b!2347))

(assert (not b!2343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

