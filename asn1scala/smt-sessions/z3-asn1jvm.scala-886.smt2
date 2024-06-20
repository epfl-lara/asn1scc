; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25304 () Bool)

(assert start!25304)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5869 0))(
  ( (array!5870 (arr!3271 (Array (_ BitVec 32) (_ BitVec 8))) (size!2654 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5869)

(declare-datatypes ((BitStream!4572 0))(
  ( (BitStream!4573 (buf!3012 array!5869) (currentByte!5757 (_ BitVec 32)) (currentBit!5752 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4572)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25304 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2654 arr!237)) (or (bvsgt ((_ sign_extend 32) (size!2654 (buf!3012 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5757 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5752 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!25304 true))

(declare-fun array_inv!2443 (array!5869) Bool)

(assert (=> start!25304 (array_inv!2443 arr!237)))

(declare-fun e!84739 () Bool)

(declare-fun inv!12 (BitStream!4572) Bool)

(assert (=> start!25304 (and (inv!12 thiss!1634) e!84739)))

(declare-fun b!127889 () Bool)

(assert (=> b!127889 (= e!84739 (array_inv!2443 (buf!3012 thiss!1634)))))

(assert (= start!25304 b!127889))

(declare-fun m!193683 () Bool)

(assert (=> start!25304 m!193683))

(declare-fun m!193685 () Bool)

(assert (=> start!25304 m!193685))

(declare-fun m!193687 () Bool)

(assert (=> b!127889 m!193687))

(check-sat (not start!25304) (not b!127889))
(check-sat)
