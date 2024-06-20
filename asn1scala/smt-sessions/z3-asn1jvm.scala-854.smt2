; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24744 () Bool)

(assert start!24744)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5654 0))(
  ( (array!5655 (arr!3154 (Array (_ BitVec 32) (_ BitVec 8))) (size!2561 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5654)

(declare-datatypes ((BitStream!4446 0))(
  ( (BitStream!4447 (buf!2937 array!5654) (currentByte!5648 (_ BitVec 32)) (currentBit!5643 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4446)

(assert (=> start!24744 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2561 arr!227)) (or (bvsgt ((_ sign_extend 32) (size!2561 (buf!2937 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5648 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5643 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!24744 true))

(declare-fun array_inv!2350 (array!5654) Bool)

(assert (=> start!24744 (array_inv!2350 arr!227)))

(declare-fun e!82621 () Bool)

(declare-fun inv!12 (BitStream!4446) Bool)

(assert (=> start!24744 (and (inv!12 thiss!1614) e!82621)))

(declare-fun b!125615 () Bool)

(assert (=> b!125615 (= e!82621 (array_inv!2350 (buf!2937 thiss!1614)))))

(assert (= start!24744 b!125615))

(declare-fun m!190965 () Bool)

(assert (=> start!24744 m!190965))

(declare-fun m!190967 () Bool)

(assert (=> start!24744 m!190967))

(declare-fun m!190969 () Bool)

(assert (=> b!125615 m!190969))

(check-sat (not start!24744) (not b!125615))
(check-sat)
