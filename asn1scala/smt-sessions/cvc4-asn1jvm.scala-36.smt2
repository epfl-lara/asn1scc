; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!732 () Bool)

(assert start!732)

(declare-fun b!2406 () Bool)

(declare-fun e!1707 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!2406 (= e!1707 (not (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(declare-datatypes ((array!229 0))(
  ( (array!230 (arr!480 (Array (_ BitVec 32) (_ BitVec 8))) (size!93 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!164 0))(
  ( (BitStream!165 (buf!402 array!229) (currentByte!1357 (_ BitVec 32)) (currentBit!1352 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!140 0))(
  ( (Unit!141) )
))
(declare-datatypes ((tuple2!192 0))(
  ( (tuple2!193 (_1!103 Unit!140) (_2!103 BitStream!164)) )
))
(declare-fun lt!1824 () tuple2!192)

(declare-fun thiss!1486 () BitStream!164)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2406 (validate_offset_bits!1 ((_ sign_extend 32) (size!93 (buf!402 (_2!103 lt!1824)))) ((_ sign_extend 32) (currentByte!1357 thiss!1486)) ((_ sign_extend 32) (currentBit!1352 thiss!1486)) nBits!460)))

(declare-fun lt!1826 () Unit!140)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!164 array!229 (_ BitVec 64)) Unit!140)

(assert (=> b!2406 (= lt!1826 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!402 (_2!103 lt!1824)) nBits!460))))

(declare-datatypes ((tuple2!194 0))(
  ( (tuple2!195 (_1!104 BitStream!164) (_2!104 BitStream!164)) )
))
(declare-fun lt!1825 () tuple2!194)

(declare-fun reader!0 (BitStream!164 BitStream!164) tuple2!194)

(assert (=> b!2406 (= lt!1825 (reader!0 thiss!1486 (_2!103 lt!1824)))))

(declare-fun b!2407 () Bool)

(declare-fun res!4127 () Bool)

(declare-fun e!1708 () Bool)

(assert (=> b!2407 (=> (not res!4127) (not e!1708))))

(assert (=> b!2407 (= res!4127 (validate_offset_bits!1 ((_ sign_extend 32) (size!93 (buf!402 thiss!1486))) ((_ sign_extend 32) (currentByte!1357 thiss!1486)) ((_ sign_extend 32) (currentBit!1352 thiss!1486)) nBits!460))))

(declare-fun b!2408 () Bool)

(declare-fun res!4129 () Bool)

(assert (=> b!2408 (=> (not res!4129) (not e!1707))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2408 (= res!4129 (= (bitIndex!0 (size!93 (buf!402 (_2!103 lt!1824))) (currentByte!1357 (_2!103 lt!1824)) (currentBit!1352 (_2!103 lt!1824))) (bvadd (bitIndex!0 (size!93 (buf!402 thiss!1486)) (currentByte!1357 thiss!1486) (currentBit!1352 thiss!1486)) nBits!460)))))

(declare-fun b!2409 () Bool)

(declare-fun e!1709 () Bool)

(declare-fun array_inv!88 (array!229) Bool)

(assert (=> b!2409 (= e!1709 (array_inv!88 (buf!402 thiss!1486)))))

(declare-fun b!2410 () Bool)

(declare-fun res!4125 () Bool)

(assert (=> b!2410 (=> (not res!4125) (not e!1707))))

(assert (=> b!2410 (= res!4125 (= (size!93 (buf!402 thiss!1486)) (size!93 (buf!402 (_2!103 lt!1824)))))))

(declare-fun b!2411 () Bool)

(declare-fun res!4126 () Bool)

(assert (=> b!2411 (=> (not res!4126) (not e!1707))))

(declare-fun isPrefixOf!0 (BitStream!164 BitStream!164) Bool)

(assert (=> b!2411 (= res!4126 (isPrefixOf!0 thiss!1486 (_2!103 lt!1824)))))

(declare-fun res!4124 () Bool)

(assert (=> start!732 (=> (not res!4124) (not e!1708))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!229)

(assert (=> start!732 (= res!4124 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!93 srcBuffer!6))))))))

(assert (=> start!732 e!1708))

(assert (=> start!732 true))

(assert (=> start!732 (array_inv!88 srcBuffer!6)))

(declare-fun inv!12 (BitStream!164) Bool)

(assert (=> start!732 (and (inv!12 thiss!1486) e!1709)))

(declare-fun b!2412 () Bool)

(assert (=> b!2412 (= e!1708 e!1707)))

(declare-fun res!4128 () Bool)

(assert (=> b!2412 (=> (not res!4128) (not e!1707))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2412 (= res!4128 (invariant!0 (currentBit!1352 (_2!103 lt!1824)) (currentByte!1357 (_2!103 lt!1824)) (size!93 (buf!402 (_2!103 lt!1824)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!164 array!229 (_ BitVec 64) (_ BitVec 64)) tuple2!192)

(assert (=> b!2412 (= lt!1824 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!732 res!4124) b!2407))

(assert (= (and b!2407 res!4127) b!2412))

(assert (= (and b!2412 res!4128) b!2410))

(assert (= (and b!2410 res!4125) b!2408))

(assert (= (and b!2408 res!4129) b!2411))

(assert (= (and b!2411 res!4126) b!2406))

(assert (= start!732 b!2409))

(declare-fun m!2043 () Bool)

(assert (=> b!2407 m!2043))

(declare-fun m!2045 () Bool)

(assert (=> b!2406 m!2045))

(declare-fun m!2047 () Bool)

(assert (=> b!2406 m!2047))

(declare-fun m!2049 () Bool)

(assert (=> b!2406 m!2049))

(declare-fun m!2051 () Bool)

(assert (=> b!2408 m!2051))

(declare-fun m!2053 () Bool)

(assert (=> b!2408 m!2053))

(declare-fun m!2055 () Bool)

(assert (=> b!2409 m!2055))

(declare-fun m!2057 () Bool)

(assert (=> start!732 m!2057))

(declare-fun m!2059 () Bool)

(assert (=> start!732 m!2059))

(declare-fun m!2061 () Bool)

(assert (=> b!2412 m!2061))

(declare-fun m!2063 () Bool)

(assert (=> b!2412 m!2063))

(declare-fun m!2065 () Bool)

(assert (=> b!2411 m!2065))

(push 1)

(assert (not b!2412))

(assert (not b!2411))

(assert (not b!2406))

(assert (not b!2407))

(assert (not start!732))

(assert (not b!2409))

(assert (not b!2408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

