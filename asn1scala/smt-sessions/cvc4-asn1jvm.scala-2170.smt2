; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55124 () Bool)

(assert start!55124)

(declare-fun b!257169 () Bool)

(declare-fun e!178297 () Bool)

(declare-datatypes ((array!13960 0))(
  ( (array!13961 (arr!7107 (Array (_ BitVec 32) (_ BitVec 8))) (size!6120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11162 0))(
  ( (BitStream!11163 (buf!6642 array!13960) (currentByte!12187 (_ BitVec 32)) (currentBit!12182 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11162)

(declare-fun array_inv!5861 (array!13960) Bool)

(assert (=> b!257169 (= e!178297 (array_inv!5861 (buf!6642 thiss!1754)))))

(declare-fun res!215539 () Bool)

(declare-fun e!178300 () Bool)

(assert (=> start!55124 (=> (not res!215539) (not e!178300))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55124 (= res!215539 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55124 e!178300))

(assert (=> start!55124 true))

(declare-fun inv!12 (BitStream!11162) Bool)

(assert (=> start!55124 (and (inv!12 thiss!1754) e!178297)))

(declare-fun b!257170 () Bool)

(declare-fun res!215536 () Bool)

(assert (=> b!257170 (=> (not res!215536) (not e!178300))))

(assert (=> b!257170 (= res!215536 (not (= from!526 nBits!535)))))

(declare-fun b!257171 () Bool)

(declare-fun e!178299 () Bool)

(assert (=> b!257171 (= e!178299 false)))

(declare-fun lt!398563 () (_ BitVec 64))

(declare-datatypes ((tuple2!21990 0))(
  ( (tuple2!21991 (_1!11931 Bool) (_2!11931 BitStream!11162)) )
))
(declare-fun lt!398564 () tuple2!21990)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257171 (= lt!398563 (bitIndex!0 (size!6120 (buf!6642 (_2!11931 lt!398564))) (currentByte!12187 (_2!11931 lt!398564)) (currentBit!12182 (_2!11931 lt!398564))))))

(declare-fun lt!398562 () (_ BitVec 64))

(assert (=> b!257171 (= lt!398562 (bitIndex!0 (size!6120 (buf!6642 thiss!1754)) (currentByte!12187 thiss!1754) (currentBit!12182 thiss!1754)))))

(declare-fun b!257172 () Bool)

(declare-fun res!215537 () Bool)

(assert (=> b!257172 (=> (not res!215537) (not e!178300))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257172 (= res!215537 (validate_offset_bits!1 ((_ sign_extend 32) (size!6120 (buf!6642 thiss!1754))) ((_ sign_extend 32) (currentByte!12187 thiss!1754)) ((_ sign_extend 32) (currentBit!12182 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257173 () Bool)

(assert (=> b!257173 (= e!178300 e!178299)))

(declare-fun res!215538 () Bool)

(assert (=> b!257173 (=> (not res!215538) (not e!178299))))

(declare-fun expected!109 () Bool)

(assert (=> b!257173 (= res!215538 (not (= (_1!11931 lt!398564) expected!109)))))

(declare-fun readBit!0 (BitStream!11162) tuple2!21990)

(assert (=> b!257173 (= lt!398564 (readBit!0 thiss!1754))))

(assert (= (and start!55124 res!215539) b!257172))

(assert (= (and b!257172 res!215537) b!257170))

(assert (= (and b!257170 res!215536) b!257173))

(assert (= (and b!257173 res!215538) b!257171))

(assert (= start!55124 b!257169))

(declare-fun m!386729 () Bool)

(assert (=> b!257173 m!386729))

(declare-fun m!386731 () Bool)

(assert (=> start!55124 m!386731))

(declare-fun m!386733 () Bool)

(assert (=> b!257171 m!386733))

(declare-fun m!386735 () Bool)

(assert (=> b!257171 m!386735))

(declare-fun m!386737 () Bool)

(assert (=> b!257172 m!386737))

(declare-fun m!386739 () Bool)

(assert (=> b!257169 m!386739))

(push 1)

(assert (not b!257173))

(assert (not start!55124))

(assert (not b!257169))

(assert (not b!257171))

(assert (not b!257172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

