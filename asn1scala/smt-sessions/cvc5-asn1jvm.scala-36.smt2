; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!728 () Bool)

(assert start!728)

(declare-fun res!4093 () Bool)

(declare-fun e!1677 () Bool)

(assert (=> start!728 (=> (not res!4093) (not e!1677))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!225 0))(
  ( (array!226 (arr!478 (Array (_ BitVec 32) (_ BitVec 8))) (size!91 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!225)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!728 (= res!4093 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!91 srcBuffer!6))))))))

(assert (=> start!728 e!1677))

(assert (=> start!728 true))

(declare-fun array_inv!86 (array!225) Bool)

(assert (=> start!728 (array_inv!86 srcBuffer!6)))

(declare-datatypes ((BitStream!160 0))(
  ( (BitStream!161 (buf!400 array!225) (currentByte!1355 (_ BitVec 32)) (currentBit!1350 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!160)

(declare-fun e!1676 () Bool)

(declare-fun inv!12 (BitStream!160) Bool)

(assert (=> start!728 (and (inv!12 thiss!1486) e!1676)))

(declare-fun b!2364 () Bool)

(assert (=> b!2364 (= e!1676 (array_inv!86 (buf!400 thiss!1486)))))

(declare-fun b!2365 () Bool)

(declare-fun e!1675 () Bool)

(assert (=> b!2365 (= e!1677 e!1675)))

(declare-fun res!4092 () Bool)

(assert (=> b!2365 (=> (not res!4092) (not e!1675))))

(declare-datatypes ((Unit!136 0))(
  ( (Unit!137) )
))
(declare-datatypes ((tuple2!184 0))(
  ( (tuple2!185 (_1!99 Unit!136) (_2!99 BitStream!160)) )
))
(declare-fun lt!1807 () tuple2!184)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2365 (= res!4092 (invariant!0 (currentBit!1350 (_2!99 lt!1807)) (currentByte!1355 (_2!99 lt!1807)) (size!91 (buf!400 (_2!99 lt!1807)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!160 array!225 (_ BitVec 64) (_ BitVec 64)) tuple2!184)

(assert (=> b!2365 (= lt!1807 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2366 () Bool)

(declare-fun res!4091 () Bool)

(assert (=> b!2366 (=> (not res!4091) (not e!1675))))

(declare-fun isPrefixOf!0 (BitStream!160 BitStream!160) Bool)

(assert (=> b!2366 (= res!4091 (isPrefixOf!0 thiss!1486 (_2!99 lt!1807)))))

(declare-fun b!2367 () Bool)

(declare-fun res!4090 () Bool)

(assert (=> b!2367 (=> (not res!4090) (not e!1675))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2367 (= res!4090 (= (bitIndex!0 (size!91 (buf!400 (_2!99 lt!1807))) (currentByte!1355 (_2!99 lt!1807)) (currentBit!1350 (_2!99 lt!1807))) (bvadd (bitIndex!0 (size!91 (buf!400 thiss!1486)) (currentByte!1355 thiss!1486) (currentBit!1350 thiss!1486)) nBits!460)))))

(declare-fun b!2368 () Bool)

(declare-fun res!4089 () Bool)

(assert (=> b!2368 (=> (not res!4089) (not e!1677))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2368 (= res!4089 (validate_offset_bits!1 ((_ sign_extend 32) (size!91 (buf!400 thiss!1486))) ((_ sign_extend 32) (currentByte!1355 thiss!1486)) ((_ sign_extend 32) (currentBit!1350 thiss!1486)) nBits!460))))

(declare-fun b!2369 () Bool)

(declare-fun res!4088 () Bool)

(assert (=> b!2369 (=> (not res!4088) (not e!1675))))

(assert (=> b!2369 (= res!4088 (= (size!91 (buf!400 thiss!1486)) (size!91 (buf!400 (_2!99 lt!1807)))))))

(declare-fun b!2370 () Bool)

(assert (=> b!2370 (= e!1675 (not (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> b!2370 (validate_offset_bits!1 ((_ sign_extend 32) (size!91 (buf!400 (_2!99 lt!1807)))) ((_ sign_extend 32) (currentByte!1355 thiss!1486)) ((_ sign_extend 32) (currentBit!1350 thiss!1486)) nBits!460)))

(declare-fun lt!1808 () Unit!136)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!160 array!225 (_ BitVec 64)) Unit!136)

(assert (=> b!2370 (= lt!1808 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!400 (_2!99 lt!1807)) nBits!460))))

(declare-datatypes ((tuple2!186 0))(
  ( (tuple2!187 (_1!100 BitStream!160) (_2!100 BitStream!160)) )
))
(declare-fun lt!1806 () tuple2!186)

(declare-fun reader!0 (BitStream!160 BitStream!160) tuple2!186)

(assert (=> b!2370 (= lt!1806 (reader!0 thiss!1486 (_2!99 lt!1807)))))

(assert (= (and start!728 res!4093) b!2368))

(assert (= (and b!2368 res!4089) b!2365))

(assert (= (and b!2365 res!4092) b!2369))

(assert (= (and b!2369 res!4088) b!2367))

(assert (= (and b!2367 res!4090) b!2366))

(assert (= (and b!2366 res!4091) b!2370))

(assert (= start!728 b!2364))

(declare-fun m!1995 () Bool)

(assert (=> b!2364 m!1995))

(declare-fun m!1997 () Bool)

(assert (=> b!2368 m!1997))

(declare-fun m!1999 () Bool)

(assert (=> b!2365 m!1999))

(declare-fun m!2001 () Bool)

(assert (=> b!2365 m!2001))

(declare-fun m!2003 () Bool)

(assert (=> b!2366 m!2003))

(declare-fun m!2005 () Bool)

(assert (=> b!2367 m!2005))

(declare-fun m!2007 () Bool)

(assert (=> b!2367 m!2007))

(declare-fun m!2009 () Bool)

(assert (=> b!2370 m!2009))

(declare-fun m!2011 () Bool)

(assert (=> b!2370 m!2011))

(declare-fun m!2013 () Bool)

(assert (=> b!2370 m!2013))

(declare-fun m!2015 () Bool)

(assert (=> start!728 m!2015))

(declare-fun m!2017 () Bool)

(assert (=> start!728 m!2017))

(push 1)

(assert (not b!2365))

(assert (not b!2366))

(assert (not b!2367))

(assert (not start!728))

(assert (not b!2364))

(assert (not b!2368))

(assert (not b!2370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

