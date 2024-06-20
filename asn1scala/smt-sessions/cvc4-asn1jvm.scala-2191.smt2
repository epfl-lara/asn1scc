; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55610 () Bool)

(assert start!55610)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun b!258789 () Bool)

(declare-fun lt!400520 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun e!179497 () Bool)

(assert (=> b!258789 (= e!179497 (not (= (bvsub (bvadd lt!400520 nBits!535) from!526) lt!400520)))))

(declare-datatypes ((array!14107 0))(
  ( (array!14108 (arr!7167 (Array (_ BitVec 32) (_ BitVec 8))) (size!6180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11282 0))(
  ( (BitStream!11283 (buf!6702 array!14107) (currentByte!12319 (_ BitVec 32)) (currentBit!12314 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11282)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258789 (= lt!400520 (bitIndex!0 (size!6180 (buf!6702 thiss!1754)) (currentByte!12319 thiss!1754) (currentBit!12314 thiss!1754)))))

(declare-fun res!216783 () Bool)

(assert (=> start!55610 (=> (not res!216783) (not e!179497))))

(assert (=> start!55610 (= res!216783 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55610 e!179497))

(assert (=> start!55610 true))

(declare-fun e!179496 () Bool)

(declare-fun inv!12 (BitStream!11282) Bool)

(assert (=> start!55610 (and (inv!12 thiss!1754) e!179496)))

(declare-fun b!258790 () Bool)

(declare-fun array_inv!5921 (array!14107) Bool)

(assert (=> b!258790 (= e!179496 (array_inv!5921 (buf!6702 thiss!1754)))))

(declare-fun b!258788 () Bool)

(declare-fun res!216782 () Bool)

(assert (=> b!258788 (=> (not res!216782) (not e!179497))))

(assert (=> b!258788 (= res!216782 (= from!526 nBits!535))))

(declare-fun b!258787 () Bool)

(declare-fun res!216784 () Bool)

(assert (=> b!258787 (=> (not res!216784) (not e!179497))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258787 (= res!216784 (validate_offset_bits!1 ((_ sign_extend 32) (size!6180 (buf!6702 thiss!1754))) ((_ sign_extend 32) (currentByte!12319 thiss!1754)) ((_ sign_extend 32) (currentBit!12314 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55610 res!216783) b!258787))

(assert (= (and b!258787 res!216784) b!258788))

(assert (= (and b!258788 res!216782) b!258789))

(assert (= start!55610 b!258790))

(declare-fun m!388155 () Bool)

(assert (=> b!258789 m!388155))

(declare-fun m!388157 () Bool)

(assert (=> start!55610 m!388157))

(declare-fun m!388159 () Bool)

(assert (=> b!258790 m!388159))

(declare-fun m!388161 () Bool)

(assert (=> b!258787 m!388161))

(push 1)

(assert (not b!258790))

(assert (not b!258787))

(assert (not b!258789))

(assert (not start!55610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

