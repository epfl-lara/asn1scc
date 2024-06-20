; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25064 () Bool)

(assert start!25064)

(declare-fun res!105252 () Bool)

(declare-fun e!83768 () Bool)

(assert (=> start!25064 (=> (not res!105252) (not e!83768))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5752 0))(
  ( (array!5753 (arr!3214 (Array (_ BitVec 32) (_ BitVec 8))) (size!2603 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5752)

(assert (=> start!25064 (= res!105252 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2603 arr!227))))))

(assert (=> start!25064 e!83768))

(assert (=> start!25064 true))

(declare-fun array_inv!2392 (array!5752) Bool)

(assert (=> start!25064 (array_inv!2392 arr!227)))

(declare-datatypes ((BitStream!4530 0))(
  ( (BitStream!4531 (buf!2988 array!5752) (currentByte!5727 (_ BitVec 32)) (currentBit!5722 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4530)

(declare-fun e!83769 () Bool)

(declare-fun inv!12 (BitStream!4530) Bool)

(assert (=> start!25064 (and (inv!12 thiss!1614) e!83769)))

(declare-fun b!126984 () Bool)

(declare-fun res!105253 () Bool)

(assert (=> b!126984 (=> (not res!105253) (not e!83768))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126984 (= res!105253 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2603 (buf!2988 thiss!1614))) ((_ sign_extend 32) (currentByte!5727 thiss!1614)) ((_ sign_extend 32) (currentBit!5722 thiss!1614)) noOfBytes!1))))

(declare-fun b!126985 () Bool)

(assert (=> b!126985 (= e!83768 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2603 (buf!2988 thiss!1614))) ((_ sign_extend 32) (currentByte!5727 thiss!1614)) ((_ sign_extend 32) (currentBit!5722 thiss!1614)) noOfBytes!1)))))

(declare-fun b!126986 () Bool)

(assert (=> b!126986 (= e!83769 (array_inv!2392 (buf!2988 thiss!1614)))))

(assert (= (and start!25064 res!105252) b!126984))

(assert (= (and b!126984 res!105253) b!126985))

(assert (= start!25064 b!126986))

(declare-fun m!192617 () Bool)

(assert (=> start!25064 m!192617))

(declare-fun m!192619 () Bool)

(assert (=> start!25064 m!192619))

(declare-fun m!192621 () Bool)

(assert (=> b!126984 m!192621))

(assert (=> b!126985 m!192621))

(declare-fun m!192623 () Bool)

(assert (=> b!126986 m!192623))

(check-sat (not start!25064) (not b!126986) (not b!126984) (not b!126985))
