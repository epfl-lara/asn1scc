; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63632 () Bool)

(assert start!63632)

(declare-fun res!235262 () Bool)

(declare-fun e!202930 () Bool)

(assert (=> start!63632 (=> (not res!235262) (not e!202930))))

(declare-datatypes ((array!16584 0))(
  ( (array!16585 (arr!8155 (Array (_ BitVec 32) (_ BitVec 8))) (size!7159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12688 0))(
  ( (BitStream!12689 (buf!7405 array!16584) (currentByte!13725 (_ BitVec 32)) (currentBit!13720 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12688)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63632 (= res!235262 (validate_offset_bits!1 ((_ sign_extend 32) (size!7159 (buf!7405 thiss!1929))) ((_ sign_extend 32) (currentByte!13725 thiss!1929)) ((_ sign_extend 32) (currentBit!13720 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13720 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63632 e!202930))

(declare-fun e!202932 () Bool)

(declare-fun inv!12 (BitStream!12688) Bool)

(assert (=> start!63632 (and (inv!12 thiss!1929) e!202932)))

(declare-fun b!283954 () Bool)

(declare-fun res!235261 () Bool)

(assert (=> b!283954 (=> (not res!235261) (not e!202930))))

(assert (=> b!283954 (= res!235261 (= (currentBit!13720 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!283955 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283955 (= e!202930 (not (invariant!0 (currentBit!13720 thiss!1929) (currentByte!13725 thiss!1929) (size!7159 (buf!7405 thiss!1929)))))))

(declare-fun b!283956 () Bool)

(declare-fun array_inv!6852 (array!16584) Bool)

(assert (=> b!283956 (= e!202932 (array_inv!6852 (buf!7405 thiss!1929)))))

(assert (= (and start!63632 res!235262) b!283954))

(assert (= (and b!283954 res!235261) b!283955))

(assert (= start!63632 b!283956))

(declare-fun m!417081 () Bool)

(assert (=> start!63632 m!417081))

(declare-fun m!417083 () Bool)

(assert (=> start!63632 m!417083))

(declare-fun m!417085 () Bool)

(assert (=> b!283955 m!417085))

(declare-fun m!417087 () Bool)

(assert (=> b!283956 m!417087))

(push 1)

(assert (not b!283955))

(assert (not start!63632))

(assert (not b!283956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97602 () Bool)

(assert (=> d!97602 (= (invariant!0 (currentBit!13720 thiss!1929) (currentByte!13725 thiss!1929) (size!7159 (buf!7405 thiss!1929))) (and (bvsge (currentBit!13720 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13720 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13725 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13725 thiss!1929) (size!7159 (buf!7405 thiss!1929))) (and (= (currentBit!13720 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13725 thiss!1929) (size!7159 (buf!7405 thiss!1929)))))))))

(assert (=> b!283955 d!97602))

(declare-fun d!97612 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7159 (buf!7405 thiss!1929))) ((_ sign_extend 32) (currentByte!13725 thiss!1929)) ((_ sign_extend 32) (currentBit!13720 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13720 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7159 (buf!7405 thiss!1929))) ((_ sign_extend 32) (currentByte!13725 thiss!1929)) ((_ sign_extend 32) (currentBit!13720 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13720 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24659 () Bool)

(assert (= bs!24659 d!97612))

(declare-fun m!417107 () Bool)

(assert (=> bs!24659 m!417107))

(assert (=> start!63632 d!97612))

(declare-fun d!97616 () Bool)

(assert (=> d!97616 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13720 thiss!1929) (currentByte!13725 thiss!1929) (size!7159 (buf!7405 thiss!1929))))))

(declare-fun bs!24660 () Bool)

(assert (= bs!24660 d!97616))

(assert (=> bs!24660 m!417085))

(assert (=> start!63632 d!97616))

(declare-fun d!97620 () Bool)

(assert (=> d!97620 (= (array_inv!6852 (buf!7405 thiss!1929)) (bvsge (size!7159 (buf!7405 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283956 d!97620))

(push 1)

(assert (not d!97616))

(assert (not d!97612))

