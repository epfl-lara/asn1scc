; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25066 () Bool)

(assert start!25066)

(declare-fun res!105259 () Bool)

(declare-fun e!83780 () Bool)

(assert (=> start!25066 (=> (not res!105259) (not e!83780))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5754 0))(
  ( (array!5755 (arr!3215 (Array (_ BitVec 32) (_ BitVec 8))) (size!2604 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5754)

(assert (=> start!25066 (= res!105259 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2604 arr!227))))))

(assert (=> start!25066 e!83780))

(assert (=> start!25066 true))

(declare-fun array_inv!2393 (array!5754) Bool)

(assert (=> start!25066 (array_inv!2393 arr!227)))

(declare-datatypes ((BitStream!4532 0))(
  ( (BitStream!4533 (buf!2989 array!5754) (currentByte!5728 (_ BitVec 32)) (currentBit!5723 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4532)

(declare-fun e!83783 () Bool)

(declare-fun inv!12 (BitStream!4532) Bool)

(assert (=> start!25066 (and (inv!12 thiss!1614) e!83783)))

(declare-fun b!126993 () Bool)

(declare-fun res!105258 () Bool)

(assert (=> b!126993 (=> (not res!105258) (not e!83780))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126993 (= res!105258 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2604 (buf!2989 thiss!1614))) ((_ sign_extend 32) (currentByte!5728 thiss!1614)) ((_ sign_extend 32) (currentBit!5723 thiss!1614)) noOfBytes!1))))

(declare-fun b!126994 () Bool)

(assert (=> b!126994 (= e!83780 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2604 (buf!2989 thiss!1614))) ((_ sign_extend 32) (currentByte!5728 thiss!1614)) ((_ sign_extend 32) (currentBit!5723 thiss!1614)) noOfBytes!1)))))

(declare-fun b!126995 () Bool)

(assert (=> b!126995 (= e!83783 (array_inv!2393 (buf!2989 thiss!1614)))))

(assert (= (and start!25066 res!105259) b!126993))

(assert (= (and b!126993 res!105258) b!126994))

(assert (= start!25066 b!126995))

(declare-fun m!192625 () Bool)

(assert (=> start!25066 m!192625))

(declare-fun m!192627 () Bool)

(assert (=> start!25066 m!192627))

(declare-fun m!192629 () Bool)

(assert (=> b!126993 m!192629))

(assert (=> b!126994 m!192629))

(declare-fun m!192631 () Bool)

(assert (=> b!126995 m!192631))

(push 1)

(assert (not b!126993))

(assert (not b!126994))

(assert (not start!25066))

(assert (not b!126995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

