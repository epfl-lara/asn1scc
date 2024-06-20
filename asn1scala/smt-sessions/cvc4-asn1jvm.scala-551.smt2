; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15882 () Bool)

(assert start!15882)

(declare-fun res!66363 () Bool)

(declare-fun e!52703 () Bool)

(assert (=> start!15882 (=> (not res!66363) (not e!52703))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15882 (= res!66363 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15882 e!52703))

(assert (=> start!15882 true))

(declare-datatypes ((array!3494 0))(
  ( (array!3495 (arr!2219 (Array (_ BitVec 32) (_ BitVec 8))) (size!1612 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2786 0))(
  ( (BitStream!2787 (buf!2002 array!3494) (currentByte!3894 (_ BitVec 32)) (currentBit!3889 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2786)

(declare-fun e!52704 () Bool)

(declare-fun inv!12 (BitStream!2786) Bool)

(assert (=> start!15882 (and (inv!12 thiss!1716) e!52704)))

(declare-fun b!80197 () Bool)

(declare-fun res!66364 () Bool)

(assert (=> b!80197 (=> (not res!66364) (not e!52703))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80197 (= res!66364 (validate_offset_bits!1 ((_ sign_extend 32) (size!1612 (buf!2002 thiss!1716))) ((_ sign_extend 32) (currentByte!3894 thiss!1716)) ((_ sign_extend 32) (currentBit!3889 thiss!1716)) nBits!516))))

(declare-fun b!80198 () Bool)

(declare-fun lt!127182 () (_ BitVec 64))

(assert (=> b!80198 (= e!52703 (and (not (= lt!127182 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127182 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80198 (= lt!127182 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80199 () Bool)

(declare-fun array_inv!1458 (array!3494) Bool)

(assert (=> b!80199 (= e!52704 (array_inv!1458 (buf!2002 thiss!1716)))))

(assert (= (and start!15882 res!66363) b!80197))

(assert (= (and b!80197 res!66364) b!80198))

(assert (= start!15882 b!80199))

(declare-fun m!125691 () Bool)

(assert (=> start!15882 m!125691))

(declare-fun m!125693 () Bool)

(assert (=> b!80197 m!125693))

(declare-fun m!125695 () Bool)

(assert (=> b!80199 m!125695))

(push 1)

(assert (not b!80197))

(assert (not b!80199))

(assert (not start!15882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

