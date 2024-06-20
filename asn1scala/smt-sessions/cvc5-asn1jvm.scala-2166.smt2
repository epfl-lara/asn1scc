; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54988 () Bool)

(assert start!54988)

(declare-fun b!256915 () Bool)

(declare-fun res!215324 () Bool)

(declare-fun e!178093 () Bool)

(assert (=> b!256915 (=> (not res!215324) (not e!178093))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13923 0))(
  ( (array!13924 (arr!7093 (Array (_ BitVec 32) (_ BitVec 8))) (size!6106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11134 0))(
  ( (BitStream!11135 (buf!6628 array!13923) (currentByte!12146 (_ BitVec 32)) (currentBit!12141 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11134)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256915 (= res!215324 (validate_offset_bits!1 ((_ sign_extend 32) (size!6106 (buf!6628 thiss!1754))) ((_ sign_extend 32) (currentByte!12146 thiss!1754)) ((_ sign_extend 32) (currentBit!12141 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256917 () Bool)

(assert (=> b!256917 (= e!178093 false)))

(declare-fun lt!398279 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256917 (= lt!398279 (bitIndex!0 (size!6106 (buf!6628 thiss!1754)) (currentByte!12146 thiss!1754) (currentBit!12141 thiss!1754)))))

(declare-fun b!256916 () Bool)

(declare-fun res!215326 () Bool)

(assert (=> b!256916 (=> (not res!215326) (not e!178093))))

(assert (=> b!256916 (= res!215326 (= from!526 nBits!535))))

(declare-fun res!215325 () Bool)

(assert (=> start!54988 (=> (not res!215325) (not e!178093))))

(assert (=> start!54988 (= res!215325 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54988 e!178093))

(assert (=> start!54988 true))

(declare-fun e!178091 () Bool)

(declare-fun inv!12 (BitStream!11134) Bool)

(assert (=> start!54988 (and (inv!12 thiss!1754) e!178091)))

(declare-fun b!256918 () Bool)

(declare-fun array_inv!5847 (array!13923) Bool)

(assert (=> b!256918 (= e!178091 (array_inv!5847 (buf!6628 thiss!1754)))))

(assert (= (and start!54988 res!215325) b!256915))

(assert (= (and b!256915 res!215324) b!256916))

(assert (= (and b!256916 res!215326) b!256917))

(assert (= start!54988 b!256918))

(declare-fun m!386471 () Bool)

(assert (=> b!256915 m!386471))

(declare-fun m!386473 () Bool)

(assert (=> b!256917 m!386473))

(declare-fun m!386475 () Bool)

(assert (=> start!54988 m!386475))

(declare-fun m!386477 () Bool)

(assert (=> b!256918 m!386477))

(push 1)

(assert (not start!54988))

(assert (not b!256917))

(assert (not b!256918))

(assert (not b!256915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

