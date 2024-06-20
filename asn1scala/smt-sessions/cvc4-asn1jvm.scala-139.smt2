; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3300 () Bool)

(assert start!3300)

(declare-fun res!13715 () Bool)

(declare-fun e!9133 () Bool)

(assert (=> start!3300 (=> (not res!13715) (not e!9133))))

(declare-fun nBytes!1 () (_ BitVec 32))

(assert (=> start!3300 (= res!13715 (bvsge nBytes!1 #b00000000000000000000000000000000))))

(assert (=> start!3300 e!9133))

(assert (=> start!3300 true))

(declare-datatypes ((array!847 0))(
  ( (array!848 (arr!789 (Array (_ BitVec 32) (_ BitVec 8))) (size!360 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!680 0))(
  ( (BitStream!681 (buf!711 array!847) (currentByte!1857 (_ BitVec 32)) (currentBit!1852 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!680)

(declare-fun e!9134 () Bool)

(declare-fun inv!12 (BitStream!680) Bool)

(assert (=> start!3300 (and (inv!12 thiss!1862) e!9134)))

(declare-fun b!14640 () Bool)

(declare-fun res!13714 () Bool)

(assert (=> b!14640 (=> (not res!13714) (not e!9133))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!14640 (= res!13714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!360 (buf!711 thiss!1862))) ((_ sign_extend 32) (currentByte!1857 thiss!1862)) ((_ sign_extend 32) (currentBit!1852 thiss!1862)) nBytes!1))))

(declare-fun b!14641 () Bool)

(assert (=> b!14641 (= e!9133 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!360 (buf!711 thiss!1862))) ((_ sign_extend 32) (currentByte!1857 thiss!1862)) ((_ sign_extend 32) (currentBit!1852 thiss!1862)) nBytes!1)))))

(declare-fun b!14642 () Bool)

(declare-fun array_inv!349 (array!847) Bool)

(assert (=> b!14642 (= e!9134 (array_inv!349 (buf!711 thiss!1862)))))

(assert (= (and start!3300 res!13715) b!14640))

(assert (= (and b!14640 res!13714) b!14641))

(assert (= start!3300 b!14642))

(declare-fun m!21071 () Bool)

(assert (=> start!3300 m!21071))

(declare-fun m!21073 () Bool)

(assert (=> b!14640 m!21073))

(assert (=> b!14641 m!21073))

(declare-fun m!21075 () Bool)

(assert (=> b!14642 m!21075))

(push 1)

(assert (not start!3300))

(assert (not b!14642))

(assert (not b!14641))

(assert (not b!14640))

(check-sat)

