; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55154 () Bool)

(assert start!55154)

(declare-fun res!215717 () Bool)

(declare-fun e!178478 () Bool)

(assert (=> start!55154 (=> (not res!215717) (not e!178478))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55154 (= res!215717 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55154 e!178478))

(assert (=> start!55154 true))

(declare-datatypes ((array!13990 0))(
  ( (array!13991 (arr!7122 (Array (_ BitVec 32) (_ BitVec 8))) (size!6135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11192 0))(
  ( (BitStream!11193 (buf!6657 array!13990) (currentByte!12202 (_ BitVec 32)) (currentBit!12197 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11192)

(declare-fun e!178479 () Bool)

(declare-fun inv!12 (BitStream!11192) Bool)

(assert (=> start!55154 (and (inv!12 thiss!1754) e!178479)))

(declare-fun b!257394 () Bool)

(declare-fun array_inv!5876 (array!13990) Bool)

(assert (=> b!257394 (= e!178479 (array_inv!5876 (buf!6657 thiss!1754)))))

(declare-fun b!257395 () Bool)

(declare-fun res!215718 () Bool)

(assert (=> b!257395 (=> (not res!215718) (not e!178478))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257395 (= res!215718 (validate_offset_bits!1 ((_ sign_extend 32) (size!6135 (buf!6657 thiss!1754))) ((_ sign_extend 32) (currentByte!12202 thiss!1754)) ((_ sign_extend 32) (currentBit!12197 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257396 () Bool)

(declare-fun res!215719 () Bool)

(assert (=> b!257396 (=> (not res!215719) (not e!178478))))

(assert (=> b!257396 (= res!215719 (not (= from!526 nBits!535)))))

(declare-fun b!257397 () Bool)

(declare-fun e!178480 () Bool)

(assert (=> b!257397 (= e!178478 e!178480)))

(declare-fun res!215716 () Bool)

(assert (=> b!257397 (=> (not res!215716) (not e!178480))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22020 0))(
  ( (tuple2!22021 (_1!11946 Bool) (_2!11946 BitStream!11192)) )
))
(declare-fun lt!398698 () tuple2!22020)

(assert (=> b!257397 (= res!215716 (and (= (_1!11946 lt!398698) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6135 (buf!6657 thiss!1754)) (size!6135 (buf!6657 (_2!11946 lt!398698))))))))

(declare-fun readBit!0 (BitStream!11192) tuple2!22020)

(assert (=> b!257397 (= lt!398698 (readBit!0 thiss!1754))))

(declare-fun b!257398 () Bool)

(assert (=> b!257398 (= e!178480 false)))

(declare-fun lt!398697 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257398 (= lt!398697 (bitIndex!0 (size!6135 (buf!6657 (_2!11946 lt!398698))) (currentByte!12202 (_2!11946 lt!398698)) (currentBit!12197 (_2!11946 lt!398698))))))

(declare-fun lt!398699 () (_ BitVec 64))

(assert (=> b!257398 (= lt!398699 (bitIndex!0 (size!6135 (buf!6657 thiss!1754)) (currentByte!12202 thiss!1754) (currentBit!12197 thiss!1754)))))

(assert (= (and start!55154 res!215717) b!257395))

(assert (= (and b!257395 res!215718) b!257396))

(assert (= (and b!257396 res!215719) b!257397))

(assert (= (and b!257397 res!215716) b!257398))

(assert (= start!55154 b!257394))

(declare-fun m!386909 () Bool)

(assert (=> b!257397 m!386909))

(declare-fun m!386911 () Bool)

(assert (=> b!257398 m!386911))

(declare-fun m!386913 () Bool)

(assert (=> b!257398 m!386913))

(declare-fun m!386915 () Bool)

(assert (=> b!257394 m!386915))

(declare-fun m!386917 () Bool)

(assert (=> start!55154 m!386917))

(declare-fun m!386919 () Bool)

(assert (=> b!257395 m!386919))

(push 1)

(assert (not b!257395))

(assert (not start!55154))

(assert (not b!257398))

(assert (not b!257397))

(assert (not b!257394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

