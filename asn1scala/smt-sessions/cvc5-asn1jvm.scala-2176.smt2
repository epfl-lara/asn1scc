; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55156 () Bool)

(assert start!55156)

(declare-fun b!257409 () Bool)

(declare-fun res!215731 () Bool)

(declare-fun e!178490 () Bool)

(assert (=> b!257409 (=> (not res!215731) (not e!178490))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257409 (= res!215731 (not (= from!526 nBits!535)))))

(declare-fun res!215730 () Bool)

(assert (=> start!55156 (=> (not res!215730) (not e!178490))))

(assert (=> start!55156 (= res!215730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55156 e!178490))

(assert (=> start!55156 true))

(declare-datatypes ((array!13992 0))(
  ( (array!13993 (arr!7123 (Array (_ BitVec 32) (_ BitVec 8))) (size!6136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11194 0))(
  ( (BitStream!11195 (buf!6658 array!13992) (currentByte!12203 (_ BitVec 32)) (currentBit!12198 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11194)

(declare-fun e!178491 () Bool)

(declare-fun inv!12 (BitStream!11194) Bool)

(assert (=> start!55156 (and (inv!12 thiss!1754) e!178491)))

(declare-fun b!257410 () Bool)

(declare-fun res!215729 () Bool)

(assert (=> b!257410 (=> (not res!215729) (not e!178490))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257410 (= res!215729 (validate_offset_bits!1 ((_ sign_extend 32) (size!6136 (buf!6658 thiss!1754))) ((_ sign_extend 32) (currentByte!12203 thiss!1754)) ((_ sign_extend 32) (currentBit!12198 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257411 () Bool)

(declare-fun e!178489 () Bool)

(assert (=> b!257411 (= e!178489 false)))

(declare-fun lt!398707 () (_ BitVec 64))

(declare-datatypes ((tuple2!22022 0))(
  ( (tuple2!22023 (_1!11947 Bool) (_2!11947 BitStream!11194)) )
))
(declare-fun lt!398706 () tuple2!22022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257411 (= lt!398707 (bitIndex!0 (size!6136 (buf!6658 (_2!11947 lt!398706))) (currentByte!12203 (_2!11947 lt!398706)) (currentBit!12198 (_2!11947 lt!398706))))))

(declare-fun lt!398708 () (_ BitVec 64))

(assert (=> b!257411 (= lt!398708 (bitIndex!0 (size!6136 (buf!6658 thiss!1754)) (currentByte!12203 thiss!1754) (currentBit!12198 thiss!1754)))))

(declare-fun b!257412 () Bool)

(assert (=> b!257412 (= e!178490 e!178489)))

(declare-fun res!215728 () Bool)

(assert (=> b!257412 (=> (not res!215728) (not e!178489))))

(declare-fun expected!109 () Bool)

(assert (=> b!257412 (= res!215728 (and (= (_1!11947 lt!398706) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6136 (buf!6658 thiss!1754)) (size!6136 (buf!6658 (_2!11947 lt!398706))))))))

(declare-fun readBit!0 (BitStream!11194) tuple2!22022)

(assert (=> b!257412 (= lt!398706 (readBit!0 thiss!1754))))

(declare-fun b!257413 () Bool)

(declare-fun array_inv!5877 (array!13992) Bool)

(assert (=> b!257413 (= e!178491 (array_inv!5877 (buf!6658 thiss!1754)))))

(assert (= (and start!55156 res!215730) b!257410))

(assert (= (and b!257410 res!215729) b!257409))

(assert (= (and b!257409 res!215731) b!257412))

(assert (= (and b!257412 res!215728) b!257411))

(assert (= start!55156 b!257413))

(declare-fun m!386921 () Bool)

(assert (=> b!257413 m!386921))

(declare-fun m!386923 () Bool)

(assert (=> b!257412 m!386923))

(declare-fun m!386925 () Bool)

(assert (=> b!257410 m!386925))

(declare-fun m!386927 () Bool)

(assert (=> start!55156 m!386927))

(declare-fun m!386929 () Bool)

(assert (=> b!257411 m!386929))

(declare-fun m!386931 () Bool)

(assert (=> b!257411 m!386931))

(push 1)

(assert (not b!257412))

(assert (not b!257411))

(assert (not b!257410))

(assert (not start!55156))

(assert (not b!257413))

(check-sat)

(pop 1)

