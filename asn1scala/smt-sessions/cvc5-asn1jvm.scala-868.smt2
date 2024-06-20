; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25062 () Bool)

(assert start!25062)

(declare-fun res!105246 () Bool)

(declare-fun e!83759 () Bool)

(assert (=> start!25062 (=> (not res!105246) (not e!83759))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5750 0))(
  ( (array!5751 (arr!3213 (Array (_ BitVec 32) (_ BitVec 8))) (size!2602 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5750)

(assert (=> start!25062 (= res!105246 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2602 arr!227))))))

(assert (=> start!25062 e!83759))

(assert (=> start!25062 true))

(declare-fun array_inv!2391 (array!5750) Bool)

(assert (=> start!25062 (array_inv!2391 arr!227)))

(declare-datatypes ((BitStream!4528 0))(
  ( (BitStream!4529 (buf!2987 array!5750) (currentByte!5726 (_ BitVec 32)) (currentBit!5721 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4528)

(declare-fun e!83756 () Bool)

(declare-fun inv!12 (BitStream!4528) Bool)

(assert (=> start!25062 (and (inv!12 thiss!1614) e!83756)))

(declare-fun b!126975 () Bool)

(declare-fun res!105247 () Bool)

(assert (=> b!126975 (=> (not res!105247) (not e!83759))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126975 (= res!105247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2602 (buf!2987 thiss!1614))) ((_ sign_extend 32) (currentByte!5726 thiss!1614)) ((_ sign_extend 32) (currentBit!5721 thiss!1614)) noOfBytes!1))))

(declare-fun b!126976 () Bool)

(assert (=> b!126976 (= e!83759 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2602 (buf!2987 thiss!1614))) ((_ sign_extend 32) (currentByte!5726 thiss!1614)) ((_ sign_extend 32) (currentBit!5721 thiss!1614)) noOfBytes!1)))))

(declare-fun b!126977 () Bool)

(assert (=> b!126977 (= e!83756 (array_inv!2391 (buf!2987 thiss!1614)))))

(assert (= (and start!25062 res!105246) b!126975))

(assert (= (and b!126975 res!105247) b!126976))

(assert (= start!25062 b!126977))

(declare-fun m!192609 () Bool)

(assert (=> start!25062 m!192609))

(declare-fun m!192611 () Bool)

(assert (=> start!25062 m!192611))

(declare-fun m!192613 () Bool)

(assert (=> b!126975 m!192613))

(assert (=> b!126976 m!192613))

(declare-fun m!192615 () Bool)

(assert (=> b!126977 m!192615))

(push 1)

(assert (not b!126976))

(assert (not b!126977))

(assert (not start!25062))

(assert (not b!126975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

