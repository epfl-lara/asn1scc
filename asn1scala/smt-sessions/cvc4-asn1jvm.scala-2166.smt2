; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54992 () Bool)

(assert start!54992)

(declare-fun b!256939 () Bool)

(declare-fun res!215344 () Bool)

(declare-fun e!178109 () Bool)

(assert (=> b!256939 (=> (not res!215344) (not e!178109))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13927 0))(
  ( (array!13928 (arr!7095 (Array (_ BitVec 32) (_ BitVec 8))) (size!6108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11138 0))(
  ( (BitStream!11139 (buf!6630 array!13927) (currentByte!12148 (_ BitVec 32)) (currentBit!12143 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11138)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256939 (= res!215344 (validate_offset_bits!1 ((_ sign_extend 32) (size!6108 (buf!6630 thiss!1754))) ((_ sign_extend 32) (currentByte!12148 thiss!1754)) ((_ sign_extend 32) (currentBit!12143 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256942 () Bool)

(declare-fun e!178110 () Bool)

(declare-fun array_inv!5849 (array!13927) Bool)

(assert (=> b!256942 (= e!178110 (array_inv!5849 (buf!6630 thiss!1754)))))

(declare-fun res!215342 () Bool)

(assert (=> start!54992 (=> (not res!215342) (not e!178109))))

(assert (=> start!54992 (= res!215342 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54992 e!178109))

(assert (=> start!54992 true))

(declare-fun inv!12 (BitStream!11138) Bool)

(assert (=> start!54992 (and (inv!12 thiss!1754) e!178110)))

(declare-fun b!256940 () Bool)

(declare-fun res!215343 () Bool)

(assert (=> b!256940 (=> (not res!215343) (not e!178109))))

(assert (=> b!256940 (= res!215343 (= from!526 nBits!535))))

(declare-fun b!256941 () Bool)

(assert (=> b!256941 (= e!178109 false)))

(declare-fun lt!398285 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256941 (= lt!398285 (bitIndex!0 (size!6108 (buf!6630 thiss!1754)) (currentByte!12148 thiss!1754) (currentBit!12143 thiss!1754)))))

(assert (= (and start!54992 res!215342) b!256939))

(assert (= (and b!256939 res!215344) b!256940))

(assert (= (and b!256940 res!215343) b!256941))

(assert (= start!54992 b!256942))

(declare-fun m!386487 () Bool)

(assert (=> b!256939 m!386487))

(declare-fun m!386489 () Bool)

(assert (=> b!256942 m!386489))

(declare-fun m!386491 () Bool)

(assert (=> start!54992 m!386491))

(declare-fun m!386493 () Bool)

(assert (=> b!256941 m!386493))

(push 1)

(assert (not b!256941))

(assert (not start!54992))

(assert (not b!256942))

(assert (not b!256939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

