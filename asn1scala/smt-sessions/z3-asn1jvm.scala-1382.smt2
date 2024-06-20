; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38162 () Bool)

(assert start!38162)

(declare-fun res!142365 () Bool)

(declare-fun e!120059 () Bool)

(assert (=> start!38162 (=> (not res!142365) (not e!120059))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38162 (= res!142365 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38162 e!120059))

(assert (=> start!38162 true))

(declare-datatypes ((array!9191 0))(
  ( (array!9192 (arr!4991 (Array (_ BitVec 32) (_ BitVec 8))) (size!4061 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7230 0))(
  ( (BitStream!7231 (buf!4489 array!9191) (currentByte!8526 (_ BitVec 32)) (currentBit!8521 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7230)

(declare-fun e!120060 () Bool)

(declare-fun inv!12 (BitStream!7230) Bool)

(assert (=> start!38162 (and (inv!12 thiss!1817) e!120060)))

(declare-fun b!171799 () Bool)

(declare-fun res!142364 () Bool)

(assert (=> b!171799 (=> (not res!142364) (not e!120059))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171799 (= res!142364 (validate_offset_bits!1 ((_ sign_extend 32) (size!4061 (buf!4489 thiss!1817))) ((_ sign_extend 32) (currentByte!8526 thiss!1817)) ((_ sign_extend 32) (currentBit!8521 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!171800 () Bool)

(assert (=> b!171800 (= e!120059 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4061 (buf!4489 thiss!1817))) ((_ sign_extend 32) (currentByte!8526 thiss!1817)) ((_ sign_extend 32) (currentBit!8521 thiss!1817)) ((_ sign_extend 32) nBits!575))))))

(declare-fun b!171801 () Bool)

(declare-fun array_inv!3802 (array!9191) Bool)

(assert (=> b!171801 (= e!120060 (array_inv!3802 (buf!4489 thiss!1817)))))

(assert (= (and start!38162 res!142365) b!171799))

(assert (= (and b!171799 res!142364) b!171800))

(assert (= start!38162 b!171801))

(declare-fun m!271043 () Bool)

(assert (=> start!38162 m!271043))

(declare-fun m!271045 () Bool)

(assert (=> b!171799 m!271045))

(assert (=> b!171800 m!271045))

(declare-fun m!271047 () Bool)

(assert (=> b!171801 m!271047))

(check-sat (not start!38162) (not b!171799) (not b!171801) (not b!171800))
(check-sat)
