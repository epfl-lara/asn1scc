; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42420 () Bool)

(assert start!42420)

(declare-fun res!167826 () Bool)

(declare-fun e!137512 () Bool)

(assert (=> start!42420 (=> (not res!167826) (not e!137512))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42420 (= res!167826 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42420 e!137512))

(assert (=> start!42420 true))

(declare-datatypes ((array!10134 0))(
  ( (array!10135 (arr!5394 (Array (_ BitVec 32) (_ BitVec 8))) (size!4464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8036 0))(
  ( (BitStream!8037 (buf!4965 array!10134) (currentByte!9327 (_ BitVec 32)) (currentBit!9322 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8036)

(declare-fun e!137511 () Bool)

(declare-fun inv!12 (BitStream!8036) Bool)

(assert (=> start!42420 (and (inv!12 thiss!1204) e!137511)))

(declare-fun b!200463 () Bool)

(declare-fun res!167825 () Bool)

(assert (=> b!200463 (=> (not res!167825) (not e!137512))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200463 (= res!167825 (validate_offset_bits!1 ((_ sign_extend 32) (size!4464 (buf!4965 thiss!1204))) ((_ sign_extend 32) (currentByte!9327 thiss!1204)) ((_ sign_extend 32) (currentBit!9322 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200464 () Bool)

(assert (=> b!200464 (= e!137512 (and (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000))) (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-fun b!200465 () Bool)

(declare-fun array_inv!4205 (array!10134) Bool)

(assert (=> b!200465 (= e!137511 (array_inv!4205 (buf!4965 thiss!1204)))))

(assert (= (and start!42420 res!167826) b!200463))

(assert (= (and b!200463 res!167825) b!200464))

(assert (= start!42420 b!200465))

(declare-fun m!311281 () Bool)

(assert (=> start!42420 m!311281))

(declare-fun m!311283 () Bool)

(assert (=> b!200463 m!311283))

(declare-fun m!311285 () Bool)

(assert (=> b!200465 m!311285))

(push 1)

(assert (not b!200463))

(assert (not start!42420))

(assert (not b!200465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

