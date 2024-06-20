; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55126 () Bool)

(assert start!55126)

(declare-fun b!257184 () Bool)

(declare-fun res!215551 () Bool)

(declare-fun e!178311 () Bool)

(assert (=> b!257184 (=> (not res!215551) (not e!178311))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13962 0))(
  ( (array!13963 (arr!7108 (Array (_ BitVec 32) (_ BitVec 8))) (size!6121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11164 0))(
  ( (BitStream!11165 (buf!6643 array!13962) (currentByte!12188 (_ BitVec 32)) (currentBit!12183 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11164)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257184 (= res!215551 (validate_offset_bits!1 ((_ sign_extend 32) (size!6121 (buf!6643 thiss!1754))) ((_ sign_extend 32) (currentByte!12188 thiss!1754)) ((_ sign_extend 32) (currentBit!12183 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257185 () Bool)

(declare-fun e!178312 () Bool)

(assert (=> b!257185 (= e!178312 false)))

(declare-fun lt!398572 () (_ BitVec 64))

(declare-datatypes ((tuple2!21992 0))(
  ( (tuple2!21993 (_1!11932 Bool) (_2!11932 BitStream!11164)) )
))
(declare-fun lt!398571 () tuple2!21992)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257185 (= lt!398572 (bitIndex!0 (size!6121 (buf!6643 (_2!11932 lt!398571))) (currentByte!12188 (_2!11932 lt!398571)) (currentBit!12183 (_2!11932 lt!398571))))))

(declare-fun lt!398573 () (_ BitVec 64))

(assert (=> b!257185 (= lt!398573 (bitIndex!0 (size!6121 (buf!6643 thiss!1754)) (currentByte!12188 thiss!1754) (currentBit!12183 thiss!1754)))))

(declare-fun res!215548 () Bool)

(assert (=> start!55126 (=> (not res!215548) (not e!178311))))

(assert (=> start!55126 (= res!215548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55126 e!178311))

(assert (=> start!55126 true))

(declare-fun e!178309 () Bool)

(declare-fun inv!12 (BitStream!11164) Bool)

(assert (=> start!55126 (and (inv!12 thiss!1754) e!178309)))

(declare-fun b!257186 () Bool)

(assert (=> b!257186 (= e!178311 e!178312)))

(declare-fun res!215549 () Bool)

(assert (=> b!257186 (=> (not res!215549) (not e!178312))))

(declare-fun expected!109 () Bool)

(assert (=> b!257186 (= res!215549 (not (= (_1!11932 lt!398571) expected!109)))))

(declare-fun readBit!0 (BitStream!11164) tuple2!21992)

(assert (=> b!257186 (= lt!398571 (readBit!0 thiss!1754))))

(declare-fun b!257187 () Bool)

(declare-fun res!215550 () Bool)

(assert (=> b!257187 (=> (not res!215550) (not e!178311))))

(assert (=> b!257187 (= res!215550 (not (= from!526 nBits!535)))))

(declare-fun b!257188 () Bool)

(declare-fun array_inv!5862 (array!13962) Bool)

(assert (=> b!257188 (= e!178309 (array_inv!5862 (buf!6643 thiss!1754)))))

(assert (= (and start!55126 res!215548) b!257184))

(assert (= (and b!257184 res!215551) b!257187))

(assert (= (and b!257187 res!215550) b!257186))

(assert (= (and b!257186 res!215549) b!257185))

(assert (= start!55126 b!257188))

(declare-fun m!386741 () Bool)

(assert (=> start!55126 m!386741))

(declare-fun m!386743 () Bool)

(assert (=> b!257184 m!386743))

(declare-fun m!386745 () Bool)

(assert (=> b!257188 m!386745))

(declare-fun m!386747 () Bool)

(assert (=> b!257185 m!386747))

(declare-fun m!386749 () Bool)

(assert (=> b!257185 m!386749))

(declare-fun m!386751 () Bool)

(assert (=> b!257186 m!386751))

(push 1)

(assert (not b!257184))

(assert (not start!55126))

(assert (not b!257188))

(assert (not b!257186))

(assert (not b!257185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

