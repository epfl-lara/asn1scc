; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25340 () Bool)

(assert start!25340)

(declare-fun b!127946 () Bool)

(declare-fun e!84836 () Bool)

(declare-datatypes ((array!5890 0))(
  ( (array!5891 (arr!3280 (Array (_ BitVec 32) (_ BitVec 8))) (size!2663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4590 0))(
  ( (BitStream!4591 (buf!3021 array!5890) (currentByte!5769 (_ BitVec 32)) (currentBit!5764 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4590)

(declare-fun array_inv!2452 (array!5890) Bool)

(assert (=> b!127946 (= e!84836 (array_inv!2452 (buf!3021 thiss!1634)))))

(declare-fun b!127947 () Bool)

(declare-fun res!105871 () Bool)

(declare-fun e!84833 () Bool)

(assert (=> b!127947 (=> (not res!105871) (not e!84833))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!127947 (= res!105871 (bvslt from!447 to!404))))

(declare-fun b!127948 () Bool)

(declare-fun res!105874 () Bool)

(assert (=> b!127948 (=> (not res!105874) (not e!84833))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127948 (= res!105874 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2663 (buf!3021 thiss!1634))) ((_ sign_extend 32) (currentByte!5769 thiss!1634)) ((_ sign_extend 32) (currentBit!5764 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!127949 () Bool)

(assert (=> b!127949 (= e!84833 (or (bvsgt ((_ sign_extend 32) (size!2663 (buf!3021 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5769 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5764 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!105872 () Bool)

(assert (=> start!25340 (=> (not res!105872) (not e!84833))))

(declare-fun arr!237 () array!5890)

(assert (=> start!25340 (= res!105872 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2663 arr!237))))))

(assert (=> start!25340 e!84833))

(assert (=> start!25340 true))

(assert (=> start!25340 (array_inv!2452 arr!237)))

(declare-fun inv!12 (BitStream!4590) Bool)

(assert (=> start!25340 (and (inv!12 thiss!1634) e!84836)))

(declare-fun b!127945 () Bool)

(declare-fun res!105873 () Bool)

(assert (=> b!127945 (=> (not res!105873) (not e!84833))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127945 (= res!105873 (invariant!0 (currentBit!5764 thiss!1634) (currentByte!5769 thiss!1634) (size!2663 (buf!3021 thiss!1634))))))

(assert (= (and start!25340 res!105872) b!127948))

(assert (= (and b!127948 res!105874) b!127947))

(assert (= (and b!127947 res!105871) b!127945))

(assert (= (and b!127945 res!105873) b!127949))

(assert (= start!25340 b!127946))

(declare-fun m!193753 () Bool)

(assert (=> b!127946 m!193753))

(declare-fun m!193755 () Bool)

(assert (=> b!127948 m!193755))

(declare-fun m!193757 () Bool)

(assert (=> start!25340 m!193757))

(declare-fun m!193759 () Bool)

(assert (=> start!25340 m!193759))

(declare-fun m!193761 () Bool)

(assert (=> b!127945 m!193761))

(check-sat (not b!127946) (not start!25340) (not b!127948) (not b!127945))
(check-sat)
